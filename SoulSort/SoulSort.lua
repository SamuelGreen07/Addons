local f = CreateFrame("Frame", "SoulSort", UIParent)
f:RegisterEvent("PLAYER_REGEN_ENABLED")
f:RegisterEvent("BAG_UPDATE")
f:RegisterEvent("ADDON_LOADED")
f:Hide()

f:SetScript("OnEvent", function(self, event, arg1, arg2, ...)
	if event == "ADDON_LOADED" and arg1 == "SoulSort" then 
		InitSoulShardCounter()
	elseif event == "PLAYER_REGEN_ENABLED" and AUTO_SORT == true then
		SortShards()
	elseif event == "BAG_UPDATE" then
		UpdateShardCount()
	end
end)

SLASH_SOULSORT1 = "/soulsort"
SLASH_SOULSORT2 = "/ss"
SlashCmdList["SOULSORT"] = function(msg)
	local tokens = tokenize(msg)
	if table.getn(tokens) > 0 then
		if strlower(tokens[1]) == "sort" then
			if not InCombatLockdown() then
				SortShards()
				print("SoulSort: Sorting your Souls!")
			else
				print("SoulSort: Cannot sort while in combat!")
			end
		elseif strlower(tokens[1]) == "max" then
			if table.getn(tokens) > 1 then
				argument = tonumber(tokens[2])
				if argument and argument == math.floor(argument) and argument >= 0 then
					MAX_SHARDS = argument
					AUTO_MAX = false
					print("SoulSort: Max number of Soul Shards to keep set to", MAX_SHARDS)
				else
					print("SoulSort: No number or invalid number provided.") 
					print("Use \"/ss max [number]\", 0 = infinite")
					if AUTO_MAX == true then
						print("Current maximum:", MAX_SHARDS, "(AutoMax is on)")
					else
						print("Current maximum:", MAX_SHARDS)
					end
				end
			else
				print("SoulSort: No number provided.")
				print("Use \"/ss max [number]\", 0 = infinite")
				if AUTO_MAX == true then
					print("Current maximum:", MAX_SHARDS, "(AutoMax is on)")
				else
					print("Current maximum:", MAX_SHARDS)
				end
			end
		elseif strlower(tokens[1]) == "autosort" then
			if table.getn(tokens) > 1 then
				if tokens[2] == "on" or  tokens[2] == "true" then
					AUTO_SORT = true
					print("SoulSort: Autosort Enabled")
				elseif tokens[2] == "off" or  tokens[2] == "false" then
					AUTO_SORT = false
					print("SoulSort: Autosort Disabled")
				else
					print("SoulSort: No option provided. Use \"/ss autosort [on/off]\"")
				end
			else
				print("SoulSort: No option provided. Use \"/ss autosort [on/off]\"")
			end
		elseif strlower(tokens[1]) == "automax" then
			if table.getn(tokens) > 1 then
				if tokens[2] == "on" or  tokens[2] == "true" then
					AUTO_MAX = true
					print("SoulSort: AutoMax Enabled")
				elseif tokens[2] == "off" or  tokens[2] == "false" then
					AUTO_MAX = false
					print("SoulSort: AutoMax Disabled")
				else
					print("SoulSort: No option provided. Use \"/ss automax [on/off]\"")
				end
			else
				print("SoulSort: No option provided. Use \"/ss automax [on/off]\"")
			end
		elseif strlower(tokens[1]) == "counter" or strlower(tokens[1]) == "count" then
			if table.getn(tokens) > 1 then
				if tokens[2] == "on" or  tokens[2] == "true" then
					SHOW_COUNTER = true
					SoulShardCounterString:Show()
					print("SoulSort: Counter Enabled")
				elseif tokens[2] == "off" or  tokens[2] == "false" then
					SHOW_COUNTER = false
					SoulShardCounterString:Hide()
					print("SoulSort: Counter Disabled")
				else
					print("SoulSort: No option provided. Use \"/ss counter [on/off]\"")
				end
			else
				print("SoulSort: No option provided. Use \"/ss counter [on/off]\"")
			end
		end
	else
		print("SoulSort Functions:")
		print("    /ss sort - Sorts your Soul Shards to the back of your inventory.")
		print("    /ss max [number] - Set the max number of Soul Shards to keep.")
		print("    /ss autosort [on/off] - Toggle automatic sorting when you leave combat.")
		print("    /ss automax [on/off] - Toggle automatic max Soul Shards. This will fill your Soul Bag(s) or your last bag.")
		print("    /ss counter [on/off] - Toggles the Soul Shard counter on your bag bar.")
	end
end


------Saved Variables------
MAX_SHARDS = 0
AUTO_MAX = false
AUTO_SORT = true
SHOW_COUNTER = true
---------------------------

DeletedList = {}
DeletedListCount = 0

SwapList = {}
SwapListCount = 0

SoulShardCounterString = nil

function tokenize(str)
	local tbl = {};
	for v in string.gmatch(str, "[^ ]+") do
		tinsert(tbl, v);
	end
	return tbl;
end

function SortShards()
	PrepareSort()

	if AUTO_MAX then
		CalculateAutoSize()
	end

	DeleteExcessShards()
	PreCalculateSort()
	ExecuteSort()
	CleanUp()
end

function PrepareSort()
	ClearCursor()

	SwapListCount=0
	for k in pairs(SwapList) do
	    SwapList[k] = nil
	end

	DeletedListCount=0
	for k in pairs(DeletedList) do
	    DeletedList[k] = nil
	end
end

function CleanUp()
	ClearCursor()
end

function PreCalculateSort()
	for sourceBag=0,4 do
		for sourceSlot=GetContainerNumSlots(sourceBag),1,-1 do 
			if not IsShardDeleted(sourceBag, sourceSlot) then
				if GetContainerItemID(sourceBag, sourceSlot)==6265 then
					local slotFound = false
					for destinationBag=1,0,-1 do 
						for destinationSlot=1,GetContainerNumSlots(destinationBag) do
							if IsSameSlot(sourceBag, sourceSlot, destinationBag, destinationSlot) then
								slotFound = true
								break
							elseif GetContainerItemID(destinationBag, destinationSlot)~=6265 then
								if SlotIsNotTaken(destinationBag, destinationSlot) then
									AddToSwapList(sourceBag, sourceSlot, destinationBag, destinationSlot)
									slotFound = true
									break
								end
							end
						end
						if slotFound == true then
							break;
						end
					end
				end
			end
		end
	end
end

function ExecuteSort()
	for i=0,SwapListCount-1 do
		PickupContainerItem(SwapList[i].sourceBag, SwapList[i].sourceSlot)
		PickupContainerItem(SwapList[i].destinationBag, SwapList[i].destinationSlot)
		--print("Swapping:", SwapList[i].sourceBag, SwapList[i].sourceSlot, SwapList[i].destinationBag, SwapList[i].destinationSlot)
	end
end

function AddToSwapList(aSourceBag, aSourceSlot, aDestinationBag, aDestinationSlot)
	SwapList[SwapListCount] = 
	{ 
		sourceBag = aSourceBag, 
		sourceSlot = aSourceSlot, 
		destinationBag = aDestinationBag, 
		destinationSlot = aDestinationSlot
	}
	SwapListCount = SwapListCount+1
	--print("Adding to SwapList:", aSourceBag, aSourceSlot, aDestinationBag, aDestinationSlot)
end

function IsSameSlot(aSourceBag, aSourceSlot, aDestinationBag, aDestinationSlot)
	if aSourceBag == aDestinationBag and aSourceSlot == aDestinationSlot then
		return true
	else
		return false
	end
end

function SlotIsNotTaken(aDestinationBag, aDestinationSlot)
	for i=0,SwapListCount do
		if SwapList[i] then
			if SwapList[i].destinationBag == aDestinationBag and SwapList[i].destinationSlot == aDestinationSlot then
				--print("SlotIsNotTaken returning false:", aDestinationBag, aDestinationSlot)
				return false
			end
		end
	end
	return true
end

function IsShardDeleted(bag, slot)
	for i=0,DeletedListCount-1 do
		if DeletedList[i].bag == bag and DeletedList[i].slot == slot then
			return true
		end
	end
	return false
end

function DeleteExcessShards()
	if MAX_SHARDS == 0 then return end

	local numShards = 0
	for bag=4,0,-1 do 
		for slot=GetContainerNumSlots(bag),1,-1 do
			if GetContainerItemID(bag, slot)==6265 then
				if numShards >= MAX_SHARDS then
					PickupContainerItem(bag, slot)
					_, cursorItemID = GetCursorInfo()
					if cursorItemID == 6265 then
						DeleteCursorItem()
						DeletedList[DeletedListCount] = { bag=bag, slot=slot}
						DeletedListCount = DeletedListCount + 1
					else
						ClearCursor()
					end
				else
					numShards = numShards+1
				end
			end
		end
	end
end

function CalculateAutoSize()
	MAX_SHARDS = 0
	hasSoulBag = false
	for bag=1,4 do
		bagName = GetBagName(bag)
		if bagName and IsSoulBag(bagName) then
			hasSoulBag = true
			MAX_SHARDS = MAX_SHARDS + GetContainerNumSlots(bag)
		end
	end
	if not hasSoulBag then
		for bag=4,1,-1 do
			numSlots = GetContainerNumSlots(bag)
			if numSlots > 0 then
				MAX_SHARDS = numSlots
				break
			end
		end
	end
end

function IsSoulBag(bagName)
	if bagName:find("Soul") or bagName:find("Felcloth") or bagName:find("D'Sak's") then
		return true
	else
		return false
	end
end

function UpdateShardCount()
	local numShards = 0
	for bag=0,4 do 
		for slot=1,GetContainerNumSlots(bag) do
			if GetContainerItemID(bag, slot)==6265 then
				numShards = numShards+1
			end
		end
	end
	SoulShardCounterString:SetText(numShards) 
end

function InitSoulShardCounter()
	SoulShardCounterString = CharacterBag3Slot:CreateFontString()
	font = NumberFontNormal:GetFont() 
	SoulShardCounterString:SetFont(font, 14, "OUTLINE") 
	SoulShardCounterString:SetPoint("LEFT", CharacterBag3Slot, "BOTTOMLEFT",4,8)

	UpdateShardCount()

	if SHOW_COUNTER then
		SoulShardCounterString:Show()
	else
		SoulShardCounterString:Hide()
	end
end