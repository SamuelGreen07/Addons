-- By D4KiR
local AddonName, SpecBisTooltip = ...
local debug = false
local validEquipSlots = {"INVTYPE_HEAD", "INVTYPE_NECK", "INVTYPE_SHOULDER", "INVTYPE_CLOAK", "INVTYPE_ROBE", "INVTYPE_CHEST", "INVTYPE_WRIST", "INVTYPE_HAND", "INVTYPE_WAIST", "INVTYPE_LEGS", "INVTYPE_FEET", "INVTYPE_FINGER", "INVTYPE_TRINKET", "INVTYPE_WEAPON", "INVTYPE_2HWEAPON", "INVTYPE_WEAPONMAINHAND", "INVTYPE_WEAPONOFFHAND", "INVTYPE_HOLDABLE", "INVTYPE_RANGED", "INVTYPE_RANGEDRIGHT", "INVTYPE_AMMO", "INVTYPE_THROWN", "INVTYPE_SHIELD", "INVTYPE_QUIVER", "INVTYPE_RELIC",}
local invalidEquipSlots = {}
invalidEquipSlots["INVTYPE_TABARD"] = true
invalidEquipSlots["INVTYPE_BODY"] = true
invalidEquipSlots["INVTYPE_BAG"] = true
invalidEquipSlots["INVTYPE_NON_EQUIP_IGNORE"] = true
local SBTSetup = CreateFrame("FRAME", "SBTSetup")
SBTSetup:RegisterEvent("PLAYER_LOGIN")
SBTSetup:SetScript(
	"OnEvent",
	function(self, event, ...)
		if event == "PLAYER_LOGIN" then
			SpecBisTooltip:AddSlash("sbt", SpecBisTooltip.ToggleSettings)
			SpecBisTooltip:AddSlash("specbistooltip", SpecBisTooltip.ToggleSettings)
			C_Timer.After(
				0,
				function()
					local mmbtn = nil
					SpecBisTooltip:CreateMinimapButton(
						{
							["name"] = "SpecBisTooltip",
							["icon"] = 136031,
							["var"] = mmbtn,
							["dbtab"] = SBTTAB,
							["vTT"] = {{"SpecBisTooltip |T136031:16:16:0:0|t", "v|cff3FC7EB0.10.39"}, {"Leftclick", "Open Settings"}, {"Rightclick", "Hide Minimap Icon"}},
							["funcL"] = function()
								SpecBisTooltip:ToggleSettings()
							end,
							["funcR"] = function()
								SpecBisTooltip:HideMMBtn("SpecBisTooltip")
							end,
							["funcSR"] = function()
								SpecBisTooltip:SV(SBTTAB, "SHOWMINIMAPBUTTON", false)
								SpecBisTooltip:MSG("Minimap Button is now hidden.")
								SpecBisTooltip:HideMMBtn("SpecBisTooltip")
							end,
						}
					)

					if SpecBisTooltip:GV(SBTTAB, "SHOWMINIMAPBUTTON", SpecBisTooltip:GetWoWBuild() ~= "RETAIL") then
						SpecBisTooltip:ShowMMBtn("SpecBisTooltip")
					else
						SpecBisTooltip:HideMMBtn("SpecBisTooltip")
					end
				end
			)

			SpecBisTooltip:InitSettings()
		end
	end
)

local sbt_settings = nil
function SpecBisTooltip:ToggleSettings()
	if sbt_settings then
		if sbt_settings:IsShown() then
			sbt_settings:Hide()
		else
			sbt_settings:Show()
		end
	end
end

function SpecBisTooltip:InitSettings()
	SBTTAB = SBTTAB or {}
	SpecBisTooltip:SetVersion(AddonName, 136031, "0.10.39")
	sbt_settings = SpecBisTooltip:CreateFrame(
		{
			["name"] = "SpecBisTooltip",
			["pTab"] = {"CENTER"},
			["sw"] = 520,
			["sh"] = 520,
			["title"] = format("SpecBisTooltip |T136031:16:16:0:0|t v|cff3FC7EB%s", "0.10.39")
		}
	)

	local y = -30
	if SBTTAB["SHOWMINIMAPBUTTON"] == nil then
		SBTTAB["SHOWMINIMAPBUTTON"] = SpecBisTooltip:GetWoWBuild() ~= "RETAIL"
	end

	SpecBisTooltip:AddCategory(
		{
			["name"] = "LID_GENERAL",
			["parent"] = sbt_settings,
			["pTab"] = {"TOPLEFT", 10, y},
		}
	)

	y = y - 15
	SpecBisTooltip:CreateCheckbox(
		{
			["name"] = "LID_SHOWMINIMAPBUTTON",
			["parent"] = sbt_settings,
			["pTab"] = {"TOPLEFT", 10, y},
			["value"] = SBTTAB["SHOWMINIMAPBUTTON"],
			["funcV"] = function(sel, checked)
				SBTTAB["SHOWMINIMAPBUTTON"] = checked
				if SBTTAB["SHOWMINIMAPBUTTON"] then
					SpecBisTooltip:ShowMMBtn("SpecBisTooltip")
				else
					SpecBisTooltip:HideMMBtn("SpecBisTooltip")
				end
			end
		}
	)

	y = y - 20
	if SBTTAB["SHOWPREBIS"] == nil then
		SBTTAB["SHOWPREBIS"] = true
	end

	SpecBisTooltip:CreateCheckbox(
		{
			["name"] = "LID_SHOWPREBIS",
			["parent"] = sbt_settings,
			["pTab"] = {"TOPLEFT", 10, y},
			["value"] = SBTTAB["SHOWPREBIS"],
			["funcV"] = function(sel, checked)
				SBTTAB["SHOWPREBIS"] = checked
			end
		}
	)

	y = y - 20
	if SBTTAB["SHOWOLDERPHASES"] == nil then
		SBTTAB["SHOWOLDERPHASES"] = true
	end

	SpecBisTooltip:CreateCheckbox(
		{
			["name"] = "LID_SHOWOLDERPHASES",
			["parent"] = sbt_settings,
			["pTab"] = {"TOPLEFT", 10, y},
			["value"] = SBTTAB["SHOWOLDERPHASES"],
			["funcV"] = function(sel, checked)
				SBTTAB["SHOWOLDERPHASES"] = checked
			end
		}
	)

	y = y - 20
	if SBTTAB["SHOWOTHERSPECS"] == nil then
		SBTTAB["SHOWOTHERSPECS"] = true
	end

	SpecBisTooltip:CreateCheckbox(
		{
			["name"] = "LID_SHOWOTHERSPECS",
			["parent"] = sbt_settings,
			["pTab"] = {"TOPLEFT", 10, y},
			["value"] = SBTTAB["SHOWOTHERSPECS"],
			["funcV"] = function(sel, checked)
				SBTTAB["SHOWOTHERSPECS"] = checked
			end
		}
	)

	y = y - 20
	if SBTTAB["SHOWOTHERCLASSES"] == nil then
		SBTTAB["SHOWOTHERCLASSES"] = false
	end

	SpecBisTooltip:CreateCheckbox(
		{
			["name"] = "LID_SHOWOTHERCLASSES",
			["parent"] = sbt_settings,
			["pTab"] = {"TOPLEFT", 10, y},
			["value"] = SBTTAB["SHOWOTHERCLASSES"],
			["funcV"] = function(sel, checked)
				SBTTAB["SHOWOTHERCLASSES"] = checked
			end
		}
	)

	y = y - 20
	if SBTTAB["SHOWNOTBIS"] == nil then
		SBTTAB["SHOWNOTBIS"] = true
	end

	SpecBisTooltip:CreateCheckbox(
		{
			["name"] = "LID_SHOWNOTBIS",
			["parent"] = sbt_settings,
			["pTab"] = {"TOPLEFT", 10, y},
			["value"] = SBTTAB["SHOWNOTBIS"],
			["funcV"] = function(sel, checked)
				SBTTAB["SHOWNOTBIS"] = checked
			end
		}
	)
end

local once = true
function SpecBisTooltip:GetItemTyp(class, specId, itemId)
	if itemId == nil then return "NOTBIS", nil end
	local _, _, _, _, _, _, _, _, itemEquipLoc, _, _, _, _, _, _, _, _ = GetItemInfo(itemId)
	if SpecBisTooltip:GetBisTable()[SpecBisTooltip:GetWoWBuild()][class] == nil then
		if once then
			once = false
			SpecBisTooltip:MSG("Missing Class: " .. class)
		end

		return
	end

	if SpecBisTooltip:GetBisTable()[SpecBisTooltip:GetWoWBuild()][class][specId] == nil then
		if once then
			once = false
			SpecBisTooltip:MSG("Missing Spec for Class: " .. class .. " OR no spec selected")
		end

		return
	end

	if itemEquipLoc ~= nil and tContains(validEquipSlots, itemEquipLoc) and SpecBisTooltip:GetBisTable()[SpecBisTooltip:GetWoWBuild()][class][specId] and SpecBisTooltip:GetBisTable()[SpecBisTooltip:GetWoWBuild()][class][specId][itemId] then return SpecBisTooltip:GetBisTable()[SpecBisTooltip:GetWoWBuild()][class][specId][itemId][1], SpecBisTooltip:GetBisTable()[SpecBisTooltip:GetWoWBuild()][class][specId][itemId][2] end

	return "NOTBIS", nil
end

function SpecBisTooltip:GetSpecItemTyp(itemId, specId)
	local _, engClass = UnitClass("PLAYER")
	if engClass and specId then return SpecBisTooltip:GetItemTyp(engClass, specId, itemId) end

	return nil, nil
end

function SpecBisTooltip:GetTalentInfo()
	local specid, icon
	if GetSpecialization then
		specid = GetSpecialization()
		if GetSpecializationInfo then
			_, _, _, icon = GetSpecializationInfo(specid)
		end

		return specid, icon
	else
		local ps = 0
		for i = 1, 4 do
			local _, _, _, iconTexture, pointsSpent = GetTalentTabInfo(i)
			if pointsSpent ~= nil and pointsSpent > ps then
				ps = pointsSpent
				specid = i
				icon = iconTexture
				local _, class = UnitClass("PLAYER")
				if GetActiveTalentGroup and class == "DRUID" and SpecBisTooltip:GetWoWBuild() ~= "CATA" then
					local group = GetActiveTalentGroup()
					local role = GetTalentGroupRole(group)
					if role == "DAMAGER" then
						specid = 2
						icon = 132115
					elseif role == "TANK" then
						specid = 3
					end
				end
			end

			if icon == nil then
				local _, class = UnitClass("PLAYER")
				icon = SpecBisTooltip:GetSpecIcon(class, specid)
				if icon == nil then
					if class == "DRUID" then
						icon = 625999
					elseif class == "HUNTER" then
						icon = 626000
					elseif class == "MAGE" then
						icon = 626001
					elseif class == "PALADIN" then
						if specid == 1 then
							icon = 135920
						elseif specid == 2 then
							icon = 135893
						elseif specid == 3 then
							icon = 135873
						end
					elseif class == "PRIEST" then
						icon = 626004
					elseif class == "ROGUE" then
						icon = 626005
					elseif class == "SHAMAN" then
						icon = 626006
					elseif class == "WARLOCK" then
						icon = 626007
					elseif class == "WARRIOR" then
						icon = 626008
					end
				end
			end
		end

		return specid, icon
	end

	return nil, nil
end

local col_green = "|cff90ee90"
local col_orange = "|cffbf9000"
local col_yellow = "|cffffff4b"
local col_red = "|cffff4b47"
local bisTextLookup = {
	["NOTBIS"] = {
		colorCode = col_red,
		translationArgs = {"LID_NOTBIS"}
	},
	["BISO"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISO"}
	},
	["BISMR"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISMR"}
	},
	["BISM"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISM"}
	},
	["BISR"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISR"}
	},
	["BIS,PVE"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISPVE"}
	},
	["BIS,PREPATCH"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISPREPATCH"}
	},
	["BIS,PVE,P1"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISPVEPHASEX", nil, 1}
	},
	["BIS,PVE,P2"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISPVEPHASEX", nil, 2}
	},
	["BIS,PVE,P3"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISPVEPHASEX", nil, 3}
	},
	["BIS,PVE,P4"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISPVEPHASEX", nil, 4}
	},
	["BIS,PVE,P5"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISPVEPHASEX", nil, 5}
	},
	["BIS,PVE,P6"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISPVEPHASEX", nil, 6}
	},
	["BIS,PVE,SOD25"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISPVESODX", nil, 25}
	},
	["BIS,PVE,SOD40"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISPVESODX", nil, 40}
	},
	["BIS,PVE,SOD50"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISPVESODX", nil, 50}
	},
	["BIS,PVE,SOD60"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISPVESODX", nil, 60}
	},
	["BIS,PVP"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISPVP"}
	},
	["S+"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISTRINKETX", nil, "S+"}
	},
	["S"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISTRINKETX", nil, "S"}
	},
	["S-"] = {
		colorCode = col_green,
		translationArgs = {"LID_BISTRINKETX", nil, "S-"}
	},
	["A+"] = {
		colorCode = col_yellow,
		translationArgs = {"LID_BISTRINKETX", nil, "A+"}
	},
	["A"] = {
		colorCode = col_yellow,
		translationArgs = {"LID_BISTRINKETX", nil, "A"}
	},
	["A-"] = {
		colorCode = col_yellow,
		translationArgs = {"LID_BISTRINKETX", nil, "A-"}
	},
	["B+"] = {
		colorCode = col_yellow,
		translationArgs = {"LID_BISTRINKETX", nil, "B+"}
	},
	["B"] = {
		colorCode = col_yellow,
		translationArgs = {"LID_BISTRINKETX", nil, "B"}
	},
	["B-"] = {
		colorCode = col_yellow,
		translationArgs = {"LID_BISTRINKETX", nil, "B-"}
	},
	["C+"] = {
		colorCode = col_orange,
		translationArgs = {"LID_BISTRINKETX", nil, "C+"}
	},
	["C"] = {
		colorCode = col_orange,
		translationArgs = {"LID_BISTRINKETX", nil, "C"}
	},
	["C-"] = {
		colorCode = col_orange,
		translationArgs = {"LID_BISTRINKETX", nil, "C-"}
	},
	["D"] = {
		colorCode = col_orange,
		translationArgs = {"LID_BISTRINKETX", nil, "D"}
	},
	["E"] = {
		colorCode = col_red,
		translationArgs = {"LID_BISTRINKETX", nil, "E"}
	},
	["F"] = {
		colorCode = col_red,
		translationArgs = {"LID_BISTRINKETX", nil, "F"}
	},
	["No"] = {
		colorCode = col_red,
		translationArgs = {"LID_BISTRINKETX", nil, "No"}
	},
	["PREBIS,PVE"] = {
		colorCode = col_yellow,
		translationArgs = {"LID_PREBISPVE"}
	},
	["PREBIS,PVE,P1"] = {
		colorCode = col_yellow,
		translationArgs = {"LID_PREBISPVEPHASEX", nil, 1}
	},
	["PREBIS,PVE,P2"] = {
		colorCode = col_yellow,
		translationArgs = {"LID_PREBISPVEPHASEX", nil, 2}
	},
	["PREBIS,PVE,P3"] = {
		colorCode = col_yellow,
		translationArgs = {"LID_PREBISPVEPHASEX", nil, 3}
	},
	["PREBIS,PVE,P4"] = {
		colorCode = col_yellow,
		translationArgs = {"LID_PREBISPVEPHASEX", nil, 4}
	},
	["PREBIS,PVE,P5"] = {
		colorCode = col_yellow,
		translationArgs = {"LID_PREBISPVEPHASEX", nil, 5}
	},
	["PREBIS,PVE,P6"] = {
		colorCode = col_yellow,
		translationArgs = {"LID_PREBISPVEPHASEX", nil, 6}
	},
	["PREBIS,PVE,SOD25"] = {
		colorCode = col_yellow,
		translationArgs = {"LID_PREBISPVESODX", nil, 25}
	},
	["PREBIS,PVE,SOD40"] = {
		colorCode = col_yellow,
		translationArgs = {"LID_PREBISPVESODX", nil, 40}
	},
	["PREBIS,PVE,SOD50"] = {
		colorCode = col_yellow,
		translationArgs = {"LID_PREBISPVESODX", nil, 50}
	},
	["PREBIS,PVE,SOD60"] = {
		colorCode = col_yellow,
		translationArgs = {"LID_PREBISPVESODX", nil, 60}
	},
	["?"] = {
		colorCode = col_red,
		translationArgs = {"LID_BISTRINKETX", nil, "?"}
	},
	["??????"] = {
		colorCode = col_red,
		translationArgs = {"LID_BISTRINKETX", nil, "?????"}
	},
}

local oldPhases = {}
if SpecBisTooltip:GetWoWBuild() == "CLASSIC" then
	oldPhases["BIS,PVE,SOD50"] = true
	oldPhases["PREBIS,PVE,SOD50"] = true
	oldPhases["BIS,PVE,SOD40"] = true
	oldPhases["PREBIS,PVE,SOD40"] = true
	oldPhases["BIS,PVE,SOD25"] = true
	oldPhases["PREBIS,PVE,SOD25"] = true
elseif SpecBisTooltip:GetWoWBuild() == "WRATH" then
	oldPhases["BIS,PVE,P1"] = true
	oldPhases["BIS,PVE,P2"] = true
	oldPhases["BIS,PVE,P3"] = true
elseif SpecBisTooltip:GetWoWBuild() == "CATA" then
end

local missingTypes = {}
local function GetBISText(typ)
	if not SpecBisTooltip:GV(SBTTAB, "SHOWPREBIS", true) and string.find(typ, "PRE", 1, true) then
		typ = "NOTBIS"
	end

	if not SpecBisTooltip:GV(SBTTAB, "SHOWOLDERPHASES", true) and oldPhases[typ] then
		typ = "NOTBIS"
	end

	local entry = bisTextLookup[typ]
	if typ == "NOTBIS" and not SpecBisTooltip:GV(SBTTAB, "SHOWNOTBIS", true) then return "" end
	if entry then
		local colorCode = entry.colorCode
		local text = SpecBisTooltip:Trans(unpack(entry.translationArgs))

		return colorCode .. text
	else
		if missingTypes[tostring(typ)] == nil then
			missingTypes[tostring(typ)] = true
			SpecBisTooltip:MSG("Missing Type in GetBISText:", tostring(typ), "Level:", UnitLevel("player"))
		end

		return ""
	end
end

local function AddToTooltip(tooltip, id, specId, icon, invType)
	local _, class = UnitClass("PLAYER")
	if id == nil then return end
	local typ, sourceUrl = SpecBisTooltip:GetSpecItemTyp(id, specId)
	if typ == nil then return end
	local iconText = ""
	if icon then
		iconText = "|T" .. icon .. ":20:20:0:0|t"
	end

	if invType == "INVTYPE_TRINKET" and typ == "NOTBIS" and not SpecBisTooltip:CheckIfTrinketData("INVTYPE_TRINKET") then
		tooltip:AddDoubleLine("NO BIS DATA FOR YOUR TRINKETS IN THIS SPEC", "|T136031:20:20:0:0|t")
	end

	local bisText = GetBISText(typ)
	local sourceTyp, sourceName = SpecBisTooltip:GetSource(sourceUrl)
	if bisText ~= "" then
		if bisText ~= "BLOCKED" then
			if typ == "NOTBIS" then
				sourceTyp, sourceName = SpecBisTooltip:GetBisSource(invType, class, specId)
				if sourceTyp and sourceTyp ~= "" then
					if sourceTyp == "catalyst" then
						tooltip:AddDoubleLine(iconText .. " " .. bisText, format(SpecBisTooltip:Trans("yourbissource"), SpecBisTooltip:Trans(sourceTyp)) .. " |T136031:20:20:0:0|t")
					else
						tooltip:AddDoubleLine(iconText .. " " .. bisText, format(SpecBisTooltip:Trans("yourbissource"), sourceName .. " " .. "(" .. SpecBisTooltip:Trans(sourceTyp) .. ")") .. " |T136031:20:20:0:0|t")
					end
				else
					tooltip:AddDoubleLine(iconText .. " " .. bisText, "|T136031:20:20:0:0|t")
				end
			elseif sourceTyp and sourceTyp ~= "" then
				if sourceTyp == "catalyst" then
					tooltip:AddDoubleLine(iconText .. " " .. bisText, SpecBisTooltip:Trans("LID_SOURCE") .. ": " .. SpecBisTooltip:Trans(sourceTyp) .. " |T136031:20:20:0:0|t")
				else
					tooltip:AddDoubleLine(iconText .. " " .. bisText, SpecBisTooltip:Trans("LID_SOURCE") .. ": " .. sourceName .. " " .. "(" .. SpecBisTooltip:Trans(sourceTyp) .. ")" .. " |T136031:20:20:0:0|t")
				end
			else
				tooltip:AddDoubleLine(iconText .. " " .. bisText, "|T136031:20:20:0:0|t")
			end
		end
	else
		local _, _, _, _, _, _, _, _, itemEquipLoc, _, _, _, _, _, _, _, _ = GetItemInfo(id)
		if itemEquipLoc and itemEquipLoc ~= "" and not tContains(validEquipSlots, itemEquipLoc) and invalidEquipSlots[itemEquipLoc] == nil then
			tooltip:AddDoubleLine("BIS: ERROR? " .. specId .. " " .. tostring(itemEquipLoc), "|T136031:20:20:0:0|t")
		end
	end
end

local function AddBisForSpec(tooltip, itemId, yourSpecId, otherClasses)
	local _, ownClassName = UnitClass("player")
	local bfs = SpecBisTooltip:GetBFS(itemId)
	local num = 0
	if bfs == nil then
		if otherClasses then
			tooltip:AddDoubleLine(SpecBisTooltip:Trans("LID_NOOTHERCLASSNEEDSTHIS"), "|T136031:20:20:0:0|t")
		else
			tooltip:AddDoubleLine(SpecBisTooltip:Trans("LID_NOOTHERSPECNEEDSTHIS"), "|T136031:20:20:0:0|t")
		end

		return
	end

	for i, text in pairs(bfs) do
		local className = text[1]
		local specId = text[2]
		if specId ~= yourSpecId and ((otherClasses and className ~= ownClassName) or (otherClasses == false and className == ownClassName)) then
			if num == 0 then
				if otherClasses then
					tooltip:AddDoubleLine(SpecBisTooltip:Trans("LID_OTHERCLASSES") .. ":", "|T136031:20:20:0:0|t")
				else
					tooltip:AddDoubleLine(SpecBisTooltip:Trans("LID_OTHERSPECS") .. ":", "|T136031:20:20:0:0|t")
				end
			end

			num = num + 1
			local classIcon = SpecBisTooltip:GetClassIcon(className)
			local specIcon = SpecBisTooltip:GetSpecIcon(className, specId)
			if text[3][1] then
				local bisText = GetBISText(text[3][1])
				if bisText ~= "" and bisText ~= "BLOCKED" then
					local sourceUrl = text[3][2]
					local sourceTyp, sourceName = SpecBisTooltip:GetSource(sourceUrl)
					if otherClasses then
						if sourceTyp and sourceTyp ~= "" then
							if sourceTyp == "catalyst" then
								tooltip:AddDoubleLine(format("|T%s:20:20:0:0|t |T%s:20:20:0:0|t %s", classIcon, specIcon, bisText), SpecBisTooltip:Trans("LID_SOURCE") .. ": " .. SpecBisTooltip:Trans(sourceTyp) .. " |T136031:20:20:0:0|t")
							else
								tooltip:AddDoubleLine(format("|T%s:20:20:0:0|t |T%s:20:20:0:0|t %s", classIcon, specIcon, bisText), SpecBisTooltip:Trans("LID_SOURCE") .. ": " .. sourceName .. " " .. "(" .. SpecBisTooltip:Trans(sourceTyp) .. ")" .. " |T136031:20:20:0:0|t")
							end
						else
							tooltip:AddDoubleLine(format("|T%s:20:20:0:0|t |T%s:20:20:0:0|t %s", classIcon, specIcon, bisText), "|T136031:20:20:0:0|t")
						end
					else
						if sourceTyp and sourceTyp ~= "" then
							if sourceTyp == "catalyst" then
								tooltip:AddDoubleLine(format("|T%s:20:20:0:0|t %s", specIcon, bisText), SpecBisTooltip:Trans("LID_SOURCE") .. ": " .. SpecBisTooltip:Trans(sourceTyp) .. " |T136031:20:20:0:0|t")
							else
								tooltip:AddDoubleLine(format("|T%s:20:20:0:0|t %s", specIcon, bisText), SpecBisTooltip:Trans("LID_SOURCE") .. ": " .. sourceName .. " " .. "(" .. SpecBisTooltip:Trans(sourceTyp) .. ")" .. " |T136031:20:20:0:0|t")
							end
						else
							tooltip:AddDoubleLine(format("|T%s:20:20:0:0|t %s", specIcon, bisText), "|T136031:20:20:0:0|t")
						end
					end
				end
			end
		end
	end

	if num == 0 then
		if otherClasses then
			tooltip:AddDoubleLine(SpecBisTooltip:Trans("LID_NOOTHERCLASSNEEDSTHIS"), "|T136031:20:20:0:0|t")
		else
			tooltip:AddDoubleLine(SpecBisTooltip:Trans("LID_NOOTHERSPECNEEDSTHIS"), "|T136031:20:20:0:0|t")
		end
	end
end

local specNotFoundOnce = true
local function OnTooltipSetItem(tooltip, data)
	local id = nil
	if data and data.id then
		id = data.id
	elseif tooltip.GetItem then
		name, link = tooltip:GetItem()
		if link then
			id = tonumber(strmatch(link, "item:(%d+):"))
		end
	end

	if id == nil then return end
	local itemType = select(9, GetItemInfo(id))
	if itemType == "" then return end
	if invalidEquipSlots[itemType] then return end
	local specId, icon = SpecBisTooltip:GetTalentInfo()
	if debug then
		tooltip:AddDoubleLine("ID: " .. id)
	end

	if specId then
		if SpecBisTooltip:GV(SBTTAB, "SHOWOTHERSPECS", true) or SpecBisTooltip:GV(SBTTAB, "SHOWOTHERCLASSES", false) then
			tooltip:AddDoubleLine(SpecBisTooltip:Trans("LID_YOURSPEC") .. ":", "|T136031:20:20:0:0|t")
		end

		AddToTooltip(tooltip, id, specId, icon, itemType)
		if SpecBisTooltip:GV(SBTTAB, "SHOWOTHERSPECS", true) then
			AddBisForSpec(tooltip, id, specId, false)
		end

		if SpecBisTooltip:GV(SBTTAB, "SHOWOTHERCLASSES", false) then
			AddBisForSpec(tooltip, id, specId, true)
		end
	else
		local lvl = UnitLevel("PLAYER")
		if lvl and lvl < 10 and specNotFoundOnce then
			specNotFoundOnce = false
			C_Timer.After(
				10,
				function()
					specNotFoundOnce = true
				end
			)
		elseif specNotFoundOnce then
			specNotFoundOnce = false
			SpecBisTooltip:MSG("Spec not found")
			C_Timer.After(
				10,
				function()
					specNotFoundOnce = true
				end
			)
		end
	end
end

if ItemRefTooltip and GameTooltip and ItemRefTooltip:HasScript("OnTooltipSetItem") and GameTooltip:HasScript("OnTooltipSetItem") then
	ItemRefTooltip:HookScript(
		"OnTooltipSetItem",
		function(tooltip, ...)
			OnTooltipSetItem(tooltip, ...)
		end
	)

	GameTooltip:HookScript(
		"OnTooltipSetItem",
		function(tooltip, ...)
			OnTooltipSetItem(tooltip, ...)
		end
	)
elseif TooltipDataProcessor then
	TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, OnTooltipSetItem)
end
