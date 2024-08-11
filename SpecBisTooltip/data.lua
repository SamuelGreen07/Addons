-- By D4KiR
local _, SpecBisTooltip = ...
SpecBisTooltip:SetAddonOutput("SpecBisTooltip", 136031)
local classIcons = {
	["DEATHKNIGHT"] = 135771,
	["DEMONHUNTER"] = 1260827,
	["DRUID"] = 625999,
	["EVOKER"] = 4574311,
	["HUNTER"] = 626000,
	["MAGE"] = 626001,
	["MONK"] = 626002,
	["PALADIN"] = 626003,
	["PRIEST"] = 626004,
	["ROGUE"] = 626005,
	["SHAMAN"] = 626006,
	["WARLOCK"] = 626007,
	["WARRIOR"] = 626008,
}

function SpecBisTooltip:GetClassIcon(className)
	return classIcons[className]
end

function SpecBisTooltip:CheckIfTrinketData(invtype)
	local _, class = UnitClass("player")
	local specId = SpecBisTooltip:GetTalentInfo()
	local tab = BIS[SpecBisTooltip:GetWoWBuild()][class][specId]
	for i, v in pairs(tab) do
		local itemType = select(9, GetItemInfo(i))
		if itemType == invtype then return true end
	end

	return false
end

local specIcons = {
	["DEATHKNIGHT"] = {
		[1] = 135770,
		[2] = 135773,
		[3] = 135775,
	},
	["DEMONHUNTER"] = {
		[1] = 1247264,
		[2] = 1247265,
	},
	["DRUID"] = {
		[1] = 136096,
		[2] = 132115,
		[3] = 132276,
		[4] = 136041,
	},
	["EVOKER"] = {
		[1] = 4511811,
		[2] = 4511812,
		[3] = 5198700,
	},
	["HUNTER"] = {
		[1] = 132164,
		[2] = 132222,
		[3] = 132215,
	},
	["MAGE"] = {
		[1] = 135932,
		[2] = 135812,
		[3] = 135846,
	},
	["MONK"] = {
		[1] = 608951,
		[2] = 608952,
		[3] = 608953,
	},
	["PALADIN"] = {
		[1] = 135920,
		[2] = 135893,
		[3] = 135873,
	},
	["PRIEST"] = {
		[1] = 135940,
		[2] = 135920,
		[3] = 136207,
	},
	["ROGUE"] = {
		[1] = 136189,
		[2] = 132282,
		[3] = 132320,
	},
	["SHAMAN"] = {
		[1] = 136048,
		[2] = 132314,
		[3] = 136043,
	},
	["WARLOCK"] = {
		[1] = 136145,
		[2] = 136172,
		[3] = 136186,
	},
	["WARRIOR"] = {
		[1] = 132292,
		[2] = 132347,
		[3] = 134952,
	},
}

local classIds = {
	["WARRIOR"] = 1,
	["PALADIN"] = 2,
	["HUNTER"] = 3,
	["ROGUE"] = 4,
	["PRIEST"] = 5,
	["DEATHKNIGHT"] = 6,
	["SHAMAN"] = 7,
	["MAGE"] = 8,
	["WARLOCK"] = 9,
	["MONK"] = 10,
	["DRUID"] = 11,
	["DEMONHUNTER"] = 12,
	["EVOKER"] = 13,
}

function SpecBisTooltip:GetSpecIcon(className, specId)
	if GetSpecializationInfoForClassID then
		local classId = classIds[className]
		if classId then
			local _, _, _, icon = GetSpecializationInfoForClassID(classId, specId)
			if icon then return icon end
		end
	end

	return specIcons[className][specId]
end
