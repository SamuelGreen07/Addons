-----------------------------------------------------------------------
local _G = getfenv(0)
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, plugin	= ...
      plugin.icon		= "Interface\\Addons\\" .. FOLDER_NAME .. "\\icon"
-- ----------------------------------------------------------------------------
local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes")
local HL = LibStub("AceAddon-3.0"):NewAddon(FOLDER_NAME, "AceEvent-3.0")
      plugin.HL = HL
--	-------------------------------------------------------------------------------------------
--	Plugin Handlers to HandyNotes
--	-------------------------------------------------------------------------------------------
local HLHandler = {}
local tip = {}
local info = {}
--	-------------------------------------------------------------------------------------------
--	Functions
--	-------------------------------------------------------------------------------------------
	--	Create TomTom Way Point
	-------------------------------------------------------------------------------------------
	local function addTomTomWaypoint(button, uiMapID, coord)
		if TomTom then
			local x, y = HandyNotes:getXY(coord)
			TomTom:AddWaypoint(uiMapID, x, y, {
				title = tip.title,
				persistent = nil,
				minimap = true,
				world = true
			})
		end
	end
	--	End of TomTom Way Point
	-------------------------------------------------------------------------------------------
	local function hideNode(button, uiMapID, coord)
		plugin.hidden[uiMapID][coord] = true
		HL:Refresh()
	end

	local function closeAllDropdowns()
		CloseDropDownMenus(1)
	end
--	-------------------------------------------------------------------------------------------
--	Tooltip
--	-------------------------------------------------------------------------------------------
	function HLHandler:OnEnter(uiMapID, coord)
		local tooltip = GameTooltip
		if ( self:GetCenter() > UIParent:GetCenter() ) then -- compare X coordinate
			tooltip:SetOwner(self, "ANCHOR_LEFT")
		else
			tooltip:SetOwner(self, "ANCHOR_RIGHT")
		end

		local value = plugin.points[uiMapID][coord]
		if not value then return nil end
		------------------------------------------------------------------------------------
		if value.achievement then
			tip.criteria	= select(1, GetAchievementCriteriaInfoByID(value.achievement, value.criteria))
			tip.achievement	= select(2, GetAchievementInfo(value.achievement))
			tip.description	= "Revealing the covered areas of the world map."
			tip.note	= value.note
		end
		------------------------------------------------------------------------------------
		if tip.criteria then 
			if tip.note then 
			tooltip : AddDoubleLine ( tip.criteria , tip.note , 0.2 , 0.6 , 1 , 1 , 1 , 1 )
			else
			tooltip : AddLine ( tip.criteria , 0.2, 0.6, 1, true)
			end

			tooltip:AddLine	(CreateAtlasMarkup ("Timer-Fill", 250, 2))

			if tip.achievement then 
				tooltip:AddLine(tip.achievement, nil, nil, nil, true)	
	--			tooltip:AddLine	(" " .. CreateAtlasMarkup ("Timer-Fill", 200, 2) .. " ")				
			end	

			if tip.description then 
				tooltip:AddLine(tip.description, 1, 1, 1, true)
			end
				

		end
		tooltip:Show()
	end
--	-------------------------------------------------------------------------------------------
--	Tooltip Hide
--	-------------------------------------------------------------------------------------------
	function HLHandler:OnLeave(uiMapID, coord)
		GameTooltip:Hide()
	end
--	-------------------------------------------------------------------------------------------
--	--	End of Tooltip
--	-------------------------------------------------------------------------------------------
do
    local currentZone, currentCoord
    local function generateMenu(button, level)

        if (not level) then return end
        wipe(info)
        if (level == 1) then
		-- Create the title of the menu
		info.isTitle      = 1
		info.text         = "HandyNotes - " .. FOLDER_NAME:gsub("HandyNotes_", "")
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		wipe(info)
			
		if TomTom then
			-- Waypoint menu item
			info.text = "Create waypoint"
			info.notCheckable = 1
			info.func = addTomTomWaypoint
			info.arg1 = currentZone
			info.arg2 = currentCoord
			UIDropDownMenu_AddButton(info, level)
			wipe(info)
		end
			
		-- Hide menu item
		info.text         = "Hide node"
		info.notCheckable = 1
		info.func         = hideNode
		info.arg1         = currentZone
		info.arg2         = currentCoord
		UIDropDownMenu_AddButton(info, level)
		wipe(info)
		-- Close menu item
		info.text         = "Close"
		info.func         = closeAllDropdowns
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		wipe(info)
        end
    end

    local HL_Dropdown = CreateFrame("Frame", FOLDER_NAME.."DropdownMenu")
    HL_Dropdown.displayMode = "MENU"
    HL_Dropdown.initialize = generateMenu

    function HLHandler:OnClick(button, down, uiMapID, coord)
        currentZone = uiMapID
        currentCoord = coord
        -- given we're in a click handler, this really *should* exist, but just in case...
        local point = plugin.points[currentZone] and plugin.points[currentZone][currentCoord]
        if button == "RightButton" and not down then
            ToggleDropDownMenu(1, nil, HL_Dropdown, self, 0, 0)
        end
    end
end



do
    -- This is a custom iterator we use to iterate over every node in a given zone
    local function iter(t, prestate)
        if not t then return nil end
        local state, value = next(t, prestate)
        while state do
	    if value  then
--      -------------------------------------------------------------------------------------------
--	Create ICON
--      -------------------------------------------------------------------------------------------
		local icon, alpha, scale
			scale = (value.scale or 1) * plugin.db.icon_scale
			alpha = (value.alpha or 1) * plugin.db.icon_alpha
			if value.achievement then
				if (UnitName("player") ~= select ( 6, GetAchievementCriteriaInfoByID (value.achievement, value.criteria) ) ) then
				icon = plugin.icon
				end
			end
--      -------------------------------------------------------------------------------------------
                return state, nil, icon, scale, alpha
            end
            state, value = next(t, state) -- Get next data
        end
        return nil, nil, nil, nil
    end
    function HLHandler:GetNodes2(uiMapID, minimap)
        return iter, plugin.points[uiMapID], nil
    end
end
---------------------------------------------------------
-- Addon initialization, enabling and disabling

function HL:OnInitialize()
    -- Set up our database
    self.db = LibStub("AceDB-3.0"):New(FOLDER_NAME.."DB", plugin.defaults)
    plugin.db = self.db.profile
    plugin.hidden = self.db.char.hidden
    -- Initialize our database with HandyNotes
    HandyNotes:RegisterPluginDB(FOLDER_NAME:gsub("HandyNotes_", ""), HLHandler, plugin.options)

    self:RegisterEvent("ZONE_CHANGED", "Refresh")
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "Refresh")
    self:RegisterEvent("ZONE_CHANGED_INDOORS", "Refresh")
end

function HL:Refresh()
    self:SendMessage("HandyNotes_NotifyUpdate", FOLDER_NAME:gsub("HandyNotes_", ""))
end