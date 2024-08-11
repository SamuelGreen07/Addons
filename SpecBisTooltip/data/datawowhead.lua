-- By D4KiR
local _, SpecBisTooltip = ...
function SpecBisTooltip:AddToSOD(class, specid, tab)
	if tab then
		for i, v in pairs(tab) do
			if SpecBisTooltip:GetBisTable()["CLASSIC"][class][specid][i] == nil then
				SpecBisTooltip:GetBisTable()["CLASSIC"][class][specid][i] = v
			end
		end
	end
end

SpecBisTooltip:AddOldSodPhases()
function SpecBisTooltip:CheckIfTrinketData(invtype)
	local _, class = UnitClass("player")
	local specId = SpecBisTooltip:GetTalentInfo()
	local tab = SpecBisTooltip:GetBisTable()[SpecBisTooltip:GetWoWBuild()][class][specId]
	for i, v in pairs(tab) do
		local itemType = select(9, GetItemInfo(i))
		if itemType == invtype then return true end
	end

	return false
end

local sortBfs = {}
sortBfs["BISO"] = 1
sortBfs["BISMR"] = 2
sortBfs["BISM"] = 3
sortBfs["BISR"] = 4
sortBfs["BIS,PVE,P6"] = 1
sortBfs["BIS,PVE,P5"] = 2
sortBfs["BIS,PVE,P4"] = 3
sortBfs["BIS,PVE,P3"] = 4
sortBfs["BIS,PVE,P2"] = 5
sortBfs["BIS,PVE,P1"] = 6
sortBfs["PREBIS,PVE,P6"] = 7
sortBfs["PREBIS,PVE,P5"] = 8
sortBfs["PREBIS,PVE,P4"] = 9
sortBfs["PREBIS,PVE,P3"] = 10
sortBfs["PREBIS,PVE,P2"] = 11
sortBfs["PREBIS,PVE,P1"] = 12
sortBfs["BIS,PREPATCH"] = 13
sortBfs["BIS,PVE,SOD60"] = 1
sortBfs["PREBIS,PVE,SOD60"] = 2
sortBfs["BIS,PVE,SOD50"] = 3
sortBfs["PREBIS,PVE,SOD50"] = 4
sortBfs["BIS,PVE,SOD40"] = 5
sortBfs["PREBIS,PVE,SOD40"] = 6
sortBfs["BIS,PVE,SOD25"] = 7
sortBfs["PREBIS,PVE,SOD25"] = 8
sortBfs["PREBIS,PVE"] = 14
sortBfs["S+"] = 20
sortBfs["S"] = 21
sortBfs["S-"] = 22
sortBfs["A+"] = 23
sortBfs["A"] = 24
sortBfs["A-"] = 25
sortBfs["B+"] = 26
sortBfs["B"] = 27
sortBfs["B-"] = 28
sortBfs["C+"] = 29
sortBfs["C"] = 30
sortBfs["C-"] = 31
sortBfs["D"] = 32
sortBfs["E"] = 33
sortBfs["F"] = 34
sortBfs["No"] = 35
sortBfs["?"] = 36
sortBfs["?????"] = 37
local bfs = {}
function SpecBisTooltip:InitBFS()
	local pool = SpecBisTooltip:GetWoWBuild()
	if SpecBisTooltip:GetBisTable()[pool] then
		for className, classTab in pairs(SpecBisTooltip:GetBisTable()[pool]) do
			for specId, specTab in pairs(classTab) do
				for itemId, itemTyp in pairs(specTab) do
					bfs[itemId] = bfs[itemId] or {}
					table.insert(bfs[itemId], {className, specId, itemTyp})
				end
			end
		end
	end

	for i, bf in pairs(bfs) do
		table.sort(
			bf,
			function(a, b)
				if sortBfs[a[3][1]] == nil then
					SpecBisTooltip:MSG("MISSING SORTING KEY", a[3][1])

					return true
				end

				if sortBfs[b[3][1]] == nil then
					SpecBisTooltip:MSG("MISSING SORTING KEY", b[3][1])

					return false
				end

				if sortBfs[a[3][1]] == sortBfs[b[3][1]] then return a[1] < b[1] end

				return sortBfs[a[3][1]] < sortBfs[b[3][1]]
			end
		)
	end
end

SpecBisTooltip:InitBFS()
function SpecBisTooltip:GetBFS(itemId)
	return bfs[itemId]
end

local bfi = {}
function SpecBisTooltip:GetBisSource(invType, class, specId)
	if bfi[class] == nil then
		bfi[class] = {}
	end

	if bfi[class][specId] == nil then
		bfi[class][specId] = {}
		local pool = SpecBisTooltip:GetWoWBuild()
		if SpecBisTooltip:GetBisTable()[pool] then
			for itemId, tab in pairs(SpecBisTooltip:GetBisTable()[pool][class][specId]) do
				local phase = tab[1]
				local slot = tab[3]
				if pool == "CLASSIC" then
					if EngravingFrame ~= nil and strfind(phase, "SOD", 1, true) then
						if bfi[class][specId][slot] == nil then
							bfi[class][specId][slot] = itemId
						end
					elseif EngravingFrame == nil and strfind(phase, "SOD", 1, true) == nil then
						if bfi[class][specId][slot] == nil then
							bfi[class][specId][slot] = itemId
						end
					end
				else
					if bfi[class][specId][slot] == nil then
						bfi[class][specId][slot] = itemId
					end
				end
			end
		end
	end

	local itemId = bfi[class][specId][invType]
	local _, sourceUrl = SpecBisTooltip:GetSpecItemTyp(itemId, specId)
	local sourceTyp, sourceName = SpecBisTooltip:GetSource(sourceUrl)

	return sourceTyp, sourceName
end
