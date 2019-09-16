local addonName, addOn = ...

local BQF = BetterQuestFrame

local options = {
	type = "group",
	name = "Better Quest Frame " .. GetAddOnMetadata("BetterQuestFrame", "version"),
	get = function(info)
		return BetterQuestFrameDB[info.arg]
	end,
	set = function(info, value)
		BetterQuestFrameDB[info.arg] = value
		BQF:LoadQuests()
	end,
	
	args = {
		toggleAnchors = {
			order = 100,
			type = "execute",
			name = "Toggle Anchors",
			func = function()
				BQF:ToggleAnchors()
			end,
		},
		showQuestCount = {
			order = 200,
			type = "toggle",
			name = "Show Quest Count",
            width = "full",
			arg = "showQuestCount",
		},
		questTitleFormat = {
			order = 300,
			type = "input",
			name = "Quest Title Format",
			desc = "Supported placeholders:\n- [quest:title]\n- [quest:level]",
			width = "full",
			arg = "questTitleFormat",
		},
		positionsGroup = {
			order = 400,
			type = "group",
			name = "Size & Position",
			inline = true,
			set = function(info, value)
				BetterQuestFrameDB[info.arg] = value;
				BQF:RefreshPosition();
				BQF:RefreshSize();
			end,
			
			args = {
				frameHeight = {
					order  = 1,
					type = "range",
					name = "Height",
					min = 100,
					max = BQF:GetResolution().height;
					step = 1,
					bigStep = 10,
					arg = "frameHeight",
				},
				positionX = {
					order  = 2,
					type = "range",
					name = "Position X",
					min = 0,
					max = math.ceil(GetScreenWidth() * UIParent:GetEffectiveScale());
					step = 0.01,
					bigStep = 10,
					arg = "positionX",
				},
				positionY = {
					order  = 3,
					type = "range",
					name = "Position Y",
					min = 0,
					max = math.ceil(GetScreenHeight() * UIParent:GetEffectiveScale());
					step = 0.01,
					bigStep = 10,
					arg = "positionY",
				},
			},
		},
	},
}

LibStub("AceConfig-3.0"):RegisterOptionsTable("BetterQuestFrame", options)
LibStub("AceConfigDialog-3.0"):AddToBlizOptions("BetterQuestFrame")