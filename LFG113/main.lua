	local myInfo, L = ...

	-- Key Bindings
	BINDING_HEADER_LFG113 = "LFG113"
	BINDING_NAME_LFG113_TOGGLE = "LFG113Show"

	local TESTCHANNEL =	false
	local nextAvailNumber = 0
	local ShiftClick = ""
	local FirstTime = true

	local ShowBroadcastPopup, SetMinimapHandler, MovingEyeAnimation
	local CreateTexture, CreateLabel, CreateButton, CreateNewButton, CreatePullDown, CreateGeneralPullDown, CreateCheckbutton, CreateScrollArea
	local CreateBroadcast, EndBroadcast, BroadcastMessage, BroadcastToAllChannels, FormatWhisperString, FormatRecievedMessage, NewUserAlert
	local DisplayLFM, DisplayLFG, DisplayBlackList, DisplaySettings, DisplaySearches, UpdateDisplayFrame, HideAllPulldowns
	local ToolTipOnEnter, ToolTipOnLeave, TableUpdate, ClearBlackListDisplay
	local CreateMainDisplay, DragFrame, GetABasicFrame, GetAFrame, EnterDetailedInformation
	local SetRoleIconDisplay, ResetAllPulldowns, ClearADisplayEntry, ClearAllDisplayEntries, ConvertRoleToNumbers
	--_an = myInfo

	local function DeepCopy(o, seen)
		seen = seen or {}
		if o == nil then return nil end
		if seen[o] then return seen[o] end

		local no
		if type(o) == 'table' then
			no = {}
			seen[o] = no

			for k, v in next, o, nil do
				no[DeepCopy(k, seen)] = DeepCopy(v, seen)
			end
			setmetatable(no, DeepCopy(getmetatable(o), seen))
		else -- number, string, boolean, etc
			no = o
		end
		return no
	end

	local function SetInterfaceLanguage (keyNeed)
		local tmpLocal = L.Locals.CurrentLocal == nil and L.Locals ["enUS"]["cmbLanguage"] or L.Locals.CurrentLocal ["cmbLanguage"]
		for key, value in pairs (tmpLocal) do
			if value [1] == keyNeed and value [2] then
				L.Locals.CurrentLocal = L.Locals [key]
				LFG113Saved ["LanguageUsed"] = keyNeed
				break
			end
		end
		if L.Locals.CurrentLocal == nil then
			L.Locals.CurrentLocal = L.Locals ["enUS"]
			LFG113Saved ["LanguageUsed"] = 4
		end -- Fall back to english if error
	end

	local function SetCommumnicationLanguage (keyNeed)
		local tmpLocal = L.Locals.CurrentCommLocal == nil and L.Locals ["enUS"]["cmbLanguage"] or L.Locals.CurrentCommLocal ["cmbLanguage"]
		for key, value in pairs (tmpLocal) do
			if value [1] == keyNeed and value [2] then
				L.Locals.CurrentCommLocal = L.Locals [key]
				LFG113Saved ["CommLanguageUsed"] = keyNeed
				break
			end
		end
		if L.Locals.CurrentCommLocal == nil then
			L.Locals.CurrentCommLocal = L.Locals ["enUS"]
			LFG113Saved ["CommLanguageUsed"] = 4
		end -- Fall back to english if error
	end

	local function SetUpChannel (Channel, values)
		local c = GetChannelName (Channel)
		local lowerChannel = strlower (Channel)
		if LFG113Saved ["channels"][lowerChannel] == nil then LFG113Saved ["channels"][lowerChannel] = { ["WithCaps"] = values ["WithCaps"], ["Pass"] = values ["Pass"], ["Load"] = values ["Load"], ["Broadcast"] = values["Broadcast"] } end
		if L.Variables.ChannelsUsed [lowerChannel] then
			for key, value in pairs (values) do	L.Variables.ChannelsUsed [lowerChannel][key] = value end
		else
			L.Variables.ChannelsUsed [lowerChannel] = values
			L.Variables.ChannelsUsed [lowerChannel]["used"] = c ~= nil and c > 0
			if (c == nil or c == 0) and values["Load"] and LFG113Saved ["enableChannelModification"] then
				if values ["Pass"] ~= nil then JoinTemporaryChannel (values ["WithCaps"], values ["Pass"])
				else JoinTemporaryChannel (values ["WithCaps"])
				end
			end
		end
	end

	function SetMinimapHandler ()
		if  LFG113Saved ["freeMovingEye"] then
			L.Frames.MinimapButton:SetScript ("OnDragStart", function ()
					L.Frames.MinimapButton:StartMoving ()
					L.Frames.MinimapButton:SetScript ("OnUpdate", L.Frames.MinimapButton.UpdateMapBtn)
				end)
			L.Frames.MinimapButton:SetScript ("OnDragStop", function ()
					L.Frames.MinimapButton:StopMovingOrSizing ()
					L.Frames.MinimapButton:SetScript ("OnUpdate", nil)
					L.Frames.MinimapButton.UpdateMapBtn ()
				end)
		else
			L.Frames.MinimapButton:SetScript ("OnDragStart", L.Frames.MinimapButton.StartMoving)
			L.Frames.MinimapButton:SetScript ("OnDragStop", function ()
					L.Frames.MinimapButton:StopMovingOrSizing ()
					LFG113Saved ["minimapX"], LFG113Saved ["minimapY"] = L.Frames.MinimapButton:GetLeft (), L.Frames.MinimapButton:GetBottom()
				end)
		end
	end

	function L.Frames.MinimapButton:Load()
		self:SetFrameStrata ("HIGH")
		self:SetWidth (32)
		self:SetHeight (32)
		self:SetFrameLevel (8)
		self:RegisterForClicks ("anyUp")
		self:SetMovable (true)
		self:SetHighlightTexture ("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")

		local overlay = self:CreateTexture (nil, "OVERLAY")
		overlay:SetWidth (53)
		overlay:SetHeight (53)
		overlay:SetTexture ("Interface\\Minimap\\MiniMap-TrackingBorder")
		overlay:SetPoint ("TOPLEFT", 0, 0)

		self.icon = self:CreateTexture (nil, "BACKGROUND")
		self.icon:SetTexture ("Interface\\AddOns\\LFG113\\textures\\LFG-Eye.tga")
		self.icon:SetTexCoord (0, .5, 0, 1)
		self.icon:SetWidth (32)
		self.icon:SetHeight (32)
		self.icon:SetPoint ("TOPLEFT", 0, 0)
		if not LFG113Saved ["minimapX"] or not LFG113Saved ["minimapY"] then L.Frames.mainFrame.Settings.topTabs ["Display"].btnReset:GetScript ("OnClick")() end
		self.tooltip = L.Locals.CurrentLocal ["pupActiveSearch"]
		self:SetScript("OnEnter", ToolTipOnEnter)
		self:SetScript("OnLeave", ToolTipOnLeave)
		self:SetScript ("OnClick", function (_, button)
				if button == "LeftButton" then
					if IsShiftKeyDown() then
						ShowBroadcastPopup ()
					else LFG113Show ()
					end
				end
			end)

		self.UpdateMapBtn = function()
			local Xpoa, Ypoa = GetCursorPosition ()
			self:ClearAllPoints ()
			if LFG113Saved ["freeMovingEye"] then
				local myIconPos = 0
				local Xmin, Ymin = Minimap:GetLeft (), Minimap:GetBottom ()
				Xpoa = Xmin - Xpoa / Minimap:GetEffectiveScale () + 70
				Ypoa = Ypoa / Minimap:GetEffectiveScale () - Ymin - 70
				myIconPos = math.deg (math.atan2(Ypoa, Xpoa))
				LFG113Saved ["minimapX"], LFG113Saved ["minimapY"] = 52 - (80 * cos(myIconPos)), (80 * sin(myIconPos)) - 52
				self:SetPoint ("TOPLEFT", Minimap, "TOPLEFT", LFG113Saved ["minimapX"], LFG113Saved ["minimapY"])
			else
				LFG113Saved ["minimapX"], LFG113Saved ["minimapY"] = Xpoa, Ypoa
				self:SetPoint ("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", LFG113Saved ["minimapX"], LFG113Saved ["minimapY"])
			end
		end
		if LFG113Saved ["freeMovingEye"] then self:SetPoint ("TOPLEFT", Minimap, "TOPLEFT", LFG113Saved ["minimapX"], LFG113Saved ["minimapY"])
		else self:SetPoint ("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", LFG113Saved ["minimapX"], LFG113Saved ["minimapY"])
		end
		self:RegisterForDrag ("RightButton")
		SetMinimapHandler ()
	end

	function MovingEyeAnimation ()
		if L.Variables.MovingEyeDelay > 0 then L.Variables.MovingEyeDelay = L.Variables.MovingEyeDelay - 1
		else
			if L.Variables.MovingEyeActionIndex == 0 or L.Variables.MovingEyeActions [L.Variables.MovingEyeActionIndex][2] < L.Variables.MovingEyeFrame then
				if L.Variables.didMovingEyeDelay then
					L.Variables.didMovingEyeDelay = false
					L.Variables.MovingEyeActionIndex = math.random (1, 4)
					L.Variables.MovingEyeFrame = L.Variables.MovingEyeActions [L.Variables.MovingEyeActionIndex][1]
				else
					L.Variables.didMovingEyeDelay = true
					L.Variables.MovingEyeDelay = math.random (10, 50) -- Create a delay before selecting next
				end
			else
				local _xFrame = L.Variables.MovingEyeFrame - (math.floor ((L.Variables.MovingEyeFrame - 1) / 8) * 8)
				local _yFrame = math.floor ((L.Variables.MovingEyeFrame - 1) / 8) + 1
				L.Frames.mainFrame.CornerEye.texture:SetTexCoord (L.Variables.MovingEyeKey["x"][_xFrame], L.Variables.MovingEyeKey["x"][_xFrame] + L.Variables.MovingEyeKey["dimensions"][1], L.Variables.MovingEyeKey["y"][_yFrame], L.Variables.MovingEyeKey["y"][_yFrame] + L.Variables.MovingEyeKey["dimensions"][2])
				if L.Variables.broadcastAppString:len() > 0 then
					L.Frames.MinimapButton.icon:SetTexCoord (L.Variables.MovingEyeKey["x"][_xFrame], L.Variables.MovingEyeKey["x"][_xFrame] + L.Variables.MovingEyeKey["dimensions"][1], L.Variables.MovingEyeKey["y"][_yFrame], L.Variables.MovingEyeKey["y"][_yFrame] + L.Variables.MovingEyeKey["dimensions"][2])
				else
					L.Frames.MinimapButton.icon:SetTexCoord (L.Variables.MovingEyeKey["x"][5], L.Variables.MovingEyeKey["x"][5] + L.Variables.MovingEyeKey["dimensions"][1], L.Variables.MovingEyeKey["y"][1], L.Variables.MovingEyeKey["y"][1] + L.Variables.MovingEyeKey["dimensions"][2])
				end
				if L.Variables.MovingEyeActions [L.Variables.MovingEyeActionIndex][3] == L.Variables.MovingEyeFrame then L.Variables.MovingEyeDelay =  math.random (0, 20) end
				L.Variables.MovingEyeFrame = L.Variables.MovingEyeFrame + 1
			end
		end
	end

	function ToolTipOnEnter (self)
		if self.tooltip then
			GameTooltip:SetOwner (self, "ANCHOR_CURSOR")
			if self.tooltip then
				local toolTipWidth = 50
				for index = 1, #self.tooltip do if self.tooltip [index] ~= nil then
					local myText = self.tooltip [index][1]
					while myText:len() > 0 do
						local printText = ""
						if myText:len() < toolTipWidth then
							printText = myText
							myText = ""
						else
							printText = myText:sub (1, toolTipWidth)
							myText = myText:sub (toolTipWidth + 1)
						end
						GameTooltip:AddLine (printText, self.tooltip [index][2], self.tooltip [index][3], self.tooltip [index][4], false) end
					end
				end
			end
			GameTooltip:Show()
		end
	end

	function ToolTipOnLeave (self)
		GameTooltip_Hide()
	end

	local function OrderTabs (contents)
		local left = 0
		for i = 1, #contents do
			if contents [i].myTab:IsShown() then
				contents [i].myTab:SetPoint ("TOPLEFT", left, 22)
				left = left + contents [i].myTab.tabWidth
			end
		end
	end

	local function MakeTabs (frame, numTabs, background, ...)
		frame.numTabs = numTabs
		local contents = {}
		local frameName = frame:GetName ()

		for i = 1, numTabs do
			local tab = CreateFrame ("Button", frameName .. "Tab" .. i, frame, "OptionsFrameTabButtonTemplate")
			tab:SetID (i)
			tab:SetText (select (i, ...)[1])
			tab.tabWidth = select (i, ...)[2]
			tab:SetScript ("OnClick", frame.TabSelected)
			tab.content = CreateFrame ("Frame", nil, frame, BackdropTemplateMixin and "BackdropTemplate")
			tab.content:SetAllPoints ()
			tab.content:SetBackdrop ({bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 }})
			tab.content:SetBackdropColor (0,0,0,1)
			tab.content:Hide ()
			if background ~= nil then
				tab.content.background = CreateFrame ("Frame", nil, tab.content)
				tab.content.background:SetPoint ("TOPLEFT", 5, -5)
				tab.content.background:SetPoint ("BOTTOMRIGHT", -5, 5)
				tab.content.background:SetFrameLevel (2)
				local texture = tab.content.background:CreateTexture ()
				texture:SetAllPoints ()
				texture:SetTexture (background)
				tab.content.texture = texture
			end
			tab.content.AllTabs = contents
			tab.content.myTab = tab
			table.insert (contents, tab.content)
		end
		OrderTabs (contents)
		frame.TabSelected (_G[frameName .. "Tab1"])
		return unpack (contents)
	end

	function CreateTexture (texture, _parent, _x, _y, _width, _height)
		local f = CreateFrame ("frame", nil, _parent)
		f:SetPoint ("TOPLEFT", _x, _y)
		f:SetSize (_width, _height)
		f.texture = f:CreateTexture ("Texture", "BACKGROUND")
		f.texture:SetSize (_width, _height)
		f.texture:SetTexture (texture)
		--f.texture:SetDrawLayer ("Background", 0)
		f.texture:SetAllPoints (f)
		return f
	end

	function CreateFramecontainer (_globalName, _parent, _topX, _topY, _bottomX, _bottomY, background)
		local frame = CreateFrame("Frame", _globalName, _parent, BackdropTemplateMixin and "BackdropTemplate")
		frame:SetPoint("TOPLEFT", _topX, _topY)
		frame:SetPoint("BOTTOMRIGHT", _bottomX, _bottomY)
		frame:SetBackdrop({bgFile = background, edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile = false, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 }})
		frame:SetBackdropColor(0,0,0,1)
		return frame
	end

	function CreateCustomTextBox (parent, _x, _y, _width, _height, _text, _callBack)
		local tmpFrame = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
		tmpFrame:SetPoint("TOPLEFT", _x, _y)
		tmpFrame:SetSize(_width, _height)
		tmpFrame:SetText (_text)
		tmpFrame:SetCursorPosition (0)
		tmpFrame:SetMultiLine(false)
		tmpFrame:SetAutoFocus (false)
		tmpFrame:SetMaxLetters(200)
		tmpFrame:SetFontObject(ChatFontNormal)
		tmpFrame:SetFrameLevel (15)
		tmpFrame:SetScript("OnEditFocusGained", function (self)
				L.Frames.mainFrame.TopTab.customMainFrameText:SetText (_text)
				L.Frames.mainFrame.TopTab.customMainFrame:SetParent (self)
				L.Frames.mainFrame.TopTab.customMainFrame:SetPoint ("TOPLEFT", 0, -23)
				L.Frames.mainFrame.TopTab.customMainFrame:SetFrameLevel (20)
				L.Frames.mainFrame.TopTab.customMainFrame:Show ()
				L.Frames.mainFrame.TopTab.customMainFrameText:SetFocus ()
				L.Frames.mainFrame.TopTab.customMainFrameText:SetText (self:GetText ())
				L.Frames.mainFrame.TopTab.customMainFrameText.ReturnText = function (text)
						local Response = nil
						if _callBack then Response = _callBack (text) end
						self:SetText (text)
						self.tooltipText = text
						self:SetCursorPosition (0)
						return Response
					end
			end)
		return tmpFrame
	end

	function CreateLabel (Parent, _x, _y, _fontType, _text)
		local title = Parent:CreateFontString (nil, "OVERLAY", _fontType)
		title:SetText (_text)
		title:SetPoint ("TOPLEFT", _x, _y)
		return title
	end

	function CreateCheckbutton(parent, x_loc, y_loc, _frameLevel, displayname, tooltip)
		nextAvailNumber = nextAvailNumber + 1
		local checkbutton = CreateFrame("CheckButton", "LFG113CheckButton_" .. nextAvailNumber, parent, "ChatConfigCheckButtonTemplate")
		checkbutton:SetPoint("TOPLEFT", x_loc, y_loc)
		checkbutton:SetFrameLevel (_frameLevel)
		checkbutton.tooltip = tooltip
		getglobal(checkbutton:GetName() .. "Text"):SetText(displayname)
		return checkbutton
	end

	function CreateButton (Parent, _x, _y, _width, _height, _text)
		local newButton = CreateFrame("Button", nil, Parent, "UIPanelButtonTemplate")
		newButton:SetSize (_width, _height)
		newButton:SetPoint ("TOPLEFT", _x, _y)
		newButton:SetText (_text)
		newButton.Text:SetWordWrap (true)
		return newButton
	end

	function CreateNewButton (Parent, _x, _y, _width, _height, _text, _image, _frameNum, _returnFunction)
		local newButton = CreateFrame ("Frame", nil, Parent)
		newButton:SetSize (_width, _height)
		newButton:SetPoint ("TOPLEFT", _x, _y)

		function ImgBar (_left, _right, _top, _bottom, _location)
			local newImage =  CreateFrame ("Frame", nil, newButton)
			newImage:SetSize (_width - 4, 8)
			newImage:SetPoint (_location, 2, 0)
			newImage.texture = newImage:CreateTexture()
			newImage.texture:SetAllPoints()
			newImage.texture:SetTexture("Interface/LFGFrame/GroupFinder.BLP")
			newImage.texture:SetTexCoord (_left, _right, _top, _bottom)
			return newImage
		end

		--newButton.topMouseover = ImgBar (.33, .595, .906, .915, "TOPLEFT")
		--newButton.bottomMouseover = ImgBar (.33, .595, .877, .886, "BOTTOMLEFT")
		--newButton.topSelected = ImgBar (.01, .27, .867, .876, "TOPLEFT")
		--newButton.bottomSelected = ImgBar (.01, .27, .838, .847, "BOTTOMLEFT")
		newButton.bottomSelected = ImgBar (0, .28, .834, .847, "TOPLEFT")
		newButton.topSelected = ImgBar (0, .28, .8084, .8214, "BOTTOMLEFT")
		newButton.topMouseover = ImgBar (.33, .595, .8285, .8415, "TOPLEFT")
		newButton.bottomMouseover = ImgBar (.33, .595, .803, .816, "BOTTOMLEFT")
		newButton.button =  CreateFrame ("Button", nil, newButton, BackdropTemplateMixin and "BackdropTemplate")
		newButton.button:SetSize (_width, _height - 16)
		newButton.button:SetPoint ("TOPLEFT", 1, -8)
		newButton.button:SetNormalFontObject ("GameFontNormal")
		newButton.button:SetHighlightFontObject ("GameFontHighlight")
		newButton.button:SetDisabledFontObject ("GameFontDisable")
		newButton.button:SetBackdrop ({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 6})
		newButton.button:SetText (_text)
		newButton.button.Text = newButton.button:GetFontString ()
		newButton.button.Text:SetJustifyV("LEFT");
		newButton.button.Text:SetWordWrap (true)
		newButton.button.Text:SetJustifyH ("TOP")
		newButton.button:SetFontString (newButton.button.Text)
		newButton.button.image = CreateTexture(_image, newButton.button, 2, 7, 48, 48)

		newButton.button:SetScript ("OnEnter", function (self)
				self:GetParent().bottomMouseover:Show ()
				self:GetParent().topMouseover:Show ()
			end)

		newButton.button:SetScript ("OnLeave", function (self)
				self:GetParent().bottomMouseover:Hide ()
				self:GetParent().topMouseover:Hide ()
			end)

		newButton.button:SetScript ("OnClick", function (self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB) end
				if _returnFunction then
					if _returnFunction (self, _frameNum) then
						self:GetParent().topSelected:Show ()
						self:GetParent().bottomSelected:Show ()
						L.Variables.TabViewing = _frameNum
						ClearAllDisplayEntries ()
						UpdateDisplayFrame ()
					end
				end
			end)

		newButton.SetEnabled = function (self, bool)
				self.button:SetEnabled (bool)
				if bool then
					self.topSelected:Hide ()
					self.bottomSelected:Hide ()
					self.button.image.texture:SetTexCoord (self.icon[1], self.icon[1] + .125, self.icon[2], self.icon[2] + .25)
				else self.button.image.texture:SetTexCoord (self.icon[1] + .125, self.icon[1] + .25, self.icon[2], self.icon[2] + .25)
				end
			end

		newButton.bottomSelected:Hide ()
		newButton.topSelected:Hide ()
		newButton.topMouseover:Hide ()
		newButton.bottomMouseover:Hide ()
		return newButton
	end

	-- General pulldown - DOES NOT REQUIRE level
	function CreateGeneralPullDown (parent, x_loc, y_loc, x_width, itemList, FuncToCall, FuncIfCheck)
		local pullDown = CreateFrame("Frame", nil, parent, "UIDropDownMenuTemplate")
		pullDown:SetPoint("TOPLEFT", x_loc, y_loc)
		UIDropDownMenu_SetWidth(pullDown, x_width)
		UIDropDownMenu_SetText(pullDown, L.Variables.favoriteNumber)
		UIDropDownMenu_Initialize(pullDown, function (self, level, menuList)
			for Index = 1, #itemList do
			 	local info = UIDropDownMenu_CreateInfo()
				info.justifyH = "LEFT"
				info.func = function (Self, newValue)
					UIDropDownMenu_SetText (pullDown, itemList[Index])
					CloseDropDownMenus ()
					UpdateDisplayFrame ()
					if FuncToCall then FuncToCall (newValue) end
				end
				info.text = itemList[Index]
				info.arg1 = itemList[Index]
				if FuncIfCheck ~= nil then info.checked = FuncIfCheck (itemList[Index]) end
				UIDropDownMenu_AddButton(info)
			end
		end)
		return pullDown
	end

	-- a Dungeon PULLDOWN - REQUIRES level
	function CreatePullDown(parent, x_loc, y_loc, x_width, singleSelection, Instance, InstanceSorted, FuncToCall) --, multipleLevel)
		--local Default = nil
		local info = UIDropDownMenu_CreateInfo();
		local pullDown = CreateFrame("Frame", nil, parent, "UIDropDownMenuTemplate")
		pullDown:SetPoint("TOPLEFT", x_loc, y_loc)
		UIDropDownMenu_SetWidth(pullDown, x_width)
		UIDropDownMenu_SetText(pullDown, L.Variables.favoriteNumber)
		UIDropDownMenu_Initialize(pullDown, function (self, level)
			local version = tonumber (strsub (GetBuildInfo(), 1, 1))
			level = level or 1
			if level == 1 then
				submenu={}
				for Index = 1, #InstanceSorted, 1 do
					key, value = InstanceSorted [Index], (LFG113InstanceKeys [InstanceSorted [Index]] == nil and Instance [InstanceSorted [Index]] or LFG113InstanceKeys [InstanceSorted [Index]])
					if value[9] then
						if submenu[value[9]] == nil and (value[9] == L.Locals.CurrentLocal ["Clients"]["1"] or
								(version >= 2 and (value[9] == L.Locals.CurrentLocal ["Clients"]["2"].." Normal" or value[9] == L.Locals.CurrentLocal ["Clients"]["2"].." Heroic" or value[9] == L.Locals.CurrentLocal ["Clients"]["2"])) or
								(version >= 3 and (value[9] == L.Locals.CurrentLocal ["Clients"]["3"].." Normal" or value[9] == L.Locals.CurrentLocal ["Clients"]["3"].." Heroic" or value[9] == L.Locals.CurrentLocal ["Clients"]["3"]))) then
							submenu[value[9]] = 1;
							info.hasArrow = true; -- creates submenus
							info.notCheckable = true;
							info.text = value[9];
							info.value = { ["Level1_Key"] = value[9]; };
  							UIDropDownMenu_AddButton(info, 1)
						end
					else
						if (UnitLevel("player") >= value [3] and UnitLevel("player") <= value [4]) or L.Variables.AllDungeonsChecked or L.Variables.CurrentSearch [key] ~= nil or singleSelection then
				 			--local info = UIDropDownMenu_CreateInfo()
							info.func = function (Self, newValue)
								UIDropDownMenu_SetText (self, LFG113InstanceKeys [newValue] == nil and Instance [newValue][2] or LFG113InstanceKeys [newValue][2])
								if FuncToCall then FuncToCall (newValue) end
							end
							info.text = value [2] .. " [" .. value [3] .. "-" .. value [4] .. "]"
							info.arg1 = key
							if not singleSelection then
								info.notCheckable = false;
								info.checked = L.Variables.CurrentSearch [key] ~= nil
								info.keepShownOnClick = 1
							end
  							UIDropDownMenu_AddButton(info, 1)
						end
					end
				end
			else
				local Level1_Key = UIDROPDOWNMENU_MENU_VALUE["Level1_Key"]
				for Index = 1, #InstanceSorted, 1 do
					key, value = InstanceSorted [Index], (LFG113InstanceKeys [InstanceSorted [Index]] == nil and Instance [InstanceSorted [Index]] or LFG113InstanceKeys [InstanceSorted [Index]])
					if ((UnitLevel("player") >= value [3] and UnitLevel("player") <= value [4]) or L.Variables.AllDungeonsChecked or L.Variables.CurrentSearch [key] ~= nil or singleSelection) and value[9] == Level1_Key then
						local attuned = ""
						if not singleSelection then


						--[=[
							-- check how far along attunement quests you are
							if (value[10]) then
								local aCount = 0
								for akey, avalue in pairs (value[10]) do print (tostring (C_QuestLog.IsQuestFlaggedCompleted(avalue)) .. ":" .. avalue)  if (C_QuestLog.IsQuestFlaggedCompleted(avalue)) then aCount = aCount + 1 end end
								if aCount == #value[10] then attuned = " |cff80FF80Fully Attuned"
								else attuned = " |cffFF8080Attuned (" .. aCount .. "/" .. #value[10] .. ")"
								end
							end
							-- check if honored with specific faction
							if (value[11]) then
								attuned = " |cffFF8080Not " .. L.Locals.CurrentLocal ["StandingID"][value[12]]
								for tkey, tvalue in pairs (value[11]) do
									name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canBeLFGBonus = GetFactionInfoByID(tvalue)
									if standingID >= value[12] then attuned = " |cff80FF80Fully " .. L.Locals.CurrentLocal ["StandingID"][value[12]]
									end
								end
							end
						]=]


						end
						--local info = UIDropDownMenu_CreateInfo()
						info.func = function (Self, newValue)
							UIDropDownMenu_SetText (self, LFG113InstanceKeys [newValue] == nil and Instance [newValue][2] or LFG113InstanceKeys [newValue][2])
							if FuncToCall then FuncToCall (newValue) end
						 	if singleSelection then CloseDropDownMenus () end
						end
						info.text = value [2] .. " [" .. value [3] .. "-" .. value [4] .. "]" .. attuned
						info.arg1 = key
						if not singleSelection then
							info.notCheckable = false;
							info.checked = L.Variables.CurrentSearch [key] ~= nil
							info.keepShownOnClick = 1
						end
						info.hasArrow = false
  						UIDropDownMenu_AddButton(info, 2)
					end
				end
			end
		end)
		return pullDown
	end

	function CreateScrollArea (FrameTouse, background, createHorizontalScroll)
		scrollframe = CreateFrame("ScrollFrame", nil, FrameTouse)
		scrollframe:SetPoint("TOPLEFT", 10, -10)
		scrollframe:SetPoint("BOTTOMRIGHT", -10, 10)
		scrollframe:EnableMouseWheel(true)
		scrollframe:SetScript ("OnMouseWheel", function (self, delta)
				if delta < 0 then self:GetParent().vScrollbar:SetValue(self:GetParent().vScrollbar:GetValue() + 10)
				else  self:GetParent().vScrollbar:SetValue(self:GetParent().vScrollbar:GetValue() - 10)
				end
			end)

		vScrollbar = CreateFrame("Slider", "LFG113VScroll", scrollframe, "OptionsSliderTemplate")
		FrameTouse.vScrollbar = vScrollbar
		vScrollbar:SetOrientation('VERTICAL')
		vScrollbar:SetPoint("TOPRIGHT", FrameTouse, 8, 0)
		vScrollbar:SetSize (9, FrameTouse:GetHeight())
		vScrollbar:SetMinMaxValues(1, 1)
		vScrollbar:SetValueStep(1)
		vScrollbar:SetValue(0)
		vScrollbar.Text:SetText(" ")
		vScrollbar.High:SetText(" ")
		vScrollbar.Low:SetText(" ")
		vScrollbar.scrollStep = 1
		vScrollbar:SetScript("OnValueChanged", function (self, value)
				self:GetParent():SetVerticalScroll(value)
			end)

		if createHorizontalScroll then
			hScrollbar = CreateFrame("Slider", nil, scrollframe, "OptionsSliderTemplate")
			FrameTouse.hScrollbar = hScrollbar
			hScrollbar:SetOrientation('HORIZONTAL')
			hScrollbar:SetPoint("BOTTOMLEFT", FrameTouse, 0, -12)
			hScrollbar:SetSize (FrameTouse:GetWidth (), 16)
			hScrollbar:SetMinMaxValues(1, 1)
			hScrollbar:SetValueStep(1)
			hScrollbar:SetValue(0)
			hScrollbar.Text:SetText(" ")
			hScrollbar.High:SetText(" ")
			hScrollbar.Low:SetText(" ")
			hScrollbar.scrollStep = 1
			hScrollbar:SetScript("OnValueChanged", function (self, value)
					self:GetParent():SetHorizontalScroll(value)
				end)
		end

		local texture = scrollframe:CreateTexture()
		texture:SetAllPoints()
		texture:SetTexture(background)
		scrollframe.texture = texture
		local content = CreateFrame("Frame", nil, scrollframe)
		content:SetSize(128, 256)
		scrollframe.content = content
		scrollframe:SetScrollChild(content)
		return scrollframe
	end

	function GetInstanceRow (instanceKey)
		for key, value in pairs (L.Locals.CurrentLocal ["PulldownInstance"]) do if key == instanceKey then return LFG113InstanceKeys[key] == nil and value or LFG113InstanceKeys[key] end end
		for key, value in pairs (L.Locals.CurrentLocal ["PulldownRaids"]) do if key == instanceKey then return LFG113InstanceKeys[key] == nil and value or LFG113InstanceKeys[key] end end
		for key, value in pairs (L.Locals.CurrentLocal ["PulldownPVP"]) do if key == instanceKey then return LFG113InstanceKeys[key] == nil and value or LFG113InstanceKeys[key] end end
		return {}
	end

	function DragFrame (Parent)
		Parent:SetMovable (true)
		Parent:EnableMouse (true)
		Parent:RegisterForDrag ("LeftButton")
		Parent:SetScript ("OnDragStart", Parent.StartMoving)
		Parent:SetScript ("OnDragStop", Parent.StopMovingOrSizing)
	end

	function GetABasicFrame (Parent, Level, width, Toptext)
		function makeAStar (parent, StartX, startY, Size, StarNumber)
			local Line = CreateFrame ("Frame", nil, parent)
			Line:SetPoint ("TOPLEFT", StarNumber * Size + StartX, startY)
			Line:SetSize (Size, Size)
			Line.image = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\Interface.tga", Line, 0, 0, Size, Size)
			Line.image.texture:SetTexCoord (.25, .375, .5, .75)
			return Line
		end

		for Index = 1, #L.Variables.BasicFramePool do
			if not L.Variables.BasicFramePool[Index].used then
				L.Variables.BasicFramePool[Index].Children = {}
				L.Variables.BasicFramePool[Index].offset = Level * 20
				L.Variables.BasicFramePool[Index].used = true
				L.Variables.BasicFramePool[Index].isOpen = false
				L.Variables.BasicFramePool[Index].tooltip = nil
				L.Variables.BasicFramePool[Index].topText = Toptext
				L.Variables.BasicFramePool[Index].Player:SetText ("")
				L.Variables.BasicFramePool[Index].Count:SetText ("")
				L.Variables.BasicFramePool[Index]:SetSize (width - L.Variables.BasicFramePool[Index].offset, 25)
				L.Variables.BasicFramePool[Index]:SetParent (Parent)
				if (L.Variables.TabViewing == 3 and Level > 0) or (L.Variables.TabViewing == 4 and Level == 0) then L.Variables.BasicFramePool[Index].btnRemove:Hide ()
				else
					L.Variables.BasicFramePool[Index].btnRemove:SetPoint ("TOPLEFT", width - 22 - (Level * 20), -2)
					L.Variables.BasicFramePool[Index].btnRemove:Show ()
				end
				if L.Variables.TabViewing ~= 6 or Level > 0 then L.Variables.BasicFramePool[Index].btnLoad:Hide ()
				else
					L.Variables.BasicFramePool[Index].btnLoad:SetPoint ("TOPLEFT", width - 80, -2)
					L.Variables.BasicFramePool[Index].btnLoad:Show ()
				end
				L.Variables.BasicFramePool[Index].Player:Show ()
				L.Variables.BasicFramePool[Index].isTank:Hide ()
				L.Variables.BasicFramePool[Index].isHeals:Hide ()
				L.Variables.BasicFramePool[Index].isDPS:Hide ()
				L.Variables.BasicFramePool[Index].Star1:Hide ()
				L.Variables.BasicFramePool[Index].Star2:Hide ()
				L.Variables.BasicFramePool[Index].Star3:Hide ()
				L.Variables.BasicFramePool[Index].Star4:Hide ()
				L.Variables.BasicFramePool[Index].Star5:Hide ()
				L.Variables.BasicFramePool[Index].Race:Hide ()
				L.Variables.BasicFramePool[Index].Class:Hide ()
				L.Variables.BasicFramePool[Index].Name:Hide ()
				L.Variables.BasicFramePool[Index].Runs:Hide ()

				return L.Variables.BasicFramePool[Index]
			end
		end
		newFrame = CreateFrame ("Frame", nil, Parent, BackdropTemplateMixin and "BackdropTemplate")
		newFrame.offset = Level * 20
		newFrame:SetSize (width - newFrame.offset, 25)
		newFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 }})
		newFrame:SetBackdropColor(1, 1, 1, .5)
		L.Variables.BasicFramePool[#L.Variables.BasicFramePool + 1] = newFrame
		newFrame.used = true
		newFrame.Player = CreateLabel (newFrame, 10, -7, "GameFontNormal", "")
		newFrame.Count = CreateLabel (newFrame, 200, -7, "GameFontNormal", "")
		newFrame.Children = {}
		newFrame.isOpen = false
		newFrame.topText = Toptext
		newFrame.isTank = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\Interface.tga", newFrame, 180, -4, 16, 16 )
		newFrame.isHeals = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\Interface.tga", newFrame, 200, -4, 16, 16 )
		newFrame.isDPS = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\Interface.tga", newFrame, 220, -4, 16, 16 )
		newFrame.isTank.texture:SetTexCoord (.5, .625, 0, .25)
		newFrame.isHeals.texture:SetTexCoord (.5, .625, .25, .5)
		newFrame.isDPS.texture:SetTexCoord (.75, .875, 0, .25)
		newFrame.isTank:Hide ()
		newFrame.isHeals:Hide ()
		newFrame.isDPS:Hide ()
		newFrame.Player:Show ()
		newFrame.Star1 = makeAStar (newFrame, 210, -6, 12, 1)
		newFrame.Star2 = makeAStar (newFrame, 210, -6, 12, 2)
		newFrame.Star3 = makeAStar (newFrame, 210, -6, 12, 3)
		newFrame.Star4 = makeAStar (newFrame, 210, -6, 12, 4)
		newFrame.Star5 = makeAStar (newFrame, 210, -6, 12, 5)
		newFrame.Race = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\RaceClass.tga", newFrame, 5, -4, 16, 16)
		newFrame.Class = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\RaceClass.tga", newFrame, 25, -4, 16, 16)
		newFrame.Name = CreateLabel (newFrame, 45, -7, "GameFontHighlight", "888888888888888")
		newFrame.Runs = CreateLabel (newFrame, 150, -7, "GameFontNormal", "888")
		newFrame.Star1:Hide ()
		newFrame.Star2:Hide ()
		newFrame.Star3:Hide ()
		newFrame.Star4:Hide ()
		newFrame.Star5:Hide ()
		newFrame.Race:Hide ()
		newFrame.Class:Hide ()
		newFrame.Name:Hide ()
		newFrame.Runs:Hide ()

		newFrame.SetRatings = function (Self, Level, Race, Class, Sex, Name, Runs, Rating)
			Self.Star1:Show ()
			Self.Star2:Show ()
			Self.Star3:Show ()
			Self.Star4:Show ()
			Self.Star5:Show ()
			if Level == 0 then
				Self.Race:Show ()
				Self.Class:Show ()
				Self.Race.texture:SetTexCoord (L.Variables.PlayerRace [Race]["map"]["sx"], L.Variables.PlayerRace [Race]["map"]["ex"], L.Variables.PlayerRace [Race]["map"]["sy"] + Sex, L.Variables.PlayerRace [Race]["map"]["ey"] + Sex)
				Self.Class.texture:SetTexCoord (L.Variables.PlayerClass [Class]["map"]["sx"], L.Variables.PlayerClass [Class]["map"]["ex"], L.Variables.PlayerClass [Class]["map"]["sy"], L.Variables.PlayerClass [Class]["map"]["ey"])
				Self.Name:SetText (Name)
				Self.Name:Show ()
				Self.Player:Hide ()
			else
				Self.Name:Hide ()
				Self.Player:Show ()
			end
			Self.Runs:Show ()
			Self.Count:SetText ("")
			Self.Player:SetText (Name)
			Self.Runs:SetText (Runs)
			Self.Star1.image.texture:SetTexCoord (Rating < 1 and .25 or .375, Rating < 1 and .375 or .5, .5, .75)
			Self.Star2.image.texture:SetTexCoord (Rating < 2 and .25 or .375, Rating < 2 and .375 or .5, .5, .75)
			Self.Star3.image.texture:SetTexCoord (Rating < 3 and .25 or .375, Rating < 3 and .375 or .5, .5, .75)
			Self.Star4.image.texture:SetTexCoord (Rating < 4 and .25 or .375, Rating < 4 and .375 or .5, .5, .75)
			Self.Star5.image.texture:SetTexCoord (Rating < 5 and .25 or .375, Rating < 5 and .375 or .5, .5, .75)
		end

		newFrame.btnLoad =  CreateButton (newFrame, width - 80, -2, 60, 20, L.Locals.CurrentLocal ["btnLoad"])
		newFrame.btnLoad:SetScript ("OnClick", function (self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				if self:GetText () == L.Locals.CurrentLocal ["btnLoad"] then
					if self:GetParent().Player:GetText () then
						if L.Variables.LoadedPremade ~= nil then L.Variables.LoadedPremade[1]:SetText (L.Locals.CurrentLocal ["btnLoad"]) end
						L.Variables.LoadedPremade = { self, self:GetParent().Player:GetText () }
						self:SetText (L.Locals.CurrentLocal ["btnUnload"])
						for key, value in pairs (LFG113Premades [L.Variables.LoadedPremade [2]]) do
							if key ~= "isRaid" and not memberIsInGroup (key) then InviteUnit (key) end
						end
					end
				else
					L.Variables.LoadedPremade = nil
					self:SetText (L.Locals.CurrentLocal ["btnLoad"])
				end
			end)
		if Level > 0 or L.Variables.TabViewing ~= 6 then newFrame.btnLoad:Hide () end

		newFrame.btnRemove = CreateButton (newFrame, width - 22 - newFrame.offset, -2, 20, 20, "x")
		newFrame.btnRemove:SetScript ("OnClick", function (self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				ClearAllDisplayEntries ()
				if L.Variables.TabViewing == 3 then
					if L.Variables.CurrentTabID == 1 then
						if self:GetParent().topText == nil then
							LFG113BlackList [self:GetParent().Player:GetText ()] = nil
							DisplayBlackList ()
						end
					elseif L.Variables.CurrentTabID == 3 then
						if self:GetParent().topText == nil then
							LFG113Ratings["Ratings"][self:GetParent().Player:GetText ()] = nil
							DisplayBlackList ()
						end
					end
				elseif L.Variables.TabViewing == 4 then
					local myKeyword, instanceKey = self:GetParent().Player:GetText (), self:GetParent().topText
					if LFG113InstanceKeys [instanceKey] == nil then
						LFG113InstanceKeys [instanceKey] = DeepCopy (GetInstanceRow (instanceKey))
						if LFG113InstanceKeys ["h" .. instanceKey] == nil and GetInstanceRow ("h" .. instanceKey) then LFG113InstanceKeys ["h" .. instanceKey] = DeepCopy (GetInstanceRow ("h" .. instanceKey)) end
					end
					LFG113InstanceKeys [instanceKey][7][myKeyword] = nil
					DisplayKeys (true)
					DisplayKeys (false)
				elseif L.Variables.TabViewing == 6 then
					if self:GetParent().topText == nil then LFG113Premades [self:GetParent().Player:GetText ()] = nil
					else LFG113Premades [self:GetParent().topText][self:GetParent().Player:GetText ()] = nil
					end
					DisplayPremades ()
				end
			end)
		if (L.Variables.TabViewing == 3 and L.Variables.CurrentTabID == 1 and Level > 0) or (L.Variables.TabViewing == 4 and Level == 0) then newFrame.btnRemove:Hide () end

		newFrame:SetScript ("OnMouseUp", function (self, button)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				if self.offset == 0 and IsShiftKeyDown () and button == "LeftButton" then
					if L.Variables.TabViewing == 3 then
						if L.Variables.CurrentTabID == 1 then
							L.Frames.mainFrame.BlockList.reportedText:SetText (self.Player:GetText ())
							L.Frames.mainFrame.BlockList.issueText:SetText (self.personalInformation ~= nil and self.personalInformation ["issue"] or "")
						elseif L.Variables.CurrentTabID == 3 then

						end
					elseif L.Variables.TabViewing == 6 then
						ShiftClick = self.Player:GetText ()
						L.Frames.mainFrame.BlockList.issueText:SetText (self.Player:GetText ())
						L.Frames.mainFrame.BlockList.isRaid:SetChecked (LFG113Premades [self.Player:GetText ()]["isRaid"])
					end
				elseif self.offset ~= 0 and IsShiftKeyDown () and button == "LeftButton" and L.Variables.TabViewing == 6 then
						L.Frames.mainFrame.BlockList.issueText:SetText (self.topText)
						L.Frames.mainFrame.BlockList.reportedText:SetText (self.Player:GetText ())
						local roles = LFG113Premades [self.topText][self.Player:GetText ()]
						L.Frames.mainFrame.BlockList.isTank:SetChecked (roles:find("1") ~= nil)
						L.Frames.mainFrame.BlockList.isHeals:SetChecked (roles:find("2") ~= nil)
						L.Frames.mainFrame.BlockList.isDPS:SetChecked (roles:find("3") ~= nil)
						L.Frames.mainFrame.BlockList.isRaid:SetChecked (LFG113Premades [self.topText]["isRaid"])
				elseif next (self.Children) then
					self.isOpen = not self.isOpen
					if self.isOpen then L.Variables.tableOpen [self.Player:GetText ()] = "y"
					else L.Variables.tableOpen [self.Player:GetText ()] = nil
					end


					DisplayBlackListItems (L.Variables.CurrentTab, 0, 1, L.Variables.CurrentTab.BlackList, true) --L.Frames.mainFrame.BlockList.topTabs ["Blacklist"])
				end
				if L.Variables.TabViewing == 4 then
					local myParentKey
					if self.offset == 0 then myParentKey = self.key
					else myParentKey = self.topText
					end
					local myRowInfo = GetInstanceRow (myParentKey)
					L.Frames.mainFrame.Settings.topTabs ["Keywords"].lblInstanceKey:SetText (myParentKey)
					L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtPulldown:SetText (myRowInfo [2])
					L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtPulldown.key = myParentKey
					L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtBroadcast:SetText (myRowInfo [5])
					L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtBroadcast.key = myParentKey
					L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtLowerLevel:SetText (myRowInfo [3])
					L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtLowerLevel.key = myParentKey
					L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtHigherLevel:SetText (myRowInfo [4])
					L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtHigherLevel.key = myParentKey
					L.Frames.mainFrame.Settings.topTabs ["Keywords"].btnDefault:Show ()
					L.Frames.mainFrame.Settings.topTabs ["Keywords"].btnAdd:Show ()
				end
				L.Frames.mainFrame.BlockList.Add:SetEnabled (L.Frames.mainFrame.BlockList.issueText:GetText ():len() > 0)
			end)
		newFrame:SetScript ("OnEnter", function (self)
				self:SetBackdropColor(1, 1, 1, 1)
				ToolTipOnEnter (self)
			end)
		newFrame:SetScript ("OnLeave", function (self)
				self:SetBackdropColor(1, 1, 1, .5)
				ToolTipOnLeave (self)
			end)
		newFrame.AddChild = function (self, Child)
				self.Children [#self.Children + 1] = Child
			end
		return newFrame
	end

	local function SetUpCompactFrame (frame)
		if LFG113Saved ["compactDesign"] and L.Variables.TabViewing ~= 5 then
			frame.PlayerInstance:SetPoint ("TOPLEFT", 10, -10)
			frame.PlayerName:Hide ()
			frame.PlayerLevel:Hide ()
			frame.PlayerClass:Hide ()
			frame.Star1:Hide ()
			frame.Star2:Hide ()
			frame.Star3:Hide ()
			frame.Star4:Hide ()
			frame.Star5:Hide ()
			frame.btnLoad:SetPoint ("TOPLEFT", 240, -4)
			frame.btnAccept:SetPoint ("TOPLEFT", 240, -4)
			frame.btnInvite:SetPoint ("TOPLEFT", 240, -4)
			frame.btnJoin:SetPoint ("TOPLEFT", 240, -4)
			frame.btnRemove:SetPoint ("TOPLEFT", 180, -4)
			frame.btnDecline:SetPoint ("TOPLEFT", 180, -4)
			frame.blackList:SetSize (20, 20)
		else
			frame.PlayerInstance:SetPoint ("TOPLEFT", 10, -43)
			frame.PlayerName:Show ()
			frame.PlayerLevel:Show ()
			frame.PlayerClass:Show ()
			if frame.rating ~= nil then
				frame.Star1:Show ()
				frame.Star2:Show ()
				frame.Star3:Show ()
				frame.Star4:Show ()
				frame.Star5:Show ()
			else
				frame.Star1:Hide ()
				frame.Star2:Hide ()
				frame.Star3:Hide ()
				frame.Star4:Hide ()
				frame.Star5:Hide ()
			end
			frame.btnLoad:SetPoint ("TOPLEFT", 240, -4)
			frame.btnRemove:SetPoint ("TOPLEFT", 240, -35)
			frame.btnAccept:SetPoint ("TOPLEFT", 240, -4)
			frame.btnDecline:SetPoint ("TOPLEFT", 240, -35)
			frame.btnInvite:SetPoint ("TOPLEFT", 240, -4)
			frame.btnJoin:SetPoint ("TOPLEFT", 240, -4)
			frame.blackList:SetSize (50, 50)
		end
		frame:SetSize (320, (LFG113Saved ["compactDesign"] and L.Variables.TabViewing ~= 5) and 30 or 60)
	end

	function GetAFrame (Parent)
		function makeAStar (parent, StarNumber)
			local Line = CreateFrame ("Frame", nil, parent)
			Line:SetPoint ("TOPLEFT", (StarNumber * 10) + 180, -8)
			Line:SetSize (16, 16)
			Line.image = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\Interface.tga", Line, 0, 0, 10, 10)
			Line.image.texture:SetTexCoord (.25, .375, .5, .75)
			return Line
		end

		for Index = 1, #L.Variables.FramePool do
			if not L.Variables.FramePool[Index].used then
				L.Variables.FramePool[Index].used = true
				L.Variables.FramePool[Index]:SetParent (Parent)
				L.Variables.FramePool[Index].rating = nil
				L.Variables.FramePool[Index].blackList:Hide ()
				L.Variables.FramePool[Index].btnAccept:SetEnabled (true)
				L.Variables.FramePool[Index].btnDecline:SetEnabled (true)
				L.Variables.FramePool[Index].btnInvite:SetEnabled (true)
				L.Variables.FramePool[Index].btnLoad:SetEnabled (true)
				L.Variables.FramePool[Index].btnRemove:SetEnabled (true)
				L.Variables.FramePool[Index].btnJoin:SetEnabled (true)
				L.Variables.FramePool[Index].btnJoin:SetText ((UnitIsGroupLeader ("player") or GetNumGroupMembers() == 0) and L.Locals.CurrentLocal ["btnJoin"] or L.Locals.CurrentLocal ["btnNotify"])
				L.Variables.FramePool[Index].btnInvite:SetText ((UnitIsGroupLeader ("player") or GetNumGroupMembers() == 0) and L.Locals.CurrentLocal ["btnInvite"] or L.Locals.CurrentLocal ["btnNotify"])
				SetUpCompactFrame (L.Variables.FramePool[Index])
				return L.Variables.FramePool[Index]
			end
		end

		newFrame = CreateFrame ("Frame", nil, Parent, BackdropTemplateMixin and "BackdropTemplate")
		newFrame:SetSize (320, LFG113Saved ["compactDesign"] and 30 or 60)
		newFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 }})
		newFrame:SetBackdropColor(1,1,1,.5)
		newFrame:SetFrameLevel (2)

		L.Variables.FramePool[#L.Variables.FramePool + 1] = newFrame
		newFrame.used = true
		newFrame.player = ""
		newFrame:SetScript("OnEnter", ToolTipOnEnter)
		newFrame:SetScript("OnLeave", ToolTipOnLeave)

		newFrame.blackList = CreateTexture("Interface\\AddOns\\LFG113\\textures\\Interface.tga", newFrame, 10, -5, 50, 50)
		newFrame.blackList.texture:SetTexCoord (.375, .5, .75, 1)
		newFrame.blackList:SetFrameLevel (1)
		newFrame.blackList:Hide ()

		newFrame.PlayerName = CreateLabel (newFrame, 10, -3, "GameFontNormal", "")
		newFrame.PlayerName:SetFont ("Fonts\\MORPHEUS.ttf", 22)
		newFrame.PlayerLevel = CreateLabel (newFrame, 10, -28, "GameFontNormal", "")
		newFrame.PlayerClass = CreateLabel (newFrame, 35, -28, "GameFontNormal", "")
		newFrame.PlayerInstance = CreateLabel (newFrame, 10, -43, "GameFontNormal", "")

		newFrame.roleTank = CreateTexture("Interface\\AddOns\\LFG113\\textures\\Interface.tga", newFrame, 165, -20, 22, 22)
		newFrame.roleHeals = CreateTexture("Interface\\AddOns\\LFG113\\textures\\Interface.tga", newFrame, 185, -20, 22, 22)
		newFrame.roleDPS = CreateTexture("Interface\\AddOns\\LFG113\\textures\\Interface.tga", newFrame, 205, -20, 22, 22)
		newFrame.roleTank.texture:SetTexCoord (.5, .625, 0, .25)
		newFrame.roleHeals.texture:SetTexCoord (.5, .625, .25, .5)
		newFrame.roleDPS.texture:SetTexCoord (.75, .875, 0, .25)

		-- make stars
		newFrame.Star1 = makeAStar (newFrame, 1)
		newFrame.Star2 = makeAStar (newFrame, 2)
		newFrame.Star3 = makeAStar (newFrame, 3)
		newFrame.Star4 = makeAStar (newFrame, 4)
		newFrame.Star5 = makeAStar (newFrame, 5)

		newFrame.btnLoad = CreateButton (newFrame, 240, -4, 60, 20, L.Locals.CurrentLocal ["btnLoad"])
		newFrame.btnLoad:SetScript ("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				local Search = LFG113Searches [self:GetParent().key]
				L.Frames.mainFrame.TopTab.TankCheckButton:SetChecked (Search ["Roles"]:find("1") ~= nil)
				L.Frames.mainFrame.TopTab.HealsCheckButton:SetChecked (Search ["Roles"]:find("2") ~= nil)
				L.Frames.mainFrame.TopTab.DPSCheckButton:SetChecked (Search ["Roles"]:find("3") ~= nil)
				L.Frames.mainFrame.TopTab.customText:SetText (Search ["Custom"])

				L.Variables.CurrentSearch = {}
				for key, value in pairs (LFG113Searches [self:GetParent().key]["Searches"]) do
					if value[1] == "1" then L.Variables.CurrentSearch [value[2]] = { value[1], LFG113InstanceKeys [value[2]] == nil and L.Locals.CurrentLocal ["PulldownInstance"][value[2]] or LFG113InstanceKeys [value[2]] }
					elseif value[1] == "2" then L.Variables.CurrentSearch [value[2]] = { value[1], LFG113InstanceKeys [value[2]] == nil and L.Locals.CurrentLocal ["PulldownRaids"][value[2]] or LFG113InstanceKeys [value[2]] }
					elseif value[1] == "3" then L.Variables.CurrentSearch [value[2]] = { value[1], L.Variables.Quests [value[2]] }
					elseif value[1] == "4" then L.Variables.CurrentSearch [value[2]] = { value[1], LFG113InstanceKeys [value[2]] == nil and L.Locals.CurrentLocal ["PulldownPVP"][value[2]] or LFG113InstanceKeys [value[2]] }
					end
				end
				if Search["TAB"] == 1 then L.Frames.mainFrame.LeftTab.LFMButton.button:GetScript ("OnClick")(L.Frames.mainFrame.LeftTab.LFMButton.button)
				else L.Frames.mainFrame.LeftTab.LFGButton.button:GetScript ("OnClick")(L.Frames.mainFrame.LeftTab.LFMButton.button)
				end
			end)

		newFrame.btnRemove = CreateButton (newFrame, 240, -35, 60, 20, L.Locals.CurrentLocal ["btnRemove"])
		newFrame.btnRemove:SetScript ("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Searches [self:GetParent().key] = nil
				ClearAllDisplayEntries ()
				UpdateDisplayFrame ()
			end)

		newFrame.btnAccept = CreateButton (newFrame, 240, -4, 60, 20, L.Locals.CurrentLocal ["btnAccept"])
		newFrame.btnAccept:SetScript ("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				self:SetEnabled (false)
				L.Variables.AddOnChatWindowMessages[self:GetParent().player][4] = true
				SendChatMessage (FormatWhisperString (LFG113Saved ["whisperAccept"], self:GetParent().player)[1], "WHISPER", "Common", self:GetParent().player)
				InviteUnit (self:GetParent().player)
			end)

		newFrame.btnDecline = CreateButton (newFrame, 240, -35, 60, 20, L.Locals.CurrentLocal ["btnDecline"])
		newFrame.btnDecline:SetScript ("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				self:SetEnabled (false)
				SendChatMessage (FormatWhisperString (LFG113Saved ["whisperDecline"], self:GetParent().player)[1], "WHISPER", "Common", self:GetParent().player)
				L.Variables.AddOnChatWindowMessages [self:GetParent ().player] = nil
			end)

		newFrame.btnInvite = CreateButton (newFrame, 240, -4, 60, 20, (UnitIsGroupLeader ("player") or GetNumGroupMembers() == 0) and L.Locals.CurrentLocal ["btnInvite"] or L.Locals.CurrentLocal ["btnNotify"])
		newFrame.btnInvite:SetScript ("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				if (UnitIsGroupLeader ("player") or GetNumGroupMembers() == 0) then
					local myInstanceString, tmpTable = "", {}
					for key, value in pairs (L.Variables.CurrentSearch) do
						if tmpTable [value [1]] then
							tmpTable [value [1]] = tmpTable [value [1]] .. "!"  .. tostring(value [1]) .. ":" .. key
							myInstanceString = myInstanceString .. " / " .. key
						else
							tmpTable [value [1]] = tostring(value [1]) .. ":" .. key
							myInstanceString = myInstanceString .. " " .. key
						end
					end

					local myInstances = ""
					for key, value in pairs (tmpTable) do
						myInstances = myInstances .. (myInstances ~= "" and "!" or "").. value
					end

					if Instance ~= "any" then
						--BroadcastMessage (L.Variables.BroadCastChannel, "4," .. self:GetParent().player .. "," .. myInstances)
						if L.Variables.guildOnly then SendChatMessage (FormatWhisperString (LFG113Saved ["whisperGuildInvite"], self:GetParent().player)[1], "WHISPER", "Common", self:GetParent ().player)
						else SendChatMessage(FormatWhisperString (LFG113Saved ["whisperAccept"], self:GetParent().player)[1], "WHISPER", "Common", self:GetParent ().player)
						end
						self:SetEnabled (false)
						L.Variables.AddOnChatWindowMessages [self:GetParent ().player][4] = true
						InviteUnit (self:GetParent ().player)
					end
				else
					if IsInRaid() then
						   for i=1,40 do
							if UnitName('raid'..i) and UnitIsGroupLeader(UnitName('raid'..i)) then
								SendChatMessage (FormatWhisperString (L.Locals.CurrentLocal ["txtDefaultWhispers"]["whisperPartyLeader"], self:GetParent ().player)[1], "WHISPER", "Common", UnitName('raid'..i))
							end
						end
					elseif IsInGroup() then
						for i=1,4 do
							if UnitName('party'..i) and UnitIsGroupLeader(UnitName('party'..i)) then
								SendChatMessage (FormatWhisperString (L.Locals.CurrentLocal ["txtDefaultWhispers"]["whisperPartyLeader"], self:GetParent ().player)[1], "WHISPER", "Common", UnitName('party'..i))
							end
						end
					end
				end
			end)

		newFrame.btnJoin = CreateButton (newFrame, 240, -4, 60, 20, (UnitIsGroupLeader ("player") or GetNumGroupMembers() == 0) and L.Locals.CurrentLocal ["btnJoin"] or L.Locals.CurrentLocal ["btnNotify"])
		newFrame.btnJoin:SetScript ("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				if (UnitIsGroupLeader ("player") or GetNumGroupMembers() == 0) then
					local txtRoles, Roles = "", ""
					if L.Frames.mainFrame.TopTab.TankCheckButton:GetChecked() and L.Variables.CanTank then Roles, txtRoles = "1", L.Locals.CurrentLocal ["Tank"] .. " " end
					if L.Frames.mainFrame.TopTab.HealsCheckButton:GetChecked() and L.Variables.CanHeal then Roles, txtRoles = Roles .. "2", txtRoles .. (txtRoles~="" and "/" or "") .. L.Locals.CurrentLocal ["Heal"] end
					if L.Frames.mainFrame.TopTab.DPSCheckButton:GetChecked() and L.Variables.CanDPS then Roles, txtRoles = Roles .. "3", txtRoles .. (txtRoles~="" and "/" or "") .. L.Locals.CurrentLocal ["DPS"] end
					if Roles:len() > 0 then
						L.Variables.AddOnChatWindowMessages[self:GetParent().player][4] = true
						--BroadcastMessage (L.Variables.BroadCastChannel, "5," .. self:GetParent().player .. "," .. UnitClass ("player") .. "," .. UnitLevel("player") .. "," .. Roles)
						SendChatMessage(FormatWhisperString (LFG113Saved ["whisperJoin"], self:GetParent().player)[1], "WHISPER", "Common", self:GetParent().player)
						self:SetEnabled (false)
					else
						if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.RAID_WARNING) end
						ChatFrame1:AddMessage (L.Locals.CurrentLocal ["txtMissingRole"], 0, 1, 1)
					end
				else
					if IsInRaid() then
						   for i=1,40 do
							if UnitName('raid'..i) and UnitIsGroupLeader(UnitName('raid'..i)) then
								SendChatMessage (FormatWhisperString (L.Locals.CurrentLocal ["txtDefaultWhispers"]["whisperPartyLeader"], self:GetParent ().player)[1], "WHISPER", "Common", UnitName('raid'..i))
							end
						end
					elseif IsInGroup() then
						for i=1,4 do
							if UnitName('party'..i) and UnitIsGroupLeader(UnitName('party'..i)) then
								SendChatMessage (FormatWhisperString (L.Locals.CurrentLocal ["txtDefaultWhispers"]["whisperPartyLeader"], self:GetParent ().player)[1], "WHISPER", "Common", UnitName('party'..i))
							end
						end
					end
				end
			end)
		newFrame.btnJoin:Hide ()

		newFrame.basicSetup = function (Self, Player, Level, Class, Roles, Instance, ToolTip)
			Self.player = Player
			Self.tooltip = ToolTip
			Self.PlayerName:SetText ((LFG113BlackList [Player] and "\124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_7:12\124t" or "" ) .. (Player and Player or ""))
			Self.PlayerLevel:SetText (Level ~= "0" and Level or "")
			Self.PlayerClass:SetText (Class and Class or "")
			Self.PlayerInstance:SetText (Instance and Instance or "")
			if (LFG113Ratings ["Ratings"][Player]) then Self.SetStars (Self, LFG113Ratings ["Ratings"][Player]["Rating"]) end
			if LFG113BlackList [Player] then Self.blackList:Show () end
			if Roles:find ("1") and not LFG113Saved ["compactDesign"] then Self.roleTank:Show ()
			else Self.roleTank:Hide ()
			end
			if Roles:find ("2") and not LFG113Saved ["compactDesign"] then Self.roleHeals:Show ()
			else Self.roleHeals:Hide ()
			end
			if Roles:find ("3") and not LFG113Saved ["compactDesign"] then Self.roleDPS:Show ()
			else Self.roleDPS:Hide ()
			end
		end

		newFrame.SetupLFG = function (Self, Player, Level, Class, Roles, Instance, ToolTip, request, response)
			local DoWeHaveResponses = false
			Self.basicSetup (Self, Player, Level, Class, Roles, Instance, ToolTip)
			if response then
				DoWeHaveResponses = true
				Self.btnAccept:Show ()
				Self.btnDecline:Show ()
				Self.btnJoin:Hide ()
			else
				Self.btnAccept:Hide ()
				Self.btnDecline:Hide ()
				Self.btnJoin:Show ()
			end
			Self.btnLoad:Hide ()
			Self.btnRemove:Hide ()
			Self.btnInvite:Hide ()
			if request then	Self.btnJoin:SetEnabled (false)
			else Self.btnJoin:SetEnabled (true)
			end
			return DoWeHaveResponses
		end

		newFrame.SetupLFM = function (Self, Player, Level, Class, Roles, Instance, ToolTip, request, response)
			local DoWeHaveResponses = false
			Self.basicSetup (Self, Player, Level, Class, Roles, Instance, ToolTip)
			if response then
				DoWeHaveResponses = true
				Self.btnAccept:Show ()
				Self.btnDecline:Show ()
				Self.btnInvite:Hide ()
			else
				Self.btnAccept:Hide ()
				Self.btnDecline:Hide ()
				Self.btnInvite:Show ()
			end
			Self.btnLoad:Hide ()
			Self.btnRemove:Hide ()
			Self.btnJoin:Hide ()
			if request then	Self.btnInvite:SetEnabled (false)
			else Self.btnInvite:SetEnabled (true)
			end
			return DoWeHaveResponses
		end

		newFrame.SetupSearch = function (Self, key, groupType, roles, instances, toolTip)
			Self.btnAccept:Hide ()
			Self.btnDecline:Hide ()
			Self.btnInvite:Hide ()
			Self.btnJoin:Hide ()
			Self.btnLoad:Show ()
			Self.btnRemove:Show ()
			Self.basicSetup (Self, key, groupType, "", roles, instances, toolTip)
		end

		newFrame.SetStars = function (parent, Rating)
			parent.Star1.image.texture:SetTexCoord (Rating < 1 and .25 or .375, Rating < 1 and .375 or .5, .5, .75)
			parent.Star2.image.texture:SetTexCoord (Rating < 2 and .25 or .375, Rating < 2 and .375 or .5, .5, .75)
			parent.Star3.image.texture:SetTexCoord (Rating < 3 and .25 or .375, Rating < 3 and .375 or .5, .5, .75)
			parent.Star4.image.texture:SetTexCoord (Rating < 4 and .25 or .375, Rating < 4 and .375 or .5, .5, .75)
			parent.Star5.image.texture:SetTexCoord (Rating < 5 and .25 or .375, Rating < 5 and .375 or .5, .5, .75)
			parent.rating = Rating
			SetUpCompactFrame (parent)
		end

		newFrame:SetScript ("OnMouseDown", function (self, button)
				if button == "LeftButton" then
					if IsShiftKeyDown() then
						local e = DEFAULT_CHAT_FRAME.editBox
						ChatEdit_ActivateChat(e)
						e:SetText("/t " .. self.player .. " ")
					end
				end
			end)

		SetUpCompactFrame (newFrame)
		return newFrame
	end

	local waitTable = {};
	local waitFrame = nil;
	function wait(delay, func, ...)
		if(type(delay)~="number" or type(func)~="function") then return false end
		if(waitFrame == nil) then
			waitFrame = CreateFrame("Frame","WaitFrame", UIParent)
			waitFrame:SetScript("onUpdate", function (self, elapse)
				local count = #waitTable
				local i = 1
				while(i<=count) do
					local waitRecord = tremove(waitTable,i)
					local d = tremove(waitRecord,1)
					local f = tremove(waitRecord,1)
					local p = tremove(waitRecord,1)
					if(d>elapse) then
						tinsert(waitTable,i,{d-elapse,f,p})
						i = i + 1
					else
						count = count - 1
						f(unpack(p))
					end
				end
			end)
		end
		tinsert(waitTable,{delay,func,{...}})
		return true
	end


	local currentBlacklistReported = nil
	local currentBlacklistReporter = nil
	local currentBlacklistTbl = nil
	local currentBLStartedReceiving = false
	local function IterateBlacklistTable (finalCode)
		if currentBlacklistReported and currentBlacklistReporter then
			SendChatMessage ("!1132" .. currentBlacklistReported .. "," .. currentBlacklistReporter .. "," .. LFG113BlackList[currentBlacklistReported][currentBlacklistReporter]["version"] .. "," .. LFG113BlackList[currentBlacklistReported][currentBlacklistReporter]["date"], "WHISPER", "Common", L.Variables.BlacklistClient)
			SendChatMessage ("!1133" .. LFG113BlackList[currentBlacklistReported][currentBlacklistReporter]["issue"], "WHISPER", "Common", L.Variables.BlacklistClient)
			if currentBlacklistReported then currentBlacklistReporter = next (currentBlacklistTbl, currentBlacklistReporter) end
			if currentBlacklistReporter == nil then
				currentBlacklistReported, currentBlacklistTbl = next (LFG113BlackList, currentBlacklistReported)
				if currentBlacklistReported then currentBlacklistReporter = next (currentBlacklistTbl, currentBlacklistReporter) end
			end
		else
			L.Frames.mainFrame.SyncBlacklist:Cancel ()
			currentBlacklistReported = nil
			currentBlacklistReporter = nil
			currentBlacklistTbl = nil
			SendChatMessage (finalCode, "WHISPER", "Common", L.Variables.BlacklistClient)
		end
	end

	local function SendBlackList (finalCode)
		currentBlacklistReported, currentBlacklistTbl = next (LFG113BlackList)
		if currentBlacklistReported then currentBlacklistReporter = next (currentBlacklistTbl) end
		L.Frames.mainFrame.SyncBlacklist = C_Timer.NewTicker (1, function ()  IterateBlacklistTable (finalCode) end)
	end

	local function BlacklistSwap (code, message)
		if L.Variables.BlacklistSwapping == 0 then return
		elseif code == "1" then -- We recieved a request, respond that we will accept swapping information, Start sending list
			print ("Blacklist Sync Started with " .. L.Variables.BlacklistClient)
			print ("Blacklist Sync Sending...")
			SendBlackList ("!1134")
		elseif code == "2" then -- We Receieved the starting information
			if currentBLStartedReceiving == false then
				currentBLStartedReceiving = true
				print ("Blacklist Sync Receiving...")
			end
			local data = { strsplit (",", message) } -- Reported,reporter,version,date
			if L.Variables.reporters [data [2]] == nil then
				L.Variables.reporters [data [2]] = {
					["count"] = 0,
					["dates"] = { },
				}
			end
			L.Variables.BlacklistPlaceholder = nil
			if LFG113BlackList [data [1]] == nil then LFG113BlackList [data [1]] = {} end
			if LFG113BlackList [data [1]][data [2]] == nil then
				LFG113BlackList [data [1]][data [2]] = {
					["date"]	= data [4], -- international date format yy/mm/dd
					["version"] = data [3],
					["removed"] = "0",
					["personal"] = "n",
					["issue"]	= ""
				}
				L.Variables.BlacklistPlaceholder = LFG113BlackList [data [1]][data [2]]
			else
				if tonumber (LFG113BlackList [data [1]][data [2]]["version"]) < tonumber (data [3]) then
					LFG113BlackList [data [1]][data [2]]["date"] = data [4]
					LFG113BlackList [data [1]][data [2]]["version"] = data [3]
					LFG113BlackList [data [1]][data [2]]["issue"] = ""
					L.Variables.BlacklistPlaceholder = LFG113BlackList [data [1]][data [2]]
				end
			end
		elseif code == "3" then -- We Recieved the last bit of information: the text
			if L.Variables.BlacklistPlaceholder then L.Variables.BlacklistPlaceholder ["issue"] = message end
		elseif code == "4" then -- Client finished sending, my turn to send information
			print ("Blacklist Sync Sending...")
			SendBlackList ("!1135")
		elseif code == "5" then -- We are done.
			SendChatMessage ("!1136", "WHISPER", "Common", L.Variables.BlacklistClient)
			print ("Blacklist Sync Completed with " .. L.Variables.BlacklistClient)
			L.Variables.BlacklistSwapping = 0
			L.Variables.BlacklistClient = ""
			L.Variables.BlacklistPlaceholder = nil
			currentBLStartedReceiving = false
		elseif code == "6" then -- They are done.
			print ("Blacklist Sync Completed with " .. L.Variables.BlacklistClient)
			L.Variables.BlacklistSwapping = 0
			L.Variables.BlacklistClient = ""
			L.Variables.BlacklistPlaceholder = nil
			currentBLStartedReceiving = false
		end
	end

	--!1142Player,Race,Sex,Class,rating
	--!1147Date,Rating,Level,Instance~Instance
	--!1143Comment

	local currentRatingsPlayer = nil
	local currentRatingsDate = nil
	local currentRatingsTbl = nil
	local currentRTStartedReceiving = false
	local function IterateRatingsTable (finalCode)
		if currentRatingsPlayer then
			if currentRatingsTbl["New"] then currentRatingsTbl["New"] = nil
			else
				local auth = L.Variables.RatingsClient
				if auth ~= nil and auth:find("-") then auth = auth:sub(1, auth:find("-") - 1):lower() end
				SendChatMessage ("!1142" .. currentRatingsPlayer .. "," .. currentRatingsTbl["Race"] .. "," .. currentRatingsTbl["Sex"] .. "," .. currentRatingsTbl["Class"] .. "," .. currentRatingsTbl["Rating"], "WHISPER", "Common", L.Variables.RatingsClient)
				for key, value in pairs (currentRatingsTbl["Instances"]) do
					local combinedInstances = ""
					for iKey, iValue in pairs (value["Instances"]) do combinedInstances =  combinedInstances .. (combinedInstances:len() > 0 and "~" or "") ..iKey end
					if combinedInstances:len() > 0 and auth ~= value["Reporter"] then
						SendChatMessage ("!1147" .. key .. "," .. value["Rating"] .. "," .. value["Level"] .. "," .. combinedInstances .. "," .. (value["Reporter"] ~= nil and value["Reporter"] or L.Variables.Player), "WHISPER", "Common", L.Variables.RatingsClient)
						if value["Comment"]:len() > 0 then SendChatMessage ("!1143" .. value["Comment"], "WHISPER", "Common", L.Variables.RatingsClient) end
					end
				end
			end
			currentRatingsPlayer, currentRatingsTbl = next (LFG113Ratings["Ratings"], currentRatingsPlayer)
		else
			L.Frames.mainFrame.SyncRatings:Cancel ()
			currentRatingsPlayer = nil
			currentRatingsDate = nil
			currentRatingsTbl = nil
			SendChatMessage (finalCode, "WHISPER", "Common", L.Variables.RatingsClient)
		end
	end

	local function SendRatings (finalCode)
		currentRatingsPlayer, currentRatingsTbl = next (LFG113Ratings["Ratings"])
		if currentRatingsPlayer then
			L.Frames.mainFrame.SyncRatings = C_Timer.NewTicker (1, function ()  IterateRatingsTable (finalCode) end)
		end
	end

	local function RatingsSwap (code, message)
		if L.Variables.RatingSwapping == 0 then return
		elseif code == "1" then -- We recieved a request, respond that we will accept swapping information, Start sending list
			print ("Ratings Sync Started with " .. L.Variables.RatingsClient)
			print ("Ratings Sync Sending...")
			SendRatings ("!1144")
		elseif code == "2" then -- We Receieved the starting information
			if currentRTStartedReceiving == false then
				currentRTStartedReceiving = true
				print ("Ratings Sync Receiving...")
			end
			local data = { strsplit (",", message) } -- Player,Race,Sex,Class,Rating,DATE;DATE;DATE
			if LFG113Ratings["Ratings"][data[1]] == nil then LFG113Ratings["Ratings"][data[1]] = { ["Race"] = data[2], ["Sex"] = tonumber (data[3]), ["Class"] = data[4], ["Rating"] = tonumber(data[5]), ["Instances"] = {}, ["New"] = true } end
			L.Variables.RatingsPlaceholder = LFG113Ratings["Ratings"][data[1]]["Instances"]
		elseif code == "3" then -- We Recieved the last bit of information: the text
			if L.Variables.RatingsPlaceholder then L.Variables.RatingsPlaceholder [currentRatingsDate]["Comment"] = message end
		elseif code == "4" then -- Client finished sending, my turn to send information
			print ("Ratings Sync Sending...")
			SendRatings ("!1145")
		elseif code == "5" then -- We are done.
			print ("Ratings Sync Completed with " .. L.Variables.RatingsClient)
			SendChatMessage ("!1146", "WHISPER", "Common", L.Variables.RatingsClient)
			L.Variables.RatingsSwapping = 0
			L.Variables.RatingsClient = ""
			L.Variables.RatingsPlaceholder = nil
			currentRTStartedReceiving = false
			for key, value in pairs (LFG113Ratings["Ratings"]) do value["New"] = nil end
		elseif code == "6" then -- They are done.
			print ("Ratings Sync Completed with " .. L.Variables.RatingsClient)
			L.Variables.RatingsSwapping = 0
			L.Variables.RatingsClient = ""
			L.Variables.RatingsPlaceholder = nil
			currentRTStartedReceiving = false
			for key, value in pairs (LFG113Ratings["Ratings"]) do value["New"] = nil end
		elseif code == "7" then -- Extension - Date,Rating,Level,Instance~Instance
			if L.Variables.RatingsPlaceholder then
				local data = { strsplit (",", message) } -- Date,Rating,Level,Instance~Instance,Reporter
				currentRatingsDate = data[1]
				if L.Variables.RatingsPlaceholder [data[1]] == nil then
					L.Variables.RatingsPlaceholder [data[1]] = { ["Rating"] = tonumber(data[2]), ["Level"] = tonumber(data[3]), ["Comment"] = "", ["Instances"] = {}, ["Reporter"] = data[5]:len() > 0 and data[5] or nil }
					local instanceData = { strsplit ("~", data[4]) }
					for key, value in pairs (instanceData) do L.Variables.RatingsPlaceholder [data[1]]["Instances"][value] = true end
				else L.Variables.RatingsPlaceholder = nil
				end
			end
		end
	end

	function BroadcastMessage (Channel, Message)
		--local index = GetChannelName (L.Variables.BroadCastChannel)
		--if index ~= nil then SendChatMessage ("!" .. L.Variables.version:sub(13), "CHANNEL", nil, index) end
		if TESTCHANNEL then print ("[" .. Channel .. "] " .. Message)
		else
			local index = GetChannelName (Channel)
			if index ~= nil and Message:len() < 255 then SendChatMessage (Message, "CHANNEL", nil, index) end
		end
	end

	function getTalentSpec ()
		local currentSpec, maxPoints = "", 0;
		local numTabs = GetNumTalentTabs();
		for t=1, numTabs do
			--DEFAULT_CHAT_FRAME:AddMessage(GetTalentTabInfo(t)..":");
			local numTalents = GetNumTalents(t);
			local countedTalents = 0;
			for i=1, numTalents do
				nameTalent, icon, tier, column, currRank, maxRank= GetTalentInfo(t,i);
				countedTalents = countedTalents + currRank;
				--DEFAULT_CHAT_FRAME:AddMessage("- "..nameTalent..": "..currRank.."/"..maxRank);
			end
			--DEFAULT_CHAT_FRAME:AddMessage("- "..countedTalents);
			if countedTalents > maxPoints then
				maxPoints = countedTalents
				currentSpec = GetTalentTabInfo(t)
			end
		end
		return currentSpec;
	end

	function FormatWhisperString (str, playerTo)
		if str then
			local Instance, instanceType, txtRoles, NumberNeed = "", 0, "", 0
			local myInstances, tmpTable, InstanceCount = "", {}, 0
			for key, value in pairs (L.Variables.CurrentSearch) do
				if tmpTable [value [1]] then tmpTable [value [1]] = tmpTable [value [1]] .. ", " .. value [2][5]
				else tmpTable [value [1]], InstanceCount, instanceType, NumberNeed = value [2][5], InstanceCount + 1, L.Locals.CurrentCommLocal ["txtRoleType"][tonumber (value [1])], value [2][1]
				end
			end

			local roleSeperator, instanceSeperator = ", ", ", "
			for key, value in pairs (tmpTable) do myInstances = myInstances .. (myInstances ~= "" and ", " or "").. value end
			for key, value in pairs (L.Frames.mainFrame.TopTab.rdoInstanceGroup) do if value:GetChecked() then instanceSeperator = " " .. L.Locals.CurrentCommLocal [key] end end
			LastPos = myInstances:find ("%,[^,]-$")
			if LastPos ~= nil then myInstances = myInstances:sub (1, LastPos-1) .. instanceSeperator .. myInstances:sub (LastPos+1) end
			if L.Frames.mainFrame.TopTab.TankCheckButton:GetChecked() and L.Variables.CanTank then txtRoles = L.Locals.CurrentCommLocal ["Tank"] end
			if L.Frames.mainFrame.TopTab.HealsCheckButton:GetChecked() and L.Variables.CanHeal then txtRoles = txtRoles .. (txtRoles ~= "" and ", " or "") .. L.Locals.CurrentCommLocal ["Heal"] end
			if L.Frames.mainFrame.TopTab.DPSCheckButton:GetChecked() and L.Variables.CanDPS then txtRoles = txtRoles .. (txtRoles ~= "" and ", " or "") .. L.Locals.CurrentCommLocal ["DPS"] end
			for key, value in pairs (L.Frames.mainFrame.TopTab.rdoRoleGroup) do if value:GetChecked() then roleSeperator = " " .. L.Locals.CurrentCommLocal [key] end end
			LastPos = txtRoles:find ("%,[^,]-$")
			if LastPos ~= nil then txtRoles = txtRoles:sub (1, LastPos-1) .. roleSeperator .. txtRoles:sub (LastPos+1) end
			str = str:gsub ("{s}", L.Variables.CustomSearchString):gsub ("{m}", L.Variables.CustomSearchString)
			local localClass = UnitClass ("player")
			local Result = str:gsub ("{i}", myInstances):gsub ("{r}", txtRoles):gsub ("{l}", tostring (UnitLevel ("player"))):gsub ("{c}", localClass):gsub ("{p}", playerTo):gsub ("{cs}", getTalentSpec())
			local NumGroupMembers = GetNumGroupMembers ()
			NumberNeed = NumberNeed - NumGroupMembers - (NumGroupMembers == 0 and 1 or 0)
			if InstanceCount == 1 then
				Result = Result:gsub ("{t}", instanceType)
				if NumberNeed > 0 and NumberNeed < 4 then Result = Result:gsub ("{n}", NumberNeed) end
				if NumberNeed == 1 then Result = Result:gsub ("{g}", L.Locals.CurrentCommLocal ["txtGTG"]) end
			end
			Result = Result:gsub ("{n}", ""):gsub ("{t}", ""):gsub ("{g}", "")
			return { Result, txtRoles:len() > 0, myInstances }
		end
		return { "", false, false }
	end

	--function memberInformation (name)
	--	if IsInRaid() then
	--			for i=1,40 do
	--			if UnitName('raid'..i) and UnitName('raid'..i) == name then return true, UnitSex('raid'..i), UnitRace('raid'..i), UnitClass('raid'..i) end
	--		end
	--	elseif IsInGroup() then
	--		for i=1,5 do
	--			if UnitName('party'..i) and UnitName('party'..i) == name then return true, UnitSex('party'..i), UnitRace('party'..i), UnitClass('party'..i) end
	--		end
	--	end
	--	return false, false
	--end

	function memberIsInGroup (name)
		if IsInRaid() then
				for i=1,40 do
				if UnitName('raid'..i) and UnitName('raid'..i):lower() == name then return true, UnitIsGroupLeader(UnitName('raid'..i)) end
			end
		elseif IsInGroup() then
			for i=1,5 do
				if UnitName('party'..i) and UnitName('party'..i):lower() == name then return true, UnitIsGroupLeader(UnitName('party'..i)) end
			end
		end
		return false, false
	end

	function UpdateTableInformation (key, allInstancesCount, specificInstance, Tbl, ToolTip, value)
		local Inst, Userbase = "", ""

		if next (L.Variables.CurrentSearch) then Userbase = L.Variables.CurrentSearch [specificInstance[2]][2]
		else
			if specificInstance[1] == "1" then Userbase = LFG113InstanceKeys [specificInstance[2]] == nil and L.Locals.CurrentLocal ["PulldownInstance"] [specificInstance[2]] or LFG113InstanceKeys [specificInstance[2]]
			elseif specificInstance[1] == "2" then Userbase = LFG113InstanceKeys [specificInstance[2]] == nil and L.Locals.CurrentLocal ["PulldownRaids"] [specificInstance[2]] or LFG113InstanceKeys [specificInstance[2]]
			elseif specificInstance[1] == "3" then Userbase = L.Variables.Quests [tonumber( specificInstance[2])]
			elseif specificInstance[1] == "4" then Userbase = LFG113InstanceKeys [specificInstance[2]] == nil and L.Locals.CurrentLocal ["PulldownPVP"] [specificInstance[2]] or LFG113InstanceKeys [specificInstance[2]]
			elseif specificInstance[1] == "5" then Userbase, specificInstance[2] = L.Locals.CurrentLocal ["PulldownPVP"] [specificInstance[2]], "world"
			end
		end
		if (specificInstance[1] == "5") or (specificInstance[1] == "4" and specificInstance[2] == "world") then Inst = ToolTip
		elseif Userbase then
			if Userbase[2] then Inst = Userbase[2] .. " (" .. Userbase [3] .. "-" .. Userbase [4] .. ")"
			elseif specificInstance[1] == "3" then Inst = Userbase
			else Inst = "Any Instance"
			end
		end
		if Inst and (Inst:len() > 0 or Inst == "Any Instance") and not memberIsInGroup (key) then
			if allInstancesCount > 1 then Inst = "\124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_1:12\124t" .. Inst end
			if not L.Variables.TableRowList[key] then
				L.Variables.TableRowList[key] = GetAFrame (L.Frames.mainFrame.LFGLFMTab.ScrollArea.content)
				L.Variables.TableRowList[key]:Show()
				ShowNewItemAlert ("|cffFFFFFF" .. key .. ": |cffFFFF00" .. ToolTip)
			end
			-- Refresh information  -- Self, Player, Level, Class, Roles, Instance, ToolTip, request, response
			if L.Variables.TabViewing == 1 or (Tbl[1] == "1" and L.Variables.TabViewing == 12) then L.Variables.TableRowList[key].SetupLFM (L.Variables.TableRowList[key], Tbl[2], Tbl[3], Tbl[4], Tbl[6], Inst, { { "[" .. Tbl[2] .. "]: " .. ToolTip, 0, 1, 1 } }, value[4], value[5]) end
			if L.Variables.TabViewing == 2 or (Tbl[1] == "2" and L.Variables.TabViewing == 12) then  L.Variables.TableRowList[key].SetupLFG (L.Variables.TableRowList[key], Tbl[2], Tbl[4] ~= "0" and ("Need " .. Tbl[4]) or "", "", Tbl[5], Inst, { { "[" .. Tbl[2] .. "]: " .. ToolTip, 0, 1, 1 } }, value[4], value[5]) end
		end
	end

	function TableUpdateVolitileSearches ()
		local DoWeHaveResponses = ""
		if L.Variables.guildName == nil or L.Variables.guildName == "" then
			guildName, guildRankName, guildRankIndex = GetGuildInfo("player")
			L.Variables.guildName = (guildName or ""):lower()
		end
		for key, value in pairs (L.Variables.TableRowList) do
			if L.Variables.AddOnChatWindowMessages[key] == nil then ClearBlackListDisplay (L.Variables.TableRowList, key) end-- find the row hide row, free up, move all other rows up a row.
		end
		local ActivityCount = {}
		for key, value in pairs (L.Variables.AddOnChatWindowMessages) do
			local ToolTip = L.Functions.Comms.DecodeString (value[3])
			local Tbl = { strsplit (",", value[2]) }

			local roleNeeded
			if Tbl[1] == "2" then roleNeeded = Tbl[5]
			elseif Tbl[1] == "1" then roleNeeded = Tbl[6]
			end

			local roleSatisfied = false
			if roleNeeded and (roleNeeded:len() == 0  or roleNeeded:find ("1")) and L.Frames.mainFrame.TopTab.TankCheckButton:GetChecked() then roleSatisfied = true end
			if roleNeeded and (roleNeeded:len() == 0  or roleNeeded:find ("2")) and L.Frames.mainFrame.TopTab.HealsCheckButton:GetChecked() then roleSatisfied = true end
			if roleNeeded and (roleNeeded:len() == 0  or roleNeeded:find ("3")) and L.Frames.mainFrame.TopTab.DPSCheckButton:GetChecked() then roleSatisfied = true end
			if not L.Frames.mainFrame.TopTab.TankCheckButton:GetChecked() and not L.Frames.mainFrame.TopTab.HealsCheckButton:GetChecked() and not L.Frames.mainFrame.TopTab.DPSCheckButton:GetChecked() then roleSatisfied = true end

			local AllInstances =  { strsplit ("!", Tbl[1] == "1" and Tbl[5] or Tbl[3]) }
			local instanceCount = 0
			for Index=1, #AllInstances, 1 do if AllInstances [Index]:find ("inter") == nil then instanceCount = instanceCount + 1 end end
			if ActivityCount [Tbl [1]] then ActivityCount [Tbl [1]] = ActivityCount[Tbl [1]] + 1
			else ActivityCount [Tbl [1]] = 1
			end
			if next (L.Variables.CurrentSearch) and roleSatisfied then
				if Tbl[1] == "1" and (L.Variables.TabViewing == 1 or L.Variables.TabViewing == 12) then
					for Index = 1, #AllInstances, 1 do
						local specificInstance = { strsplit (":", AllInstances[Index]) }
						if (specificInstance[2] and L.Variables.CurrentSearch [specificInstance [2]] and L.Variables.CurrentSearch [specificInstance[2]][1] == specificInstance [1] and ((L.Variables.guildOnly and L.Variables.guildName == Tbl[7]) or (not L.Variables.guildOnly and Tbl[7] == ""))) then
							UpdateTableInformation (key, instanceCount, specificInstance, Tbl, ToolTip, value)
							break
						end
					end
				end
				if Tbl[1] == "2" and (L.Variables.TabViewing == 2 or L.Variables.TabViewing == 12) then
					for Index = 1, #AllInstances, 1 do
						local specificInstance = { strsplit (":", AllInstances[Index]) }
						if (specificInstance[2] and L.Variables.CurrentSearch [specificInstance [2]] and L.Variables.CurrentSearch [specificInstance[2]][1] == specificInstance [1] and ((L.Variables.guildOnly and L.Variables.guildName == Tbl[6]) or (not L.Variables.guildOnly and Tbl[6] == ""))) then
							UpdateTableInformation (key, instanceCount, specificInstance , Tbl, ToolTip, value)
							break
						end
					end
				end
			elseif roleSatisfied then
				local AgeRange = {1, 70}
				if Tbl[1] == "1" and (L.Variables.TabViewing == 1  or L.Variables.TabViewing == 12) then
					for Index = 1, #AllInstances, 1 do
						local specificInstance = { strsplit (":", AllInstances[Index]) }
						if (specificInstance[1] == "1") then AgeRange = { L.Locals.CurrentLocal ["PulldownInstance"][specificInstance[2]][3], L.Locals.CurrentLocal ["PulldownInstance"][specificInstance[2]][4] } end
						if (specificInstance[1] == "2") then AgeRange = { L.Locals.CurrentLocal ["PulldownRaids"][specificInstance[2]][3], L.Locals.CurrentLocal ["PulldownRaids"][specificInstance[2]][4] } end
						if (specificInstance[1] == "4") then AgeRange = { L.Locals.CurrentLocal ["PulldownPVP"][specificInstance[2]][3], L.Locals.CurrentLocal ["PulldownPVP"][specificInstance[2]][4] } end
						local amIInRange = UnitLevel ("player") >= AgeRange[1] and UnitLevel ("player") <= AgeRange[2]
						--local amIInRange = 70 >= AgeRange[1] and 70 <= AgeRange[2]
						if ((L.Variables.AllDungeonsChecked or amIInRange) and (L.Variables.ActivitySelected == 5 or tostring(L.Variables.ActivitySelected) == specificInstance[1]) and ((L.Variables.guildOnly and L.Variables.guildName == Tbl[7]) or (not L.Variables.guildOnly and Tbl[7] == ""))) then
							UpdateTableInformation (key, instanceCount, specificInstance, Tbl, ToolTip, value)
							break
						end
					end
				end
				if Tbl[1] == "2" and (L.Variables.TabViewing == 2 or L.Variables.TabViewing == 12) then
					for Index = 1, #AllInstances, 1 do
						local specificInstance = { strsplit (":", AllInstances[Index]) }
						if (specificInstance[1] == "1") then AgeRange = { L.Locals.CurrentLocal ["PulldownInstance"][specificInstance[2]][3], L.Locals.CurrentLocal ["PulldownInstance"][specificInstance[2]][4] } end
						if (specificInstance[1] == "2") then AgeRange = { L.Locals.CurrentLocal ["PulldownRaids"][specificInstance[2]][3], L.Locals.CurrentLocal ["PulldownRaids"][specificInstance[2]][4] } end
						if (specificInstance[1] == "4") then AgeRange = { L.Locals.CurrentLocal ["PulldownPVP"][specificInstance[2]][3], L.Locals.CurrentLocal ["PulldownPVP"][specificInstance[2]][4] } end
						local amIInRange = UnitLevel ("player") >= AgeRange[1] and UnitLevel ("player") <= AgeRange[2]
						--local amIInRange = 70 >= AgeRange[1] and 70 <= AgeRange[2]
						if ((L.Variables.AllDungeonsChecked or amIInRange) and (L.Variables.ActivitySelected == 5 or tostring(L.Variables.ActivitySelected) == specificInstance[1]) and ((L.Variables.guildOnly and L.Variables.guildName == Tbl[6]) or (not L.Variables.guildOnly and Tbl[6] == ""))) then
							UpdateTableInformation (key, instanceCount, specificInstance, Tbl, ToolTip, value)
							break
						end
					end
				end
			end
			if Tbl[1] == "5"  and L.Variables.TabViewing == 1 and not memberIsInGroup (key) then -- We have a request to join
				if not L.Variables.TableRowList[key] then
					-- ADD Row
					local newRow = GetAFrame (L.Frames.mainFrame.LFGLFMTab.ScrollArea.content)
					L.Variables.TableRowList[key] = newRow
					newRow:Show()
				end
				L.Variables.TableRowList[key].SetupLFM (L.Variables.TableRowList[key], Tbl[2], Tbl[4], Tbl[3], Tbl[5], "", { { "" } }, value[4], value[5])
				if not value[4] then DoWeHaveResponses = value[2] end
			end
		end
		local offset = LFG113Saved ["compactDesign"] and 30 or 60
		local _y = -2
		for key, value in pairs (L.Variables.TableRowList) do
			if L.Variables.AddOnChatWindowMessages[key] then
				if L.Variables.AddOnChatWindowMessages[key][5] then
					L.Variables.TableRowList[key]:SetPoint ("TOPLEFT", -2, _y)
					_y = _y - offset
				end
			end
		end
		for key, value in pairs (L.Variables.TableRowList) do
			if L.Variables.AddOnChatWindowMessages[key] then
				if not L.Variables.AddOnChatWindowMessages[key][5] then
					L.Variables.TableRowList[key]:SetPoint ("TOPLEFT", -2, _y)
					_y = _y - offset
				end
			end
		end
		L.Frames.mainFrame.LFGLFMTab.vScrollbar:SetMinMaxValues (1, math.max (1, math.abs (_y) - L.Frames.mainFrame.LFGLFMTab:GetHeight () + 25))

		if DoWeHaveResponses ~= "" and LFG113Saved ["popupAlert"] and L.Variables.lastPopupName ~= DoWeHaveResponses then
			-- Tbl[2], Tbl[4], Tbl[3], Tbl[5]
			-- Player, Level , Class , Roll
			local Tbl = { strsplit (",", DoWeHaveResponses) }

			L.Frames.popupFrame:Show ()
			L.Frames.popupFrame.player:SetText (Tbl[2] .. " " .. L.Locals.CurrentLocal ["txtLevel"] .. " " .. Tbl[4] .. " " .. Tbl[3])
			L.Variables.lastPopupName = DoWeHaveResponses
		elseif DoWeHaveResponses == "" then L.Variables.lastPopupName = ""
		end
		L.Variables.PeopleWaiting = DoWeHaveResponses ~= ""
		if ActivityCount ["1"] then L.Frames.mainFrame.LeftTab.LFMButton.count:SetText (ActivityCount["1"] < 10 and " " .. ActivityCount["1"] or ActivityCount["1"])
		else  L.Frames.mainFrame.LeftTab.LFMButton.count:SetText (" 0")
		end
		if ActivityCount ["2"] then L.Frames.mainFrame.LeftTab.LFGButton.count:SetText (ActivityCount["2"] < 10 and " " .. ActivityCount["2"] or ActivityCount["2"])
		else L.Frames.mainFrame.LeftTab.LFGButton.count:SetText (" 0")
		end
	end

	function TableUpdateSavedSearches ()
		--local currentLocation = L.Frames.mainFrame.SearchTab.vScrollbar:GetValue()
		for key, value in pairs (LFG113Searches) do
			local instances, toolTip = "", { {(value ["TAB"] == 1 and L.Locals.CurrentLocal ["btnCreateGroup"] or L.Locals.CurrentLocal ["btnJoinGroup"]):gsub("\n", " "), 1, 1, 1 } }
			local myRolestring = ""
			if value ["Roles"]:find ("1") then myRolestring = L.Locals.CurrentLocal ["Tank"] end
			if value ["Roles"]:find ("2") then myRolestring = myRolestring ~= "" and myRolestring .. ", " .. L.Locals.CurrentLocal ["Heal"] or L.Locals.CurrentLocal ["Heal"] end
			if value ["Roles"]:find ("3") then myRolestring = myRolestring ~= "" and myRolestring .. ", " .. L.Locals.CurrentLocal ["DPS"] or L.Locals.CurrentLocal ["DPS"] end
			LastPos = myRolestring:find ("%,[^,]-$")
			if LastkeyPos ~= nil then myRolestring = myRolestring:sub (1, LastPos-1) .. " or" .. myRolestring:sub (LastPos+1) end
			toolTip [#toolTip + 1] = { "\n" }
			toolTip [#toolTip + 1] = { L.Locals.CurrentLocal ["txtRoles"] .. ":", 1, 1, 1 }
			toolTip [#toolTip + 1] = { myRolestring, 1, 1, 0 }
			toolTip [#toolTip + 1] = { "\n" }
			toolTip [#toolTip + 1] = { L.Locals.CurrentLocal ["txtInstances"] .. ":", 1, 1, 1 }
			for inKey, inValue in pairs (value ["Searches"]) do
				if inValue [1] == "1" then  instances = LFG113InstanceKeys [inValue[2]] == nil and L.Locals.CurrentLocal ["PulldownInstance"][inValue[2]][2] or LFG113InstanceKeys [inValue[2]]
				elseif inValue [1] == "2" then  instances = LFG113InstanceKeys [inValue[2]] == nil and L.Locals.CurrentLocal ["PulldownRaids"][inValue[2]][2] or LFG113InstanceKeys [inValue[2]]
				elseif inValue [1] == "4" then  instances = LFG113InstanceKeys [inValue[2]] == nil and L.Locals.CurrentLocal ["PulldownPVP"][inValue[2]][2] or LFG113InstanceKeys [inValue[2]]
				end
				toolTip [#toolTip + 1] = { instances, 1, 1, 0 }
			end
			toolTip [#toolTip + 1] = { "\n" }
			toolTip [#toolTip + 1] = { L.Locals.CurrentLocal ["txtCustomText"] .. ":", 1, 1, 1 }
			toolTip [#toolTip + 1] = { value ["Custom"], 1, 1, 0 }

			if L.Variables.TableRowList[key] == nil then L.Variables.TableRowList[key] = GetAFrame (L.Frames.mainFrame.SearchTab.ScrollArea.content) end
			L.Variables.TableRowList[key].key = key
			L.Variables.TableRowList[key].SetupSearch (L.Variables.TableRowList[key], key, (value ["TAB"] == 1 and L.Locals.CurrentLocal ["btnCreateGroup"] or L.Locals.CurrentLocal ["btnJoinGroup"]):gsub("\n", " "), value["Roles"], instances, toolTip)
			L.Variables.TableRowList[key]:Show()
		end

		local _y = -2
		for key, value in pairs (L.Variables.TableRowList) do
			L.Variables.TableRowList[key]:SetPoint ("TOPLEFT", -2, _y)
			_y = _y - 60
		end

		L.Frames.mainFrame.SearchTab.vScrollbar:SetMinMaxValues (1, math.max (1, math.abs (_y) - L.Frames.mainFrame.LFGLFMTab:GetHeight () + 25))
		--L.Frames.mainFrame.SearchTab.vScrollbar:SetValue (currentLocation)
	end

	function TableUpdate () -- Time, Addonmessage, message
		if L.Variables.TabViewing == 5 then TableUpdateSavedSearches ()
		else TableUpdateVolitileSearches ()
		end
	end

	function BuildBroadcastString ()
		if L.Locals.CurrentCommLocal then
			local myFormmatedStr = {}
			if L.Variables.ActivitySelected == 5 then myFormmatedStr = FormatWhisperString (L.Variables.CustomSearchString, "")
			elseif L.Variables.TabViewing == 1 then myFormmatedStr = FormatWhisperString (LFG113Saved ["LFMFormat"], "")
			elseif L.Variables.TabViewing == 2 then myFormmatedStr = FormatWhisperString (LFG113Saved ["LFGFormat"], "")
			end
			if myFormmatedStr[1] and myFormmatedStr[2] then return { myFormmatedStr[1], "", { L.Locals.CurrentLocal ["pupActiveSearch"][1], L.Locals.CurrentLocal ["pupActiveSearch"][2], { "\n" }, { myFormmatedStr[3], 1, 1, 0 }, { "\n" }, L.Locals.CurrentLocal ["pupActiveSearch"][4], L.Locals.CurrentLocal ["pupActiveSearch"][5], L.Locals.CurrentLocal ["pupActiveSearch"][6]}} end
			if not myFormmatedStr[1] or myFormmatedStr[1]:len() == 0 then return { myFormmatedStr[1], nil, 0 } end
			if not myFormmatedStr[2] then return { myFormmatedStr[1], nil, -2 } end
			if not myFormmatedStr[3] then return { myFormmatedStr[1], nil, -1 } end
		end
	end

	function CreateBroadcast ()
		local Results = BuildBroadcastString ()
		if Results then
			if Results [2] ~= nil then -- Broadcast, valid and Tooltip
				L.Variables.broadcastOriginalString = Results [1]
				L.Variables.broadcastAppString = "Created"
				L.Frames.MinimapButton.tooltip = Results [3]
				return true
			else -- Error
				if LFG113Saved ["enableSound"] then PlaySound (SOUNDKIT.RAID_WARNING) end
				if Results [3] == -1 then ChatFrame1:AddMessage (L.Locals.CurrentLocal ["txtInvalidInst"], 0, 1, 1)
				elseif Results [3] == -2 then ChatFrame1:AddMessage (L.Locals.CurrentLocal ["txtMissingRole"], 0, 1, 1)
				end
			end
		end
		return false
	end

	function BroadcastToAllChannels ()
		if L.Variables.broadcastAppString:len() > 0 then
			if CreateBroadcast () then
				--BroadcastMessage (L.Variables.BroadCastChannel, L.Variables.broadcastAppString .. "}" .. L.Functions.Comms.EncodeString (strtrim (L.Variables.broadcastOriginalString)))
				if not L.Variables.guildOnly  then
					for key, value in pairs (LFG113Saved ["channels"]) do
						if value ["Load"]  == true and value ["Broadcast"] == true then BroadcastMessage (key, L.Variables.broadcastOriginalString) end
					end
				elseif (IsInGuild()) then
					L.Variables.guildBroadcastTime = L.Variables.guildBroadcastTime + 1
					if L.Variables.guildBroadcastTime > 2 then
						L.Variables.guildBroadcastTime = 1
						SendChatMessage (L.Locals.CurrentLocal ["txtGuildRun"] .. ": " .. L.Variables.broadcastOriginalString, "GUILD")
					end
				end
			else L.Frames.mainFrame.TopTab.btnSearch:GetScript ("OnClick")(L.Frames.mainFrame.TopTab.btnSearch)
			end
		end
	end

	function EndBroadcast ()
		L.Variables.broadcastAppString = ""
		L.Variables.broadcastOriginalString = ""
		--BroadcastMessage (L.Variables.BroadCastChannel, "3," .. L.Variables.Player)
	end

	function NewUserAlert ()
		if L.Variables.notifiedVersion == nil then L.Variables.notifiedVersion = true end
		if LFG113Saved ["enableSound"] and LFG113Saved ["pingAlert"] and L.Variables.PeopleWaiting then PlaySound(SOUNDKIT.MAP_PING) end
	end

	function DisplayLFM ()
		L.Variables.TabViewing = 1
		L.Frames.mainFrame.TopTab:Show ()
		L.Frames.mainFrame.LFGLFMTab:Show ()
		L.Frames.mainFrame.SearchTab:Hide ()
		L.Frames.mainFrame.Settings:Hide ()
		L.Frames.mainFrame.BlockList:Hide ()
		L.Frames.mainFrame.TopTab.btnSearch:SetEnabled ((UnitIsGroupLeader ("player") or GetNumGroupMembers() == 0) and true or false)
		L.Frames.mainFrame.LeftTab.BothButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.LFGButton:SetEnabled (GetNumGroupMembers() == 0 and true or false)
		L.Frames.mainFrame.LeftTab.LFMButton:SetEnabled (false)
		L.Frames.mainFrame.LeftTab.PremadeButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.SearchesButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.BlackListButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.SettingsButton:SetEnabled (true)
		L.Frames.mainFrame.TopTab.title:SetText (L.Locals.CurrentLocal ["lblWhatYouNeed"])
		SetRoleIconDisplay (false)
		TableUpdate ()
	end

	function DisplayBoth ()
		L.Variables.TabViewing = 12
		L.Frames.mainFrame.TopTab:Show ()
		L.Frames.mainFrame.LFGLFMTab:Show ()
		L.Frames.mainFrame.SearchTab:Hide ()
		L.Frames.mainFrame.Settings:Hide ()
		L.Frames.mainFrame.BlockList:Hide ()

		L.Frames.mainFrame.TopTab.btnSearch:SetEnabled (false)
		L.Frames.mainFrame.LeftTab.BothButton:SetEnabled (false)
		L.Frames.mainFrame.LeftTab.LFGButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.LFMButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.PremadeButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.SearchesButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.BlackListButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.SettingsButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.LFGButton.topSelected:Show ()
		L.Frames.mainFrame.LeftTab.LFGButton.bottomSelected:Show ()
		L.Frames.mainFrame.LeftTab.LFMButton.topSelected:Show ()
		L.Frames.mainFrame.LeftTab.LFMButton.bottomSelected:Show ()
		L.Frames.mainFrame.TopTab.title:SetText (L.Locals.CurrentLocal ["lblWhatYouView"])
		SetRoleIconDisplay (false)
		TableUpdate ()
	end

	function DisplayLFG ()
		L.Variables.TabViewing = 2
		L.Frames.mainFrame.TopTab:Show ()
		L.Frames.mainFrame.LFGLFMTab:Show ()
		L.Frames.mainFrame.SearchTab:Hide ()
		L.Frames.mainFrame.Settings:Hide ()
		L.Frames.mainFrame.BlockList:Hide ()
		L.Frames.mainFrame.TopTab.btnSearch:SetEnabled ((UnitIsGroupLeader ("player") or GetNumGroupMembers() == 0) and true or false)
		L.Frames.mainFrame.LeftTab.BothButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.LFGButton:SetEnabled (false)
		L.Frames.mainFrame.LeftTab.LFMButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.PremadeButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.SearchesButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.BlackListButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.SettingsButton:SetEnabled (true)
		L.Frames.mainFrame.TopTab.title:SetText (L.Locals.CurrentLocal ["lblWhatToJoinAs"])
		SetRoleIconDisplay (true)
		TableUpdate ()
	end

	function DisplaySearches ()
		L.Variables.TabViewing = 5
		L.Frames.mainFrame.TopTab:Hide ()
		L.Frames.mainFrame.LFGLFMTab:Hide ()
		L.Frames.mainFrame.SearchTab:Show ()
		L.Frames.mainFrame.Settings:Hide ()
		L.Frames.mainFrame.BlockList:Hide ()
		L.Frames.mainFrame.LeftTab.BothButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.LFGButton:SetEnabled (GetNumGroupMembers() == 0 and true or false)
		L.Frames.mainFrame.LeftTab.PremadeButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.LFMButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.SearchesButton:SetEnabled (false)
		L.Frames.mainFrame.LeftTab.BlackListButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.SettingsButton:SetEnabled (true)
		SetRoleIconDisplay (true)
		TableUpdate ()
	end

	--function DisplayBlackListItems (mainFrameType)
	--	local _y = 1
	--	for key, frmBlackListed in pairs (mainFrameType.BlackList) do
	--		frmBlackListed:SetPoint ("TOPLEFT", 0, _y)
	--		frmBlackListed:Show()
	--		_y = _y - 22
	--		for innerKey, innerValue in pairs (frmBlackListed.Children) do
	--			if frmBlackListed.isOpen then
	--				innerValue:SetPoint ("TOPLEFT", innerValue.offset, _y)
	--				innerValue:Show ()
	--				_y = _y - 22
	--			else innerValue:Hide ()
	--			end
	--		end
	--	end
	--	if mainFrameType.vScrollbar then mainFrameType.vScrollbar:SetMinMaxValues(1, math.max(1, math.abs(_y) - mainFrameType:GetHeight() + 25)) end
	--end

	function DisplayBlackListItems (mainFrameType, x, y, items, isOpen) -- default: mainFrameType.BlackList, 0, 1
		if items ~= nil then
			local CurrentPosition = 0
			if mainFrameType.vScrollbar then CurrentPosition = mainFrameType.vScrollbar:GetValue() end
			for key, frmBlackListed in pairs (items) do -- items is mainFrameType.BlackList
				if isOpen then
					frmBlackListed:SetPoint ("TOPLEFT", x + frmBlackListed.offset, y)
					y = DisplayBlackListItems (mainFrameType, x + frmBlackListed.offset, y - 22, frmBlackListed.Children, frmBlackListed.isOpen)
					frmBlackListed:Show()
				else frmBlackListed:Hide ()
				end
			end
			if mainFrameType.vScrollbar then
				mainFrameType.vScrollbar:SetMinMaxValues(1, math.max(1, math.abs(y) - mainFrameType:GetHeight() + 25))
				mainFrameType.vScrollbar:SetValue (CurrentPosition)
			end
		end
		return y
	end

	function CreateBlackListEntry (mainFrameType, key, value)
		local frmNewFrame = GetABasicFrame (mainFrameType.ScrollArea.content, 0, 310)
		if L.Variables.TabViewing == 3 then
			if mainFrameType == L.Frames.mainFrame.BlockList.topTabs ["Blacklist"] then
				local isPersonal = false
				local tcount = 0
				for innerKey, innerValue in pairs (value) do
					tcount = tcount + 1
					local Report = GetABasicFrame (mainFrameType.ScrollArea.content, 1, 310, key)
					frmNewFrame.AddChild (frmNewFrame, Report)
					if innerKey == L.Variables.Player then frmNewFrame.personalInformation = innerValue end
					Report.offset = 20
					Report.Player:SetFontObject ("GameFontNormal")
					Report.Player:SetText (L.Locals.CurrentLocal ["txtReport"] .. " " .. tcount .. " " .. L.Locals.CurrentLocal ["txtOn"] .. " " .. innerValue ["date"] .. " " .. L.Locals.CurrentLocal ["txtBy"] .. " " .. innerKey)
					Report.Count:SetText ("")
					Report.tooltip = { { L.Locals.CurrentLocal ["txtReportedBy"] .. " " .. innerKey .. " " .. L.Locals.CurrentLocal ["txtOn"] .. " " .. innerValue ["date"], 1, 1, 1 }, { (innerValue ["personal"] ~= "n" and "Personal Entry, no Sync, # Edits: " .. innerValue ["version"] or "# Edits: " .. innerValue ["version"]) }, { "\n" }, { innerValue ["issue"], 1, 1, 0 } }
					if innerValue ["personal"] ~= "n" then isPersonal = true end
				end
				frmNewFrame.isOpen = L.Variables.tableOpen [key] ~= nil
				frmNewFrame.key = key
				frmNewFrame.Player:SetFontObject ("ChatFontNormal")
				frmNewFrame.Player:SetText (key)
				frmNewFrame.Count:SetText (tcount .. " " .. L.Locals.CurrentLocal ["txtCounts"])
				frmNewFrame:Show()
				return { frmNewFrame, isPersonal }
			elseif  mainFrameType == L.Frames.mainFrame.BlockList.topTabs ["Ratings"] then
				local tcount = 0
				for innerKey, innerValue in pairs (value["Instances"]) do --Self, Level, Race, Class, Sex, Name, Runs, Rating
					tcount = tcount + 1
					local Report = GetABasicFrame (mainFrameType.ScrollArea.content, 1, 310, innerKey)
					Report.offset = 20
					Report.key = innerKey
					Report.SetRatings (Report, 1, "", "", "", innerKey, "Level " .. innerValue["Level"], innerValue["Rating"])
					if innerValue["Reporter"] then Report.tooltip =  { { "Reported by: " .. innerValue["Reporter"], 1, 1, 1 }, { "\n" }, { innerValue["Comment"], 1, 1, 1 }, { "\n" } }
					else Report.tooltip =  { { innerValue["Comment"], 1, 1, 1 }, { "\n" } }
					end
					for instanceKey, InstanceValue in pairs (innerValue["Instances"]) do
						Report.tooltip [#Report.tooltip + 1] = { instanceKey, 1, 1, 0 }
					end
					frmNewFrame.AddChild (frmNewFrame, Report)
				end
				frmNewFrame.isOpen = L.Variables.tableOpen [key] ~= nil
				frmNewFrame.key = key
				frmNewFrame.SetRatings (frmNewFrame, 0, value["Race"], value ["Class"], value ["Sex"] == 3 and .5 or 0, key, tcount .. " Run" .. (tcount > 1 and "s" or ""), value ["Rating"])
				frmNewFrame:Show()
				return { frmNewFrame, false }
			end
		elseif L.Variables.TabViewing == 6 then
			for innerKey, innerValue in pairs (value) do
				if innerKey ~= "isRaid" then
					local Report = GetABasicFrame (mainFrameType.ScrollArea.content, 1, 310, key)
					frmNewFrame.AddChild (frmNewFrame, Report)
					Report.Player:SetFontObject ("GameFontNormal")
					Report.Player:SetText (innerKey)
					Report.Count:SetText ("")
					if innerValue:find("1") ~= nil then Report.isTank:Show () end
					if innerValue:find("2") ~= nil then Report.isHeals:Show () end
					if innerValue:find("3") ~= nil then Report.isDPS:Show () end
				end
			end
			frmNewFrame.isOpen = L.Variables.tableOpen [key] ~= nil
			frmNewFrame.key = key
			frmNewFrame.Player:SetFontObject ("ChatFontNormal")
			frmNewFrame.Player:SetText (key)
			frmNewFrame.Count:SetText ("")
			if L.Variables.LoadedPremade and L.Variables.LoadedPremade [2] == key then frmNewFrame.btnLoad:SetText (L.Locals.CurrentLocal ["btnUnload"])
			else frmNewFrame.btnLoad:SetText (L.Locals.CurrentLocal ["btnLoad"])
			end
			frmNewFrame:Show()
			return { frmNewFrame, false }
		elseif L.Variables.TabViewing == 4 then
			-- "bfd" = {5, "Blackfathom Deeps", 24, 32, "BFD", {1,1,3}, { [" bfd "]=1, [" blackfathom deeps "]=1 }, nil, "Vanilla"},
			frmBlackListed = GetABasicFrame (mainFrameType.ScrollArea.content, 0, 240)
			for innerKey, innerValue in pairs (value [7]) do
				local Report = GetABasicFrame (mainFrameType.ScrollArea.content, 1, 240, key)
				frmBlackListed.AddChild (frmBlackListed, Report)
				Report.Player:SetFontObject ("GameFontNormal")
				Report.Player:SetText (innerKey)
				Report.Count:SetText ("")
				Report.key = key
			end
			frmBlackListed.isOpen = L.Variables.tableOpen [key] ~= nil
			frmBlackListed.key = key
			frmBlackListed.Player:SetFontObject ("ChatFontNormal")
			frmBlackListed.Player:SetText ((LFG113InstanceKeys[key] and "*" or "") .. value [2])
			frmBlackListed.Count:SetText ("")
			frmBlackListed:Show()
			return { frmBlackListed, false }
		end
	end

	function DisplayBlackList ()
		ClearAllDisplayEntries ()
		L.Variables.TabViewing = 3
		L.Frames.mainFrame.BlockList.lblIssue:SetText (L.Locals.CurrentLocal ["lblIssue"])
		L.Frames.mainFrame.BlockList.label:SetText (L.Locals.CurrentLocal ["btnBlackList"])
		L.Frames.mainFrame.LeftTab.BothButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.LFGButton:SetEnabled (GetNumGroupMembers() == 0 and true or false)
		L.Frames.mainFrame.LeftTab.LFMButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.PremadeButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.SearchesButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.BlackListButton:SetEnabled (false)
		L.Frames.mainFrame.LeftTab.SettingsButton:SetEnabled (true)
		L.Frames.mainFrame.BlockList.isTank:Hide ()
		L.Frames.mainFrame.BlockList.roleTank:Hide ()
		L.Frames.mainFrame.BlockList.isHeals:Hide ()
		L.Frames.mainFrame.BlockList.roleHeals:Hide ()
		L.Frames.mainFrame.BlockList.isDPS:Hide ()
		L.Frames.mainFrame.BlockList.roleDPS:Hide ()
		L.Frames.mainFrame.BlockList.isRaid:Hide ()
		L.Frames.mainFrame.TopTab:Hide ()
		L.Frames.mainFrame.LFGLFMTab:Hide ()
		L.Frames.mainFrame.SearchTab:Hide ()
		L.Frames.mainFrame.Settings:Hide ()
		L.Frames.mainFrame.BlockList:Show ()

		newTable = {}
		for n in pairs(LFG113BlackList) do table.insert(newTable, n) end
		table.sort(newTable)
		for i, key in ipairs(newTable) do
			local results = CreateBlackListEntry (L.Frames.mainFrame.BlockList.topTabs ["Blacklist"], key, LFG113BlackList[key])
			table.insert (L.Frames.mainFrame.BlockList.topTabs ["Blacklist"].BlackList, results [1])
		end
		DisplayBlackListItems (L.Frames.mainFrame.BlockList.topTabs ["Blacklist"], 0, 1, L.Frames.mainFrame.BlockList.topTabs ["Blacklist"].BlackList, true)

		newTable = {}
		for n in pairs(LFG113Ratings["Ratings"]) do table.insert(newTable, n) end
		table.sort(newTable)
		for i, key in ipairs(newTable) do
			if memberIsInGroup (key) then
				local results = CreateBlackListEntry (L.Frames.mainFrame.BlockList.topTabs ["Ratings"], "* " .. key, LFG113Ratings["Ratings"][key])
				table.insert (L.Frames.mainFrame.BlockList.topTabs ["Ratings"].BlackList, results [1])
			end
			if not memberIsInGroup (key) then
				local results = CreateBlackListEntry (L.Frames.mainFrame.BlockList.topTabs ["Ratings"], key, LFG113Ratings["Ratings"][key])
				table.insert (L.Frames.mainFrame.BlockList.topTabs ["Ratings"].BlackList, results [1])
			end
		end
		DisplayBlackListItems (L.Frames.mainFrame.BlockList.topTabs ["Ratings"], 0, 1, L.Frames.mainFrame.BlockList.topTabs ["Ratings"].BlackList, true)

		L.Frames.mainFrame.BlockList.topTabs ["Ratings"].myTab:Show ()
		L.Frames.mainFrame.BlockList.topTabs ["Blacklist"].myTab:Show ()
		L.Frames.mainFrame.BlockList.topTabs ["Premades"].myTab:Hide ()
		if L.Variables.CurrentTabID < 3 then L.Frames.mainFrame.BlockList.TabSelected (L.Frames.mainFrame.BlockList.topTabs ["Blacklist"].myTab)
		elseif L.Variables.CurrentTabID == 3 then L.Frames.mainFrame.BlockList.TabSelected (L.Frames.mainFrame.BlockList.topTabs ["Ratings"].myTab)
		end
		OrderTabs (L.Frames.mainFrame.BlockList.topTabs ["Blacklist"].AllTabs)
		OrderTabs (L.Frames.mainFrame.BlockList.topTabs ["Ratings"].AllTabs)
	end

	function DisplayPremades ()
		ClearAllDisplayEntries ()
		L.Variables.TabViewing = 6
		L.Frames.mainFrame.BlockList.lblIssue:SetText (L.Locals.CurrentLocal ["lblGroup"])
		L.Frames.mainFrame.BlockList.label:SetText (L.Locals.CurrentLocal ["lblPremades"])
		L.Frames.mainFrame.LeftTab.BothButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.LFGButton:SetEnabled (GetNumGroupMembers() == 0 and true or false)
		L.Frames.mainFrame.LeftTab.LFMButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.PremadeButton:SetEnabled (false)
		L.Frames.mainFrame.LeftTab.SearchesButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.BlackListButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.SettingsButton:SetEnabled (true)
		L.Frames.mainFrame.BlockList.isTank:Show ()
		L.Frames.mainFrame.BlockList.roleTank:Show ()
		L.Frames.mainFrame.BlockList.isHeals:Show ()
		L.Frames.mainFrame.BlockList.roleHeals:Show ()
		L.Frames.mainFrame.BlockList.isDPS:Show ()
		L.Frames.mainFrame.BlockList.roleDPS:Show ()
		L.Frames.mainFrame.BlockList.isRaid:Show ()
		L.Frames.mainFrame.TopTab:Hide ()
		L.Frames.mainFrame.LFGLFMTab:Hide ()
		L.Frames.mainFrame.SearchTab:Hide ()
		L.Frames.mainFrame.Settings:Hide ()
		L.Frames.mainFrame.BlockList:Show ()
		for key, value in pairs (LFG113Premades) do
			if key ~= "isRaid" then
				local results = CreateBlackListEntry (L.Frames.mainFrame.BlockList.topTabs ["Premades"], key, value)
				table.insert (L.Frames.mainFrame.BlockList.topTabs ["Premades"].BlackList, results [1])
			end
		end
		L.Frames.mainFrame.BlockList.topTabs ["Ratings"].myTab:Hide ()
		L.Frames.mainFrame.BlockList.topTabs ["Blacklist"].myTab:Hide ()
		L.Frames.mainFrame.BlockList.topTabs ["Premades"].myTab:Show ()
		OrderTabs (L.Frames.mainFrame.BlockList.topTabs ["Premades"].AllTabs)
		DisplayBlackListItems (L.Frames.mainFrame.BlockList.topTabs ["Premades"], 0, 1, L.Frames.mainFrame.BlockList.topTabs ["Premades"].BlackList, true)
		L.Frames.mainFrame.BlockList.TabSelected (L.Frames.mainFrame.BlockList.topTabs ["Premades"].myTab)
	end

	function DisplayKeys (Changed) -- "bfd" = {5, "Blackfathom Deeps", 24, 32, "BFD", {1,1,3}, { [" bfd "]=1, [" blackfathom deeps "]=1 }, nil, "Vanilla"},
		local results
		for key, value in pairs (L.Locals.CurrentLocal ["PulldownInstance"]) do
			if key:find ("internal") == nil and value [2]:find ("Heroic") == nil and ((Changed and LFG113InstanceKeys[key]) or (Changed == false and LFG113InstanceKeys[key] == nil)) then
				table.insert (L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList.BlackList, CreateBlackListEntry (L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList, key, GetInstanceRow (key))[1])
			end
		end
		for key, value in pairs (L.Locals.CurrentLocal ["PulldownRaids"]) do
			if (Changed and LFG113InstanceKeys[key]) or (Changed == false and LFG113InstanceKeys[key] == nil) then table.insert (L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList.BlackList, CreateBlackListEntry (L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList, key, GetInstanceRow (key))[1]) end
		end
		for key, value in pairs (L.Locals.CurrentLocal ["PulldownPVP"]) do
			if (Changed and LFG113InstanceKeys[key]) or (Changed == false and LFG113InstanceKeys[key] == nil) then table.insert (L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList.BlackList, CreateBlackListEntry (L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList, key, GetInstanceRow (key))[1]) end
		end
		DisplayBlackListItems (L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList, 0, 1, L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList.BlackList, true)
	end

	function DisplaySettings ()
		L.Variables.TabViewing = 4
		L.Frames.mainFrame.LeftTab.BothButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.LFGButton:SetEnabled (GetNumGroupMembers() == 0 and true or false)
		L.Frames.mainFrame.LeftTab.LFMButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.PremadeButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.SearchesButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.BlackListButton:SetEnabled (true)
		L.Frames.mainFrame.LeftTab.SettingsButton:SetEnabled (false)
		L.Frames.mainFrame.TopTab:Hide ()
		L.Frames.mainFrame.LFGLFMTab:Hide ()
		L.Frames.mainFrame.SearchTab:Hide ()
		L.Frames.mainFrame.Settings:Show ()
		L.Frames.mainFrame.BlockList:Hide ()
		L.Frames.mainFrame.Settings.topTabs ["Communication"].chkChannelLoading:SetChecked (LFG113Saved ["enableChannelModification"])
		L.Frames.mainFrame.Settings.topTabs ["Whispers"].autoAcceptWhisper:SetChecked (LFG113Saved ["autoAcceptWhisper"])
		L.Frames.mainFrame.Settings.topTabs ["General"].forceKeybind:SetChecked (LFG113Saved ["ForceKeybind"])
		L.Frames.mainFrame.Settings.topTabs ["General"].accurateScan:SetChecked (LFG113Saved ["accurateScan"])
		L.Frames.mainFrame.Settings.topTabs ["General"].fullGRPAudio:SetChecked (LFG113Saved ["fullGRPAudio"])
		L.Frames.mainFrame.Settings.topTabs ["General"].chkEnableSound:SetChecked (LFG113Saved ["enableSound"])
		L.Frames.mainFrame.Settings.topTabs ["General"].chkPopupAlert:SetChecked (LFG113Saved ["popupAlert"])
		L.Frames.mainFrame.Settings.topTabs ["General"].chkPingAlert:SetChecked (LFG113Saved ["pingAlert"])
		L.Frames.mainFrame.Settings.topTabs ["General"].chkHookMenu:SetChecked (LFG113Saved ["hooksecurefunc"])
		L.Frames.mainFrame.Settings.topTabs ["General"].chkRatingsystem:SetChecked (LFG113Saved ["useRatingSystem"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkFreeMovingEye:SetChecked (LFG113Saved ["freeMovingEye"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkAlwaysShowEye:SetChecked (LFG113Saved ["alwaysShowEye"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkCompactDesign:SetChecked (LFG113Saved ["compactDesign"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkDisableAutoNotification:SetChecked (LFG113Saved ["disableAutomaticBroadcast"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkShowNewmessage:SetChecked (LFG113Saved ["showNewMessage"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkSoundNewMessage:SetChecked (LFG113Saved ["soundNewMessage"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkSoloNewMessage:SetChecked (LFG113Saved ["soloNewMessage"])
		if (LFG113Saved ["showNewMessage"]) then
			L.Frames.mainFrame.Settings.topTabs ["Display"].chkSoundNewMessage:Show ()
			L.Frames.mainFrame.Settings.topTabs ["Display"].chkSoloNewMessage:Show ()
		else
			L.Frames.mainFrame.Settings.topTabs ["Display"].chkSoundNewMessage:Hide ()
			L.Frames.mainFrame.Settings.topTabs ["Display"].chkSoloNewMessage:Hide ()
		end
		L.Variables.CurrentTab = L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList
		DisplayKeys (true)
		DisplayKeys (false)
	end

	function UpdateDisplayFrame ()
		if L.Frames.mainFrame and L.Frames.mainFrame.TopTab and L.Frames.mainFrame.TopTab.btnSearch:GetText () == L.Locals.CurrentLocal ["btnSearch"] then
			if L.Variables.TabViewing == 1 then DisplayLFM ()
			elseif L.Variables.TabViewing == 2 then DisplayLFG ()
			elseif L.Variables.TabViewing == 3 then DisplayBlackList ()
			elseif L.Variables.TabViewing == 4 then DisplaySettings ()
			elseif L.Variables.TabViewing == 5 then DisplaySearches ()
			elseif L.Variables.TabViewing == 6 then DisplayPremades ()
			elseif L.Variables.TabViewing == 12 then DisplayBoth ()
			end
		end
		if  L.Frames.mainFrame and L.Frames.mainFrame.TopTab then
			local Results = BuildBroadcastString ()
			L.Frames.mainFrame.Results.Message:SetText (Results [1])
			if (Results[2] == nil) then L.Frames.mainFrame.Results.Message:SetTextColor(1, 0, 0)
			else L.Frames.mainFrame.Results.Message:SetTextColor(1, 1, 1)
			end
		end
	end

	function SetRoleIconDisplay (isLFG)
		--local class = UnitClass("player")
		local localName, englishName = UnitClass ("player")

		englishName = englishName:lower()
		if isLFG then
			if L.Variables.PlayerClass [englishName] ~= nil then
				L.Variables.CanDPS = L.Variables.PlayerClass [englishName]["roles"][3]
				if L.Variables.CanDPS then
					L.Frames.mainFrame.TopTab.roleDPS.texture:SetTexCoord (.75, .875, 0, .25)
					L.Frames.mainFrame.TopTab.DPSCheckButton:Show ()
				else
					L.Frames.mainFrame.TopTab.roleDPS.texture:SetTexCoord (.875, 1, 0, .25)
					L.Frames.mainFrame.TopTab.DPSCheckButton:Hide ()
				end
				L.Variables.CanHeal = L.Variables.PlayerClass [englishName]["roles"][2]
				if L.Variables.CanHeal then
					L.Frames.mainFrame.TopTab.roleHeals.texture:SetTexCoord (.5, .625, .25, .5)
					L.Frames.mainFrame.TopTab.HealsCheckButton:Show ()
				else
					L.Frames.mainFrame.TopTab.roleHeals.texture:SetTexCoord (.625, .75, .25, .5)
					L.Frames.mainFrame.TopTab.HealsCheckButton:Hide ()
				end
				L.Variables.CanTank = L.Variables.PlayerClass [englishName]["roles"][1]
				if L.Variables.CanTank then
					L.Frames.mainFrame.TopTab.roleTank.texture:SetTexCoord (.5, .625, 0, .25)
					L.Frames.mainFrame.TopTab.TankCheckButton:Show ()
				else
					L.Frames.mainFrame.TopTab.roleTank.texture:SetTexCoord (.625, .75, 0, .25)
					L.Frames.mainFrame.TopTab.TankCheckButton:Hide ()
				end
			end
		else
			L.Frames.mainFrame.TopTab.roleTank.texture:SetTexCoord (.5, .625, 0, .25)
			L.Frames.mainFrame.TopTab.roleHeals.texture:SetTexCoord (.5, .625, .25, .5)
			L.Frames.mainFrame.TopTab.roleDPS.texture:SetTexCoord (.75, .875, 0, .25)
			L.Frames.mainFrame.TopTab.TankCheckButton:Show ()
			L.Frames.mainFrame.TopTab.HealsCheckButton:Show ()
			L.Frames.mainFrame.TopTab.DPSCheckButton:Show ()
			L.Variables.CanHeal, L.Variables.CanTank, L.Variables.CanDPS = true, true, true
		end
	end

	function HideAllPulldowns (isQuesting)
		L.Frames.mainFrame.TopTab.instances:Hide ()
		L.Frames.mainFrame.TopTab.raids:Hide ()
		L.Frames.mainFrame.TopTab.pvp:Hide ()
		L.Frames.mainFrame.TopTab.customMainFrame:Hide ()
	end

	function ResetAllPulldowns ()
		UIDropDownMenu_SetText (L.Frames.mainFrame.TopTab.instances, L.Locals.CurrentLocal ["PulldownInstance"]["any"][2])
		UIDropDownMenu_SetText (L.Frames.mainFrame.TopTab.raids, L.Locals.CurrentLocal ["PulldownRaids"]["any"][2])
		UIDropDownMenu_SetText (L.Frames.mainFrame.TopTab.pvp, L.Locals.CurrentLocal ["PulldownPVP"]["any"][2])
		L.Frames.mainFrame.TopTab.customMainFrame:Hide ()
		if L.Variables.ActivitySelected == 4 then L.Frames.mainFrame.TopTab.customText:Hide () end
	end

	function ClearBlackListDisplay (parent, key)
		if parent [key] then
			if parent [key].Children then
				for innerKey, innerValue in pairs (parent [key].Children) do
					ClearBlackListDisplay (parent [key].Children, innerKey)
				end
			end
			parent [key].Children, parent [key].isOpen, parent [key].used = {}, false, false
			parent [key]:Hide ()
			parent [key] = nil
		end
	end

	function ClearAllDisplayEntries ()
		if L.Variables.TableRowList then for key, value in pairs (L.Variables.TableRowList) do ClearBlackListDisplay (L.Variables.TableRowList, key) end end
		if L.Frames.mainFrame.BlockList then
			if L.Frames.mainFrame.BlockList.topTabs ["Blacklist"] then
				for key, value in pairs (L.Frames.mainFrame.BlockList.topTabs ["Blacklist"].BlackList) do ClearBlackListDisplay (L.Frames.mainFrame.BlockList.topTabs ["Blacklist"].BlackList, key) end
				L.Frames.mainFrame.BlockList.topTabs ["Blacklist"].BlackList = {}
			end
			if L.Frames.mainFrame.BlockList.topTabs ["Premades"] then
				for key, value in pairs (L.Frames.mainFrame.BlockList.topTabs ["Premades"].BlackList) do ClearBlackListDisplay (L.Frames.mainFrame.BlockList.topTabs ["Premades"].BlackList, key) end
				L.Frames.mainFrame.BlockList.topTabs ["Premades"].BlackList = {}
			end
			if L.Frames.mainFrame.BlockList.topTabs ["Ratings"] then
				for key, value in pairs (L.Frames.mainFrame.BlockList.topTabs ["Ratings"].BlackList) do ClearBlackListDisplay (L.Frames.mainFrame.BlockList.topTabs ["Ratings"].BlackList, key) end
				L.Frames.mainFrame.BlockList.topTabs ["Ratings"].BlackList = {}
			end
			if L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList then
				for key, value in pairs (L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList.BlackList) do ClearBlackListDisplay (L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList.BlackList, key) end
				L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList.BlackList = {}
			end
		end
	end

	function ShowBroadcastPopup ()
		if L.Variables.broadcastAppString ~= "" then
			StaticPopupDialogs["LFG113_BLOCK"] = {
					timeout = 0, whileDead = true, hideOnEscape = true, hasEditBox = false, preferredIndex = 3,
					text = "Time to broadcast your search",
					button1 = L.Locals.CurrentLocal ["btnSearch"], button2 = L.Locals.CurrentLocal ["btnCancel"],
					OnAccept = function(self)
							BroadcastToAllChannels ()
							StaticPopupDialogs["LFG113_BLOCK"].OnAccept = nil
						end
			}
			StaticPopup_Show  ("LFG113_BLOCK")
		end
	end

	function ShowNewItemAlert (message)
		if (LFG113Saved["showNewMessage"] and (L.Frames.mainFrame.TopTab.btnSearch:GetText () == L.Locals.CurrentLocal ["btnCancelSearch"] or (not LFG113Saved ["soloNewMessage"] and UnitIsGroupLeader ("player") == false and GetNumGroupMembers() == 0))) then
			RaidNotice_AddMessage(RaidBossEmoteFrame, message, ChatTypeInfo["RAID_WARNING"]);
			if (LFG113Saved["soundNewMessage"]) then PlaySound (8959, "master"); end
		end
	end

	local function GetNewChannel (Question, callingFunc)
		StaticPopupDialogs["LFG113_BLOCK"] = {
			timeout = 0, whileDead = true, hideOnEscape = true, hasEditBox = true, preferredIndex = 3,
			text = Question,
			button1 = L.Locals.CurrentLocal ["btnAccept"], button2 = L.Locals.CurrentLocal ["btnCancel"],
			OnAccept = function(self)
					if self.editBox:GetText() then callingFunc (self.editBox:GetText()) end
					StaticPopupDialogs["LFG113_BLOCK"].OnAccept = nil
				end
		}
		StaticPopup_Show  ("LFG113_BLOCK")
	end

	function CreateMainDisplay ()
		DragFrame (L.Frames.updatedFrame)
		L.Frames.updatedFrame:SetFrameLevel (20)
		L.Frames.updatedFrame:SetSize (400,350)
		L.Frames.updatedFrame:SetPoint ("CENTER")
		L.Frames.updatedFrame:Hide ()
		L.Frames.updatedFrame.title = CreateLabel (L.Frames.updatedFrame, 10, -5, "ChatFontNormal", "  " .. L.Variables.version .. " " .. L.Locals.CurrentLocal ["txtNotes"])


		L.Frames.updatedFrame.scrollFrame = CreateFramecontainer (nil, L.Frames.updatedFrame, 1, -25, -14, 14, "Interface/Tooltips/UI-Tooltip-Background")
		L.Frames.updatedFrame.contents = CreateScrollArea (L.Frames.updatedFrame.scrollFrame, "Interface/ACHIEVEMENTFRAME/UI-Achievement-AchievementWatermark.BLP", true)
		L.Frames.updatedFrame.message = CreateLabel (L.Frames.updatedFrame.contents.content, 10, -20, "GameFontNormal", L.VersionInformation)
		L.Frames.updatedFrame.scrollFrame.vScrollbar:SetMinMaxValues(1, L.Frames.updatedFrame.message:GetStringHeight() - L.Frames.updatedFrame.scrollFrame:GetHeight() + 50)
		L.Frames.updatedFrame.scrollFrame.hScrollbar:SetMinMaxValues(1, L.Frames.updatedFrame.message:GetStringWidth() - L.Frames.updatedFrame.scrollFrame:GetWidth() + 50)
		L.Frames.updatedFrame.message:SetJustifyH ("LEFT")

		L.Frames.popupFrame:SetSize (300, 110)
		L.Frames.popupFrame:SetPoint ("TOP")
		L.Frames.popupFrame:SetFrameLevel (20)
		DragFrame (L.Frames.popupFrame)

		L.Frames.popupFrame.title = CreateLabel (L.Frames.popupFrame, 68, -5, "GameFontNormal", L.Locals.CurrentLocal ["lblLFGNitofication"])
		L.Frames.popupFrame.message = CreateLabel (L.Frames.popupFrame, 75, -30, "GameFontNormal", L.Locals.CurrentLocal ["lblRequestJoin"])
		L.Frames.popupFrame.player = CreateLabel (L.Frames.popupFrame, 5, -50, "GameFontNormalLarge", "")
		L.Frames.popupFrame.player:SetPoint ("RIGHT", 5)
		L.Frames.popupFrame.player:SetJustifyH ("CENTER")
		L.Frames.popupFrame:Hide ()

		L.Frames.popupFrame.invite = CreateButton (L.Frames.popupFrame, 30, -75, 100, 20, L.Locals.CurrentLocal ["btnInvite"])
		L.Frames.popupFrame.invite:SetScript ("OnClick", function ()
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB) end
				local splitInfo =  { strsplit (" ", L.Frames.popupFrame.player:GetText ()) }
				L.Frames.popupFrame:Hide ()
				L.Variables.TableRowList[splitInfo[1]].btnAccept:GetScript ("OnClick")(L.Variables.TableRowList[splitInfo[1]].btnAccept)
			end)
		L.Frames.popupFrame.acknowledge = CreateButton (L.Frames.popupFrame, 170, -75, 100, 20, L.Locals.CurrentLocal ["btnAcknowledge"])
		L.Frames.popupFrame.acknowledge:SetScript ("OnClick", function ()
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB) end
				L.Frames.popupFrame:Hide ()
			end)
		L.Frames.mainFrame:SetSize (500, 500)
		L.Frames.mainFrame:SetPoint ("CENTER")
		L.Frames.mainFrame:Hide ()
		DragFrame (L.Frames.mainFrame)

		L.Frames.mainFrame.title = CreateLabel (L.Frames.mainFrame, 200, -5, "GameFontNormal", "LFG " .. L.Variables.version)

		L.Frames.mainFrame.CornerImage = CreateTexture("Interface\\AddOns\\LFG113\\textures\\Interface.tga", L.Frames.mainFrame, -5, 10, 64, 64)
		L.Frames.mainFrame.CornerImage.texture:SetTexCoord (.75, .875, .25, .5)
		L.Frames.mainFrame.CornerImage:SetFrameLevel (4)
		L.Frames.mainFrame.CornerEye = CreateTexture("Interface\\AddOns\\LFG113\\textures\\LFG-Eye.tga", L.Frames.mainFrame.CornerImage, -3, 2, 64, 64)
		L.Frames.mainFrame.CornerEye.texture:SetTexCoord (0, 0, .125, .25)
		L.Frames.mainFrame.CornerEye:SetFrameLevel (5)

		L.Frames.mainFrame.LeftTab = CreateFramecontainer (nil, L.Frames.mainFrame, -1, -19, -351, 60, "Interface/Tooltips/UI-Tooltip-Background")

		L.Frames.mainFrame.LeftTab.BothButton = CreateNewButton (L.Frames.mainFrame.LeftTab, 53, -63, 93, 50, L.Locals.CurrentLocal ["btnBoth"], "", 12, function (self, num) return true end)
		L.Frames.mainFrame.LeftTab.BothButton.icon = { 0, 0 }

		L.Frames.mainFrame.LeftTab.LFMButton = CreateNewButton (L.Frames.mainFrame.LeftTab, 3, -30, 143, 50, L.Locals.CurrentLocal ["btnNEWCG"], "Interface\\AddOns\\LFG113\\textures\\Interface.tga", 1, function (self, num) return true end)
		L.Frames.mainFrame.LeftTab.LFMButton.icon = { .25, 0 }
		L.Frames.mainFrame.LeftTab.LFMButton.button:GetScript ("OnClick")(L.Frames.mainFrame.LeftTab.LFMButton.button)
		L.Frames.mainFrame.LeftTab.LFMButton.texture = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\Interface.tga", L.Frames.mainFrame.LeftTab.LFMButton, 45, 5, 24, 24)
		L.Frames.mainFrame.LeftTab.LFMButton.texture.texture:SetTexCoord (.875, 1, .25, .5)
		L.Frames.mainFrame.LeftTab.LFMButton.count = CreateLabel (L.Frames.mainFrame.LeftTab.LFMButton.texture, 4, -5, "GameFontNormal", " 0")
		L.Frames.mainFrame.LeftTab.LFMButton.texture:SetFrameLevel (20)

		L.Frames.mainFrame.LeftTab.LFGButton = CreateNewButton (L.Frames.mainFrame.LeftTab, 3, -96, 143, 50, L.Locals.CurrentLocal ["btnNEWJG"],  "Interface\\AddOns\\LFG113\\textures\\Interface.tga", 2, function (self, num) return not (GetNumGroupMembers() > 0) end)
		L.Frames.mainFrame.LeftTab.LFGButton.icon = { 0, .75 }
		L.Frames.mainFrame.LeftTab.LFGButton.texture = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\Interface.tga", L.Frames.mainFrame.LeftTab.LFGButton, 45, 5, 24, 24)
		L.Frames.mainFrame.LeftTab.LFGButton.texture.texture:SetTexCoord (.875, 1, .25, .5)
		L.Frames.mainFrame.LeftTab.LFGButton.count = CreateLabel (L.Frames.mainFrame.LeftTab.LFGButton.texture, 4, -5, "GameFontNormal", " 0")
		L.Frames.mainFrame.LeftTab.LFGButton.texture:SetFrameLevel (20)

		L.Frames.mainFrame.LeftTab.PremadeButton = CreateNewButton (L.Frames.mainFrame.LeftTab, 3, -162, 143, 50, L.Locals.CurrentLocal ["btnNewPremades"], "Interface\\AddOns\\LFG113\\textures\\Interface.tga", 6, function (self, num) return true end)
		L.Frames.mainFrame.LeftTab.PremadeButton.icon = { 0, .5 }

		L.Frames.mainFrame.LeftTab.SearchesButton = CreateNewButton (L.Frames.mainFrame.LeftTab, 3, -228, 143, 50, L.Locals.CurrentLocal ["btnNEWAS"], "Interface\\AddOns\\LFG113\\textures\\Interface.tga", 5, function (self, num) return true end)
		L.Frames.mainFrame.LeftTab.SearchesButton.icon = { 0, 0 }

		L.Frames.mainFrame.LeftTab.BlackListButton = CreateNewButton (L.Frames.mainFrame.LeftTab, 3, -294, 143, 50, L.Locals.CurrentLocal ["btnNEWBL"], "Interface\\AddOns\\LFG113\\textures\\Interface.tga", 3, function (self, num) return true end)
		L.Frames.mainFrame.LeftTab.BlackListButton.icon = { 0, .25 }

		L.Frames.mainFrame.LeftTab.SettingsButton = CreateNewButton (L.Frames.mainFrame.LeftTab, 3, -360, 143, 50, L.Locals.CurrentLocal ["btnNEWSettings"], "Interface\\AddOns\\LFG113\\textures\\Interface.tga", 4, function (self, num) return true end)
		L.Frames.mainFrame.LeftTab.SettingsButton.icon = { .25, .25 }

		L.Frames.mainFrame.LeftTab.count = CreateLabel (L.Frames.mainFrame.LeftTab, 280, 14, "GameFontNormal", L.Locals.CurrentLocal ["txtUpdate"])
		L.Frames.mainFrame.LeftTab.count:Hide ()

		L.Frames.mainFrame.TopTab = CreateFramecontainer (nil, L.Frames.mainFrame, 150, -22, -5, 315, "Interface/Tooltips/UI-Tooltip-Background")
		L.Frames.mainFrame.TopTab:SetFrameLevel (2)

		L.Frames.mainFrame.TopTab.title = CreateLabel (L.Frames.mainFrame.TopTab, 10, -7, "GameFontNormal", L.Locals.CurrentLocal ["lblWhatYouNeed"])

		L.Frames.mainFrame.TopTab.shrinkTopTab = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\Interface.tga",L.Frames.mainFrame.TopTab, 5, -154, 16, 16)
		L.Frames.mainFrame.TopTab.shrinkTopTab.texture:SetTexCoord (.25, .3125, .875, 1)
		L.Frames.mainFrame.TopTab.shrinkTopTab:SetScript ("OnEnter", function (self)
				if self.isUp then self.texture:SetTexCoord (.3125, .375, .75, .875)
				else self.texture:SetTexCoord (.3125, .375, .875, 1)
				end
			end)
		L.Frames.mainFrame.TopTab.shrinkTopTab:SetScript ("OnLeave", function (self)
				if self.isUp then self.texture:SetTexCoord (.25, .3125, .75, .875)
				else self.texture:SetTexCoord (.25, .3125, .875, 1)
				end
			end)
		L.Frames.mainFrame.TopTab.shrinkTopTab:SetScript ("OnMouseUp", function (self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				if self.isUp == nil then self.isUp = false end
				self.isUp = not self.isUp
				if self.isUp then
					self.texture:SetTexCoord (.25, .3125, .75, .875)
					L.Frames.mainFrame.TopTab:SetPoint("BOTTOMRIGHT", -5, 390)
					L.Frames.mainFrame.LFGLFMTab:SetPoint("TOPLEFT", 150, -112)
					L.Frames.mainFrame.TopTab.shrinkTopTab:SetPoint ("TOPLEFT", 5, -79)
					L.Frames.mainFrame.TopTab.lblActivity:Hide ()
					L.Frames.mainFrame.TopTab.Activity:Hide ()
					L.Frames.mainFrame.TopTab.instances:Hide ()
					L.Frames.mainFrame.TopTab.raids:Hide ()
					L.Frames.mainFrame.TopTab.pvp:Hide ()
					L.Frames.mainFrame.TopTab.customText:Hide ()
					--L.Frames.mainFrame.TopTab.btnGuildOnly:Hide ()
					L.Frames.mainFrame.TopTab.SelectAllCheckButton:Hide ()
					L.Frames.mainFrame.TopTab.rdoInstanceGroup ["txtAnd"]:Hide()
					L.Frames.mainFrame.TopTab.rdoInstanceGroup ["txtOr"]:Hide()
				else
					self.texture:SetTexCoord (.25, .3125, .875, 1)
					L.Frames.mainFrame.TopTab:SetPoint("BOTTOMRIGHT", -5, 315)
					L.Frames.mainFrame.LFGLFMTab:SetPoint("TOPLEFT", 150, -187)
					L.Frames.mainFrame.TopTab.shrinkTopTab:SetPoint ("TOPLEFT", 5, -154)
					L.Frames.mainFrame.TopTab.lblActivity:Show ()
					L.Frames.mainFrame.TopTab.Activity:Show ()
					if L.Variables.ActivitySelected == 1 then L.Frames.mainFrame.TopTab.instances:Show ()
					elseif L.Variables.ActivitySelected == 2 then  L.Frames.mainFrame.TopTab.raids:Show ()
					elseif L.Variables.ActivitySelected == 4 then L.Frames.mainFrame.TopTab.pvp:Show ()
					end
					L.Frames.mainFrame.TopTab.customText:Show ()
					--L.Frames.mainFrame.TopTab.btnGuildOnly:Show ()
					L.Frames.mainFrame.TopTab.SelectAllCheckButton:Show ()
					L.Frames.mainFrame.TopTab.rdoInstanceGroup ["txtAnd"]:Show()
					L.Frames.mainFrame.TopTab.rdoInstanceGroup ["txtOr"]:Show()
				end
			end)

		L.Frames.mainFrame.TopTab.roleDPS = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\Interface.tga", L.Frames.mainFrame.TopTab, 175, -25, 48, 48)
		L.Frames.mainFrame.TopTab.DPSCheckButton = CreateCheckbutton(L.Frames.mainFrame.TopTab, 170, -60, 10, "", L.Locals.CurrentLocal ["DPS"])
		L.Frames.mainFrame.TopTab.DPSCheckButton:SetScript ("OnClick", function()
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				ClearAllDisplayEntries ()
				UpdateDisplayFrame ()
			end)

		L.Frames.mainFrame.TopTab.roleHeals = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\Interface.tga", L.Frames.mainFrame.TopTab, 115, -25, 48, 48)
		L.Frames.mainFrame.TopTab.HealsCheckButton = CreateCheckbutton(L.Frames.mainFrame.TopTab, 110, -60, 9, "", L.Locals.CurrentLocal ["Heal"])
		L.Frames.mainFrame.TopTab.HealsCheckButton:SetScript ("OnClick", function()
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				ClearAllDisplayEntries ()
				UpdateDisplayFrame ()
			end)

		L.Frames.mainFrame.TopTab.roleTank = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\Interface.tga", L.Frames.mainFrame.TopTab, 55, -25, 48, 48)
		L.Frames.mainFrame.TopTab.TankCheckButton = CreateCheckbutton(L.Frames.mainFrame.TopTab, 50, -60, 8, "", L.Locals.CurrentLocal ["Tank"])
		L.Frames.mainFrame.TopTab.TankCheckButton:SetScript ("OnClick", function()
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				ClearAllDisplayEntries ()
				UpdateDisplayFrame ()
			end)

		L.Frames.mainFrame.TopTab.lblActivity = CreateLabel (L.Frames.mainFrame.TopTab, 10, -85, "GameFontNormal", L.Locals.CurrentLocal ["lblActivity"])

		L.Frames.mainFrame.TopTab.Activity = CreateGeneralPullDown (L.Frames.mainFrame.TopTab, 40, -100, 120, L.Locals.CurrentLocal ["cmbActivityPull"], function (Value)
				HideAllPulldowns ()
				L.Frames.mainFrame.TopTab.customText:SetPoint("TOPLEFT", 200, -130)
				L.Frames.mainFrame.TopTab.customText:SetWidth(125)
				if Value == L.Locals.CurrentLocal ["cmbActivityPull"][1] then
					L.Variables.ActivitySelected = 1
					L.Frames.mainFrame.TopTab.instances:Show ()
				elseif Value == L.Locals.CurrentLocal ["cmbActivityPull"][2] then
					L.Variables.ActivitySelected = 2
					L.Frames.mainFrame.TopTab.raids:Show ()
				elseif Value == L.Locals.CurrentLocal ["cmbActivityPull"][3] then
					L.Variables.ActivitySelected = 3
				elseif Value == L.Locals.CurrentLocal ["cmbActivityPull"][4] then
					L.Variables.ActivitySelected = 4
					L.Frames.mainFrame.TopTab.pvp:Show ()
				elseif Value == L.Locals.CurrentLocal ["cmbActivityPull"][5] then
					L.Variables.ActivitySelected = 5
					L.Frames.mainFrame.TopTab.customText:SetPoint("TOPLEFT", 65, -130)
					L.Frames.mainFrame.TopTab.customText:SetWidth(260)
				end
				L.Frames.mainFrame.TopTab.customText:Show()
				ClearAllDisplayEntries ()
				UpdateDisplayFrame ()
			end)
		UIDropDownMenu_SetText (L.Frames.mainFrame.TopTab.Activity, L.Locals.CurrentLocal ["cmbActivityPull"][1])

		L.Frames.mainFrame.TopTab.instances = CreatePullDown (L.Frames.mainFrame.TopTab, 40, -130, 120, false, L.Locals.CurrentLocal ["PulldownInstance"], L.Variables.InstancesSorted, function(newValue)
				if L.Variables.CurrentSearch [newValue] then L.Variables.CurrentSearch [newValue] = nil
				else L.Variables.CurrentSearch [newValue] = { "1", GetInstanceRow (newValue) }
				end
				ClearAllDisplayEntries ()
				UpdateDisplayFrame ()
			end)

		L.Frames.mainFrame.TopTab.raids = CreatePullDown (L.Frames.mainFrame.TopTab, 40, -130, 120, false, L.Locals.CurrentLocal ["PulldownRaids"], L.Variables.RaidsSorted, function(newValue)
				if L.Variables.CurrentSearch [newValue] then L.Variables.CurrentSearch [newValue] = nil
				else L.Variables.CurrentSearch [newValue] = { "2", GetInstanceRow (newValue) }
				end
				ClearAllDisplayEntries ()
				UpdateDisplayFrame ()
			end)

		L.Frames.mainFrame.TopTab.pvp = CreatePullDown (L.Frames.mainFrame.TopTab, 40, -130, 120, false, L.Locals.CurrentLocal ["PulldownPVP"], L.Variables.PVPSorted, function(newValue)
				if L.Variables.CurrentSearch [newValue] then L.Variables.CurrentSearch [newValue] = nil
				else L.Variables.CurrentSearch [newValue] = { "4", GetInstanceRow (newValue) }
				end
				ClearAllDisplayEntries ()
				UpdateDisplayFrame ()
			end)

		L.Frames.mainFrame.TopTab.customMainFrame = CreateFrame ("Frame", nil, L.Frames.mainFrame.TopTab, BackdropTemplateMixin and "BackdropTemplate")
		L.Frames.mainFrame.TopTab.customMainFrame:SetBackdrop ({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", tile = true, tileSize = 16, edgeSize = 16, insets = {left = 3, right = 3, top = 5, bottom = 3}})
		L.Frames.mainFrame.TopTab.customMainFrame:SetPoint ("TOPLEFT", 35, -150)
		L.Frames.mainFrame.TopTab.customMainFrame:SetSize(285, 130)
		L.Frames.mainFrame.TopTab.customMainFrame:SetFrameLevel (20)
		L.Frames.mainFrame.TopTab.customMainFrame.texture = L.Frames.mainFrame.TopTab.customMainFrame:CreateTexture(nil, "BACKGROUND")
		L.Frames.mainFrame.TopTab.customMainFrame.texture:SetAllPoints(true)
		L.Frames.mainFrame.TopTab.customMainFrame.texture:SetColorTexture(0, 0, 0, 1)
		L.Frames.mainFrame.TopTab.customMainFrameText = CreateFrame ("EditBox", nil, L.Frames.mainFrame.TopTab.customMainFrame)
		L.Frames.mainFrame.TopTab.customMainFrameText:SetPoint("TOPLEFT",  L.Frames.mainFrame.TopTab.customMainFrame, "TOPLEFT", 10, -10)
		L.Frames.mainFrame.TopTab.customMainFrameText:SetPoint("BOTTOMRIGHT", -10, 10)
		L.Frames.mainFrame.TopTab.customMainFrameText:SetMultiLine (true)
		L.Frames.mainFrame.TopTab.customMainFrameText:SetAutoFocus (false)
		L.Frames.mainFrame.TopTab.customMainFrameText:SetMaxLetters (200)
		L.Frames.mainFrame.TopTab.customMainFrameText:SetFontObject (ChatFontNormal)
		L.Frames.mainFrame.TopTab.customMainFrameText:SetScript("OnEscapePressed", function(self)
				local Response = nil
				if self.ReturnText then Response = self.ReturnText (L.Frames.mainFrame.TopTab.customMainFrameText:GetText ()) end
				self:ClearFocus()
				L.Frames.mainFrame.TopTab.customMainFrame:Hide ()
				UpdateDisplayFrame ()
			 end)
		L.Frames.mainFrame.TopTab.customMainFrameText:SetScript ("OnEnterPressed", function (self)
				local Response = nil
				if self.ReturnText then Response = self.ReturnText (L.Frames.mainFrame.TopTab.customMainFrameText:GetText ()) end
				self:ClearFocus()
				L.Frames.mainFrame.TopTab.customMainFrame:Hide ()
				if Response then L.Frames.mainFrame.Results.Message:SetText (Response)
				else UpdateDisplayFrame ()
				end
			end)

		L.Frames.mainFrame.TopTab.customText = CreateCustomTextBox (L.Frames.mainFrame.TopTab, 200, -130, 125, 28, L.Variables.CustomSearchString, function (_text) L.Variables.CustomSearchString = _text end)

		local function CreateRDOCheckBox (_parent, _x, _y, _text, _group, _selectedFunc)
			local rdobutton = CreateFrame ("CheckButton", nil, _parent, "UIRadioButtonTemplate")
			rdobutton:SetPoint ("TOPLEFT", _x, _y)
			rdobutton.text:SetText (_text)
			rdobutton:Show ()
			rdobutton:SetScript ("OnClick", function (self)
					if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
					local checked = self:GetChecked ()
					for key, value in pairs (_group) do value:SetChecked (false) end
					if _selectedFunc then _selectedFunc (self) end
					self:SetChecked (checked)
					UpdateDisplayFrame ()
				end)
			return rdobutton
		end

		L.Frames.mainFrame.TopTab.rdoRoleGroup = {}
		L.Frames.mainFrame.TopTab.rdoRoleGroup ["txtAnd"] = CreateRDOCheckBox (L.Frames.mainFrame.TopTab, 5, -35, L.Locals.CurrentLocal ["txtAnd"], L.Frames.mainFrame.TopTab.rdoRoleGroup, function (self) end)
		L.Frames.mainFrame.TopTab.rdoRoleGroup ["txtOr"] = CreateRDOCheckBox (L.Frames.mainFrame.TopTab, 5, -50, L.Locals.CurrentLocal ["txtOr"], L.Frames.mainFrame.TopTab.rdoRoleGroup, function (self) end)

		L.Frames.mainFrame.TopTab.rdoInstanceGroup = {}
		L.Frames.mainFrame.TopTab.rdoInstanceGroup ["txtAnd"] = CreateRDOCheckBox (L.Frames.mainFrame.TopTab, 5, -110, L.Locals.CurrentLocal ["txtAnd"], L.Frames.mainFrame.TopTab.rdoInstanceGroup, function (self) end)
		L.Frames.mainFrame.TopTab.rdoInstanceGroup ["txtOr"] = CreateRDOCheckBox (L.Frames.mainFrame.TopTab, 5, -125, L.Locals.CurrentLocal ["txtOr"], L.Frames.mainFrame.TopTab.rdoInstanceGroup, function (self) end)

		--L.Frames.mainFrame.TopTab.btnGuildOnly = CreateCheckbutton (L.Frames.mainFrame.TopTab, 220, -90, 10, L.Locals.CurrentLocal ["chkGuildOnly"], L.Locals.CurrentLocal ["pupGuildOnly"])
		--L.Frames.mainFrame.TopTab.btnGuildOnly:SetScript ("OnClick", function ()
		--		L.Variables.guildOnly = L.Frames.mainFrame.TopTab.btnGuildOnly:GetChecked()
		--		if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
		--		ClearAllDisplayEntries ()
		--		UpdateDisplayFrame ()
		--	end)
		--L.Frames.mainFrame.TopTab.btnGuildOnly:SetEnabled (IsInGuild())

		L.Frames.mainFrame.TopTab.SelectAllCheckButton = CreateCheckbutton (L.Frames.mainFrame.TopTab, 220, -110, 10, L.Locals.CurrentLocal ["chkShowAll"], L.Locals.CurrentLocal ["pupShowall"])
		L.Frames.mainFrame.TopTab.SelectAllCheckButton:SetScript ("OnClick", function ()
				L.Variables.AllDungeonsChecked = L.Frames.mainFrame.TopTab.SelectAllCheckButton:GetChecked()
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				ResetAllPulldowns ()
				ClearAllDisplayEntries ()
				UpdateDisplayFrame ()
			end)

		L.Frames.mainFrame.TopTab.btnSearch = CreateButton (L.Frames.mainFrame.TopTab, 237, -10, 90, 25, L.Locals.CurrentLocal ["btnSearch"])
		L.Frames.mainFrame.TopTab.btnSearch:SetFrameLevel (11)
		L.Frames.mainFrame.TopTab.btnSearch:SetScript ("OnClick", function(self)
				if L.Frames.mainFrame.TopTab.btnSearch:GetText () == L.Locals.CurrentLocal ["btnSearch"] then
					if CreateBroadcast () then
						if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.PVP_ENTER_QUEUE) end
						L.Frames.mainFrame.TopTab.btnSearch:SetText (L.Locals.CurrentLocal ["btnCancelSearch"])
						if L.Variables.TabViewing == 2 then L.Frames.mainFrame.TopTab.btnSearch.EnabledButton = L.Frames.mainFrame.LeftTab.LFMButton
						else L.Frames.mainFrame.TopTab.btnSearch.EnabledButton = L.Frames.mainFrame.LeftTab.LFGButton
						end
						L.Frames.mainFrame.TopTab.btnSave:SetEnabled (true)
						L.Frames.mainFrame.LeftTab.BothButton:SetEnabled (false)
						L.Frames.mainFrame.LeftTab.LFGButton:SetEnabled (false)
						L.Frames.mainFrame.LeftTab.LFMButton:SetEnabled (false)
						L.Frames.mainFrame.LeftTab.PremadeButton:SetEnabled (false)
						L.Frames.mainFrame.LeftTab.SearchesButton:SetEnabled (false)
						L.Frames.mainFrame.LeftTab.BlackListButton:SetEnabled (false)
						L.Frames.mainFrame.LeftTab.SettingsButton:SetEnabled (false)
						L.Frames.MinimapButton:Show ()
						L.Frames.rosterFrame.tmrBroadcaster = nil
						if not LFG113Saved ["disableAutomaticBroadcast"] then L.Frames.rosterFrame.tmrBroadcaster = C_Timer.NewTicker (LFG113Saved ["sliderTimer"], function () ShowBroadcastPopup () end) end
						BroadcastToAllChannels ()
					else
						if L.Frames.rosterFrame.tmrBroadcaster then L.Frames.rosterFrame.tmrBroadcaster:Cancel() end
					end
				else
					if LFG113Saved ["enableSound"] then  PlaySound(SOUNDKIT.IG_PVP_UPDATE) end
					L.Frames.mainFrame.TopTab.btnSearch:SetText (L.Locals.CurrentLocal ["btnSearch"])
					L.Frames.mainFrame.TopTab.btnSearch.EnabledButton:SetEnabled (true)
					EndBroadcast ()
					if L.Frames.rosterFrame.tmrBroadcaster then L.Frames.rosterFrame.tmrBroadcaster:Cancel() end
					ClearAllDisplayEntries ()
					UpdateDisplayFrame ()
					if not LFG113Saved ["alwaysShowEye"] then L.Frames.MinimapButton:Hide ()
					else L.Frames.MinimapButton.tooltip = { L.Locals.CurrentLocal ["pupActiveSearch"][1], { "\n" }, L.Locals.CurrentLocal ["pupActiveSearch"][4], L.Locals.CurrentLocal ["pupActiveSearch"][5]}
					end
				end
			end)

		L.Frames.mainFrame.TopTab.btnSave = CreateButton (L.Frames.mainFrame.TopTab, 237, -35, 90, 25, L.Locals.CurrentLocal ["btnAddSearch"])
		L.Frames.mainFrame.TopTab.btnSave:SetFrameLevel (11)
		L.Frames.mainFrame.TopTab.btnSave:SetScript ("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				L.Frames.mainFrame.TopTab.btnSave.SaveName = ""
				StaticPopupDialogs["LFG113_BLOCK"] = {
						timeout = 0, whileDead = true, hideOnEscape = true, hasEditBox = true, preferredIndex = 3,
						text = L.Locals.CurrentLocal ["txtSaveQuestion"],
						button1 = L.Locals.CurrentLocal ["btnAddSearch"], button2 = L.Locals.CurrentLocal ["btnCancel"],
						OnAccept = function(self)
								if self.editBox:GetText() and self.editBox:GetText():len() > 0 then
									LFG113Searches [self.editBox:GetText()] = {
											["TAB"] = L.Variables.TabViewing,
											["Roles"] = (L.Frames.mainFrame.TopTab.TankCheckButton:GetChecked() and "1" or "") .. (L.Frames.mainFrame.TopTab.HealsCheckButton:GetChecked() and "2" or "") .. ( L.Frames.mainFrame.TopTab.DPSCheckButton:GetChecked() and "3" or ""),
											["Searches"] = {},
											["Custom"] = L.Frames.mainFrame.TopTab.customText:GetText ()
										}
									for key, value in pairs (L.Variables.CurrentSearch) do
										table.insert (LFG113Searches [self.editBox:GetText()]["Searches"], { value [1], key })
									end
								end
								StaticPopupDialogs["LFG113_BLOCK"].OnAccept = nil
							end
				}
				StaticPopup_Show  ("LFG113_BLOCK")
			end)

		L.Frames.mainFrame.TopTab.btnClear = CreateButton (L.Frames.mainFrame.TopTab, 237, -60, 90, 25, L.Locals.CurrentLocal ["btnClear"])
		L.Frames.mainFrame.TopTab.btnClear:SetFrameLevel (11)
		L.Frames.mainFrame.TopTab.btnClear:SetScript ("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				L.Variables.CurrentSearch = {}
				L.Variables.CustomSearchString  = ""
				L.Frames.mainFrame.TopTab.customText:SetText ("")
				L.Frames.mainFrame.TopTab.TankCheckButton:SetChecked (false)
				L.Frames.mainFrame.TopTab.HealsCheckButton:SetChecked (false)
				L.Frames.mainFrame.TopTab.DPSCheckButton:SetChecked (false)
				ResetAllPulldowns ()
				ClearAllDisplayEntries ()
				UpdateDisplayFrame ()
			end)

		L.Frames.mainFrame.LFGLFMTab = CreateFramecontainer (nil, L.Frames.mainFrame, 150, -187, -14, 60, "Interface/Tooltips/UI-Tooltip-Background")
		L.Frames.mainFrame.LFGLFMTab.ScrollArea = CreateScrollArea (L.Frames.mainFrame.LFGLFMTab, "Interface/ACHIEVEMENTFRAME/UI-Achievement-StatWatermark.BLP")

		L.Frames.mainFrame.SearchTab = CreateFramecontainer (nil, L.Frames.mainFrame, 150, -43, -14, 60, "Interface/Tooltips/UI-Tooltip-Background")
		L.Frames.mainFrame.SearchTab.ScrollArea = CreateScrollArea (L.Frames.mainFrame.SearchTab, "Interface/ACHIEVEMENTFRAME/UI-Achievement-StatWatermark.BLP")
		L.Frames.mainFrame.SearchTab.label = CreateLabel (L.Frames.mainFrame.SearchTab, 10, 18, "GameFontNormalLarge", L.Locals.CurrentLocal ["lblSavedSearches"])

		L.Frames.mainFrame.BlockList = CreateFramecontainer ("LFG113BlockListFrame", L.Frames.mainFrame, 150, -130, -14, 60, "Interface/Tooltips/UI-Tooltip-Background")
		L.Frames.mainFrame.BlockList.topTabs = {}

		L.Frames.mainFrame.Settings = CreateFramecontainer ("LFG113SettingsFrame", L.Frames.mainFrame, 150, -60, -5, 60, "Interface/Tooltips/UI-Tooltip-Background")
		L.Frames.mainFrame.Settings:SetFrameLevel (2)

		L.Frames.mainFrame.BlockList.TabSelected = function (self)
			L.Variables.CurrentTab = self.content
			if self:GetID() < 5 then L.Variables.CurrentTabID = self:GetID() end
			PanelTemplates_SetTab (self:GetParent (), self:GetID())
			if L.Frames.mainFrame.BlockList.topTabs ["Blacklist"] then L.Frames.mainFrame.BlockList.topTabs ["Blacklist"]:Hide () end
			if L.Frames.mainFrame.BlockList.topTabs ["Premades"] then L.Frames.mainFrame.BlockList.topTabs ["Premades"]:Hide () end
			if L.Frames.mainFrame.BlockList.topTabs ["Ratings"] then L.Frames.mainFrame.BlockList.topTabs ["Ratings"]:Hide () end
			self.content:Show ()
		end

		L.Frames.mainFrame.BlockList.label = CreateLabel (L.Frames.mainFrame.BlockList, 10, 105, "GameFontNormalLarge", L.Locals.CurrentLocal ["btnBlackList"])

		L.Frames.mainFrame.BlockList.topTabs ["Blacklist"], L.Frames.mainFrame.BlockList.topTabs ["Premades"], L.Frames.mainFrame.BlockList.topTabs ["Ratings"] = MakeTabs (L.Frames.mainFrame.BlockList, 3, "Interface/ACHIEVEMENTFRAME/UI-Achievement-AchievementWatermark.BLP", L.Locals.CurrentLocal ["tabBlackList"], L.Locals.CurrentLocal ["tabPremade"],  L.Locals.CurrentLocal ["tabRatings"])
		L.Frames.mainFrame.BlockList.topTabs ["Premades"].ScrollArea = CreateScrollArea (L.Frames.mainFrame.BlockList.topTabs ["Premades"], nil)
		L.Frames.mainFrame.BlockList.topTabs ["Premades"].BlackList = {}
		L.Frames.mainFrame.BlockList.topTabs ["Blacklist"].ScrollArea = CreateScrollArea (L.Frames.mainFrame.BlockList.topTabs ["Blacklist"], nil)
		L.Frames.mainFrame.BlockList.topTabs ["Blacklist"].BlackList = {}
		L.Frames.mainFrame.BlockList.topTabs ["Ratings"].ScrollArea = CreateScrollArea (L.Frames.mainFrame.BlockList.topTabs ["Ratings"], nil)
		L.Frames.mainFrame.BlockList.topTabs ["Ratings"].BlackList = {}

		L.Frames.mainFrame.BlockList.Add = CreateButton (L.Frames.mainFrame.BlockList, 233, 38, 100, 20, L.Locals.CurrentLocal ["btnAdd"])
		L.Frames.mainFrame.BlockList.Add:SetScript ("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				local reported = L.Frames.mainFrame.BlockList.reportedText:GetText ():lower ()
				local issue = L.Frames.mainFrame.BlockList.issueText:GetText ()
				if L.Variables.TabViewing == 3 and issue:len () > 0 and reported:len () > 0 then -- Adding to blacklist
					if L.Variables.CurrentTabID == 1 then
						if L.Variables.reporters [L.Variables.Player] == nil then L.Variables.reporters [L.Variables.Player] = { ["count"] = 0, ["dates"] = {} } end
						if LFG113BlackList [reported] == nil then LFG113BlackList [reported] = {} end
						if LFG113BlackList [reported][L.Variables.Player] == nil then
							LFG113BlackList [reported][L.Variables.Player] = {
								["date"]	= date ("%y/%m/%d"), -- international date format yy/mm/dd
								["version"] = "1",
								["removed"] = "0",
								["issue"]	= issue
							}
						else
							LFG113BlackList [reported][L.Variables.Player]["issue"] = issue
							LFG113BlackList [reported][L.Variables.Player]["date"] = date("%y/%m/%d")
							LFG113BlackList [reported][L.Variables.Player]["version"] = tostring (tonumber (LFG113BlackList [reported][L.Variables.Player]["version"]) + 1)
						end
						LFG113BlackList [reported][L.Variables.Player]["personal"] = "n"
						L.Frames.mainFrame.BlockList.Reset:GetScript ("OnClick")(L.Frames.mainFrame.BlockList)
					elseif L.Variables.CurrentTabID == 3 then
					end
					DisplayBlackList ()
				elseif L.Variables.TabViewing == 6 and issue:len () > 0 then -- Adding to Premades
					if ShiftClick ~= "" and reported:len () == 0 and LFG113Premades [issue] == nil then
						LFG113Premades [issue] = LFG113Premades [ShiftClick]
						LFG113Premades [ShiftClick] = nil
						ShiftClick = ""
					else if LFG113Premades [issue] == nil then LFG113Premades [issue] = { } end
					end
					LFG113Premades [issue]["isRaid"] = L.Frames.mainFrame.BlockList.isRaid:GetChecked ()
					if reported:len () > 0 then
						local roles = "Y" ..  (L.Frames.mainFrame.BlockList.isTank:GetChecked () and "1" or "") .. (L.Frames.mainFrame.BlockList.isHeals:GetChecked () and "2" or "") .. (L.Frames.mainFrame.BlockList.isDPS:GetChecked () and "3" or "")
						LFG113Premades [issue][reported] = roles
					end
					L.Frames.mainFrame.BlockList.Reset:GetScript ("OnClick")(L.Frames.mainFrame.BlockList)
					ClearAllDisplayEntries ()
					DisplayPremades ()
				end
			end)
		L.Frames.mainFrame.BlockList.Add:SetEnabled (false)

		L.Frames.mainFrame.BlockList.Reset = CreateButton (L.Frames.mainFrame.BlockList, 135, 38, 100, 20, L.Locals.CurrentLocal ["btnClear"])
		L.Frames.mainFrame.BlockList.Reset:SetScript ("OnClick", function ()
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				L.Frames.mainFrame.BlockList.isRaid:SetChecked (false)
				L.Frames.mainFrame.BlockList.isTank:SetChecked (false)
				L.Frames.mainFrame.BlockList.isHeals:SetChecked (false)
				L.Frames.mainFrame.BlockList.isDPS:SetChecked (false)
				L.Frames.mainFrame.BlockList.reportedText:SetText ("")
				L.Frames.mainFrame.BlockList.issueText:SetText ("")
				L.Frames.mainFrame.BlockList.Add:SetEnabled (false)
			end)

		L.Frames.mainFrame.BlockList.lblReported = CreateLabel (L.Frames.mainFrame.BlockList, 5, 83, "GameFontNormal", L.Locals.CurrentLocal ["lblPlayer"])
		L.Frames.mainFrame.BlockList.reportedText = CreateCustomTextBox (L.Frames.mainFrame.BlockList, 60, 90, 150, 28, "", function (_text)
				L.Frames.mainFrame.BlockList.Add:SetEnabled (L.Frames.mainFrame.BlockList.issueText:GetText ():len () > 0 and (_text:len () > 0 or L.Variables.TabViewing == 6))
			end)

		L.Frames.mainFrame.BlockList.lblIssue = CreateLabel (L.Frames.mainFrame.BlockList, 5, 58, "GameFontNormal", L.Locals.CurrentLocal ["lblIssue"])
		L.Frames.mainFrame.BlockList.issueText = CreateCustomTextBox (L.Frames.mainFrame.BlockList, 60, 65, 200, 28, "", function (_text)
				local txtReported = L.Frames.mainFrame.BlockList.reportedText:GetText ()
				L.Frames.mainFrame.BlockList.Add:SetEnabled (_text:len () > 0 and (txtReported:len () > 0 or L.Variables.TabViewing == 6))
			end)

		L.Frames.mainFrame.BlockList.isRaid = CreateCheckbutton (L.Frames.mainFrame.BlockList, 280, 62, 10, L.Locals.CurrentLocal ["cmbActivityPull"][2], "Automaticaly convert to a raid when people join")
		L.Frames.mainFrame.BlockList.roleDPS = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\Interface.tga", L.Frames.mainFrame.BlockList, 300, 100, 32, 32)
		L.Frames.mainFrame.BlockList.roleDPS.texture:SetTexCoord (.75, .875, 0, .25)
		L.Frames.mainFrame.BlockList.isDPS = CreateCheckbutton (L.Frames.mainFrame.BlockList, 290, 85, 10, "", L.Locals.CurrentLocal ["DPS"])
		L.Frames.mainFrame.BlockList.roleHeals = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\Interface.tga", L.Frames.mainFrame.BlockList, 260, 100, 32, 32)
		L.Frames.mainFrame.BlockList.roleHeals.texture:SetTexCoord (.5, .625, .25, .5)
		L.Frames.mainFrame.BlockList.isHeals = CreateCheckbutton (L.Frames.mainFrame.BlockList, 250, 85, 9, "", L.Locals.CurrentLocal ["Heal"])
		L.Frames.mainFrame.BlockList.roleTank = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\Interface.tga", L.Frames.mainFrame.BlockList, 220, 100, 32, 32)
		L.Frames.mainFrame.BlockList.roleTank.texture:SetTexCoord (.5, .625, 0, .25)
		L.Frames.mainFrame.BlockList.isTank = CreateCheckbutton (L.Frames.mainFrame.BlockList, 210, 85, 8, "", L.Locals.CurrentLocal ["Tank"])

		local function CreateWhisperOptions (_parent, _x, _y, _width, _label, _text, _defaultText, _returnFunction)
			local frame
			if _label then
				frame = CreateCustomTextBox (_parent, _x + 50, _y - 10, _width, 28, _text, _returnFunction)
				frame.label = CreateLabel (_parent, _x, _y, "GameFontNormal", _label)
			else frame = CreateCustomTextBox (_parent, _x, _y, _width, 28, _text, _returnFunction)
			end

			if _defaultText then
				frame.btnDefault = CreateButton (frame, _width, -4, 100, 20, L.Locals.CurrentLocal ["btnDefault"])
				frame.btnDefault:SetScript ("OnClick", function (self)
						local Response = nil
						if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
						frame:SetText (_defaultText)
						frame:SetCursorPosition (0)
						if _returnFunction then Response = _returnFunction (_defaultText) end
						if Response then L.Frames.mainFrame.Results.Message:SetText (Response) end
					end)
			end
			return frame
		end

		L.Frames.mainFrame.Settings.topTabs = {}
		L.Frames.mainFrame.Settings.TabSelected = function (self)
			PanelTemplates_SetTab (self:GetParent (), self:GetID())
			--L.Variables.CurrentTabID = self:GetID()
			if L.Frames.mainFrame.Settings.topTabs ["General"] then L.Frames.mainFrame.Settings.topTabs ["General"]:Hide () end
			if L.Frames.mainFrame.Settings.topTabs ["Communication"] then L.Frames.mainFrame.Settings.topTabs ["Communication"]:Hide () end
			if L.Frames.mainFrame.Settings.topTabs ["Whispers"] then L.Frames.mainFrame.Settings.topTabs ["Whispers"]:Hide () end
			if L.Frames.mainFrame.Settings.topTabs ["Display"] then L.Frames.mainFrame.Settings.topTabs ["Display"]:Hide () end
			if L.Frames.mainFrame.Settings.topTabs ["Keywords"] then L.Frames.mainFrame.Settings.topTabs ["Keywords"]:Hide () end
			self.content:Show ()
		end

		L.Frames.mainFrame.Settings.topTabs ["General"], L.Frames.mainFrame.Settings.topTabs ["Communication"], L.Frames.mainFrame.Settings.topTabs ["Whispers"], L.Frames.mainFrame.Settings.topTabs ["Display"] , L.Frames.mainFrame.Settings.topTabs ["Keywords"] = MakeTabs (L.Frames.mainFrame.Settings, 5, "Interface/Artifacts/ArtifactAnim2.BLP", L.Locals.CurrentLocal ["tabGeneral"], L.Locals.CurrentLocal ["tabCommunication"], L.Locals.CurrentLocal ["tabWhisper"],  L.Locals.CurrentLocal ["tabDisplay"],  L.Locals.CurrentLocal ["tabKeywords"])

		L.Frames.mainFrame.Settings.head = CreateLabel (L.Frames.mainFrame.Settings, 10, 35, "GameFontNormalLarge", L.Locals.CurrentLocal ["lblSettings"])

		local function CreateChannelFrame (parent, index, channel, value)
			--if value ["Broadcast"] == nil then return end
			local function SetEnabled (parent, enable)
				parent.chkBroadcast:SetEnabled (enable)
				if enable then parent.text:SetFontObject ("GameFontHighlight")
				else parent.text:SetFontObject ("GameFontDisable")
				end
			end
			local lowerCaseChannel = strlower(channel)
			local f = CreateFrame ("frame", nil, parent.content, BackdropTemplateMixin and "BackdropTemplate")
			f:SetPoint ("TOPLEFT", 0, - index * 25)
			f:SetSize (240, 25)
			f:SetBackdrop({bgFile = background, edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile = false, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 }})
			f:SetBackdropColor(0,0,0,1)
			f.index = index
			f.chkBroadcast = CreateCheckbutton (f, 25, -1, 10, "", "Check to enable broadcasting")
			f.chkBroadcast:SetChecked (value ["Broadcast"])
			f.chkBroadcast:SetScript ("OnClick", function (self) LFG113Saved ["channels"][lowerCaseChannel]["Broadcast"] = self:GetChecked () end)
			f.StatusChanged = function(position)
				if LFG113Saved ["enableChannelModification"] or (not LFG113Saved ["enableChannelModification"] and value["exists"]) then
					f:Show()
					f:SetPoint ("TOPLEFT", 0, - position * 25)
					return 1
				else
					f:Hide()
					return 0
				end
			end
			f.StatusChanged(index)

			f.chkLoad = CreateCheckbutton (f, 5, -1, 10, "", "Check to listen on channel")
			f.chkLoad:SetChecked (value ["Load"])
			f.chkLoad:SetScript ("OnClick", function (self)
					LFG113Saved ["channels"][lowerCaseChannel]["Load"] = self:GetChecked ()
					SetEnabled (self:GetParent(), self:GetChecked())
					if LFG113Saved ["enableChannelModification"] then
						if self:GetChecked() then
							if LFG113Saved ["channels"][lowerCaseChannel]["Pass"] ~= nil then JoinTemporaryChannel (value ["WithCaps"], LFG113Saved ["channels"][lowerCaseChannel]["Pass"])
							else JoinTemporaryChannel (value ["WithCaps"])
							end
						else if L.Variables.ChannelsUsed [lowerCaseChannel]["exists"] == nil then LeaveChannelByName (value ["WithCaps"]) end
						end
					end
				end)
			f.text = CreateLabel (f, 50, -7, "GameFontHighlight", value ["WithCaps"])
			if value["exists"] == nil then
				f.remove = CreateTexture ("interface/buttons/UI-GroupLoot-Pass-Down.blp", f, 215, -4, 17, 17)
				f.remove:SetScript ("OnEnter", function (self) self.texture:SetTexture ("interface/buttons/UI-GroupLoot-Pass-Up.blp") end)
				f.remove:SetScript ("OnLeave", function (self) self.texture:SetTexture ("interface/buttons/UI-GroupLoot-Pass-Down.blp") end)
				f.remove:SetScript ("OnMouseDown", function (self) self.texture:SetTexture ("interface/buttons/UI-GroupLoot-Pass-Highlight.blp") end)
				f.remove:SetScript ("OnMouseUp", function (self)
						self.texture:SetTexture ("interface/buttons/UI-GroupLoot-Pass-Up.blp")
						-- we need to remove this from list and shift others up in position/index
						for cKey, value in pairs (L.Variables.ChannelsUsed) do
							if value ["frame"] ~= nil  then
								if value ["frame"].index == index then toDelete = cKey end
								if index < value ["frame"].index then
									value ["frame"].index = value ["frame"].index - 1
									value ["frame"]:SetPoint ("TOPLEFT", 0, - value ["frame"].index * 25)
								end
							end
						end
						self:GetParent():Hide ()
						L.Frames.mainFrame.Settings.topTabs ["Communication"].channelCount = L.Frames.mainFrame.Settings.topTabs ["Communication"].channelCount - 1
						L.Frames.mainFrame.Settings.topTabs ["Communication"].frmChannelList.vScrollbar:SetMinMaxValues(1, math.max(1, math.abs(L.Frames.mainFrame.Settings.topTabs ["Communication"].channelCount * 25) - L.Frames.mainFrame.Settings.topTabs ["Communication"].frmChannelList:GetHeight() + 25))
						-- now remove from Saved Variables
						if L.Variables.ChannelsUsed [lowerCaseChannel]["exists"] == nil and LFG113Saved ["enableChannelModification"] then LeaveChannelByName (toDelete) end
						L.Variables.ChannelsUsed [strlower (toDelete)] = nil
						LFG113Saved ["channels"][strlower(toDelete)] = nil
					end)
			end
			SetEnabled (f, value ["Load"])
			L.Frames.mainFrame.Settings.topTabs ["Communication"].channelCount = L.Frames.mainFrame.Settings.topTabs ["Communication"].channelCount + 1
			L.Frames.mainFrame.Settings.topTabs ["Communication"].frmChannelList.vScrollbar:SetMinMaxValues(1, math.max(1, math.abs(L.Frames.mainFrame.Settings.topTabs ["Communication"].channelCount * 25) - L.Frames.mainFrame.Settings.topTabs ["Communication"].frmChannelList:GetHeight() + 25))
			return f
		end

		L.Frames.mainFrame.Settings.topTabs ["Communication"].lblChannelList = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["Communication"], 10, -20, "GameFontNormal", "Channel List (No specific load order)")
		L.Frames.mainFrame.Settings.topTabs ["Communication"].btnAdd = CreateButton (L.Frames.mainFrame.Settings.topTabs ["Communication"], 300, -15, 20, 20, "+")
		L.Frames.mainFrame.Settings.topTabs ["Communication"].btnAdd.tooltip = "Add a new channel"
		L.Frames.mainFrame.Settings.topTabs ["Communication"].btnAdd:SetScript ("OnClick", function (self)
				GetNewChannel ("Add / new channel name?", function (channelAnswer)
						if channelAnswer:len() > 0 then
							C_Timer.After (.2, function ()
									GetNewChannel ("Please enter a password for '" .. channelAnswer .. "'.", function (passAnswer)
											if LFG113Saved ["channels"][strlower(channelAnswer)] then print ("Error Channel EXISTS")
											else
												if passAnswer:len() == 0 then passAnswer = nil end
												LFG113Saved ["channels"][strlower(channelAnswer)] = { ["WithCaps"] = channelAnswer, ["Pass"] = passAnswer, ["Load"] = false, ["Broadcast"] = false }
												SetUpChannel (channelAnswer, { ["WithCaps"] = channelAnswer, ["Pass"] = passAnswer, ["Load"] = false, ["Broadcast"] = false, ["Exists"] = false, ["used"] = false })
												local min, max = L.Frames.mainFrame.Settings.topTabs ["Communication"].frmChannelList.vScrollbar:GetMinMaxValues ()
												L.Frames.mainFrame.Settings.topTabs ["Communication"].frmChannelList.vScrollbar:SetMinMaxValues(1, max + 25)
												L.Variables.ChannelsUsed [strlower(channelAnswer)]["frame"] = CreateChannelFrame (L.Frames.mainFrame.Settings.topTabs ["Communication"].scrChannelList, L.Frames.mainFrame.Settings.topTabs ["Communication"].channelCount, channelAnswer, L.Variables.ChannelsUsed[strlower(channelAnswer)])
											end
									end)
								end)
						end
					end)
			end)
		L.Frames.mainFrame.Settings.topTabs ["Communication"].btnAdd:SetEnabled (LFG113Saved ["enableChannelModification"])
		L.Frames.mainFrame.Settings.topTabs ["Communication"].frmChannelList = CreateFramecontainer (nil, L.Frames.mainFrame.Settings.topTabs ["Communication"], 60, -35, -25, 250, "")
		L.Frames.mainFrame.Settings.topTabs ["Communication"].scrChannelList = CreateScrollArea (L.Frames.mainFrame.Settings.topTabs ["Communication"].frmChannelList, nil)
		L.Frames.mainFrame.Settings.topTabs ["Communication"].channels = {}
		L.Frames.mainFrame.Settings.topTabs ["Communication"].channelCount = 0
		for channel, value in pairs (L.Variables.ChannelsUsed) do
			if  channel ~= "LFG113v04a" and value ["WithCaps"] ~= nil then value ["frame"] = CreateChannelFrame (L.Frames.mainFrame.Settings.topTabs ["Communication"].scrChannelList, L.Frames.mainFrame.Settings.topTabs ["Communication"].channelCount, channel, value) end
		end

		L.Frames.mainFrame.Settings.topTabs ["Communication"].lblChannelLoading = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["Communication"], 10, -140, "GameFontNormal", L.Locals.CurrentLocal ["lblChannelLoading"])
		L.Frames.mainFrame.Settings.topTabs ["Communication"].chkChannelLoading = CreateCheckbutton(L.Frames.mainFrame.Settings.topTabs ["Communication"], 60, -150, 10, L.Locals.CurrentLocal ["chkChannelLoading"], L.Locals.CurrentLocal ["pupChannelLoading"])
		L.Frames.mainFrame.Settings.topTabs ["Communication"].chkChannelLoading:SetScript("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Saved ["enableChannelModification"] = self:GetChecked()
				L.Frames.mainFrame.Settings.topTabs ["Communication"].btnAdd:SetEnabled (LFG113Saved ["enableChannelModification"])
				local position = 0
				for channel, value in pairs (L.Variables.ChannelsUsed) do
					if value ["frame"] and value ["frame"].StatusChanged then position = position + value ["frame"].StatusChanged(position) end
				end
			end)

		L.Frames.mainFrame.Settings.topTabs ["Communication"].lblSliderTimer = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["Communication"], 10, -190, "GameFontNormal", L.Locals.CurrentLocal ["lblTTB"])
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderTimer = CreateFrame("Slider", "LFG113sliderTimer", L.Frames.mainFrame.Settings.topTabs ["Communication"], "OptionsSliderTemplate")
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderTimer:SetPoint ("TOPLEFT", 60, -200)
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderTimer:SetOrientation("HORIZONTAL")
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderTimer:SetSize (240, 20)
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderTimer:SetMinMaxValues(60, 180)
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderTimer:SetValue (LFG113Saved ["sliderTimer"] )
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderTimer:SetValueStep (1)
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderTimer.tooltipText = L.Locals.CurrentLocal ["pupBroadcast"]
		getglobal(L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderTimer:GetName() .. "Low"):SetText("60")
		getglobal(L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderTimer:GetName() .. "High"):SetText("180")
		getglobal(L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderTimer:GetName() .. "Text"):SetText(LFG113Saved ["sliderTimer"])
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderTimer:SetScript("OnValueChanged", function(self, value)
				LFG113Saved ["sliderTimer"] = floor(value)
				getglobal(self:GetName() .. "Text"):SetText(floor(value))
			end)

		L.Frames.mainFrame.Settings.topTabs ["Communication"].lblsliderMessageLife = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["Communication"], 10, -240, "GameFontNormal", L.Locals.CurrentLocal ["lblTimeToLive"])
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderMessageLife = CreateFrame("Slider", "LFG113sliderMessageLife", L.Frames.mainFrame.Settings.topTabs ["Communication"], "OptionsSliderTemplate")
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderMessageLife:SetPoint ("TOPLEFT", 60, -250)
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderMessageLife:SetOrientation("HORIZONTAL")
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderMessageLife:SetSize (240, 20)
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderMessageLife:SetMinMaxValues(10, 180)
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderMessageLife:SetValue (LFG113Saved ["sliderTimeToLive"])
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderMessageLife:SetValueStep (1)
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderMessageLife.tooltipText = L.Locals.CurrentLocal ["pupTimeToLive"]
		getglobal(L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderMessageLife:GetName() .. "Low"):SetText("10")
		getglobal(L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderMessageLife:GetName() .. "High"):SetText("180")
		getglobal(L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderMessageLife:GetName() .. "Text"):SetText(LFG113Saved ["sliderTimeToLive"])
		L.Frames.mainFrame.Settings.topTabs ["Communication"].sliderMessageLife:SetScript("OnValueChanged", function(self, value)
				LFG113Saved ["sliderTimeToLive"] = floor(value)
				getglobal(self:GetName() .. "Text"):SetText(floor(value))
			end)


		L.Frames.mainFrame.Settings.topTabs ["Communication"].lblLFM = CreateWhisperOptions (L.Frames.mainFrame.Settings.topTabs ["Communication"], 10, -290, 180, L.Locals.CurrentLocal ["lblLFM"], LFG113Saved ["LFMFormat"], L.Locals.CurrentCommLocal ["txtDefaultSearch"]["LFM"], function (text)
				LFG113Saved ["LFMFormat"] = text
				return FormatWhisperString (text, "")[1]
			end)

		L.Frames.mainFrame.Settings.topTabs ["Communication"].lblLFG = CreateWhisperOptions (L.Frames.mainFrame.Settings.topTabs ["Communication"], 10, -330, 180, L.Locals.CurrentLocal ["lblLFG"], LFG113Saved ["LFGFormat"], L.Locals.CurrentCommLocal ["txtDefaultSearch"]["LFG"], function (text)
				LFG113Saved ["LFGFormat"] = text
				return FormatWhisperString (text, "")[1]
			end)

		L.Frames.mainFrame.Settings.topTabs ["Whispers"].autoConnect = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["Whispers"], 10, -30, "GameFontNormal", L.Locals.CurrentLocal ["lblAutoWhisper"])
		L.Frames.mainFrame.Settings.topTabs ["Whispers"].autoAcceptWhisper = CreateCheckbutton(L.Frames.mainFrame.Settings.topTabs ["Whispers"], 60, -40, 10, L.Locals.CurrentLocal ["chkWhispers"], L.Locals.CurrentLocal ["pupAcceptWhispers"])
		L.Frames.mainFrame.Settings.topTabs ["Whispers"].autoAcceptWhisper:SetScript("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Saved ["autoAcceptWhisper"] = self:GetChecked()
			end)

		L.Frames.mainFrame.Settings.topTabs ["Whispers"].help = CreateButton (L.Frames.mainFrame.Settings.topTabs ["Whispers"], 295, -35, 30, 30, "?")
		L.Frames.mainFrame.Settings.topTabs ["Whispers"].help.tooltip = L.Locals.CurrentLocal ["pupHowtoUse"]
		L.Frames.mainFrame.Settings.topTabs ["Whispers"].help:SetScript("OnEnter", ToolTipOnEnter)
		L.Frames.mainFrame.Settings.topTabs ["Whispers"].help:SetScript("OnLeave", ToolTipOnLeave)

		L.Frames.mainFrame.Settings.topTabs ["Whispers"].txtWhisperDecline = CreateWhisperOptions (L.Frames.mainFrame.Settings.topTabs ["Whispers"], 10, -70, 180, L.Locals.CurrentLocal ["lblMessDecline"], LFG113Saved ["whisperDecline"], L.Locals.CurrentCommLocal ["txtDefaultWhispers"]["Decline"], function (text)
				LFG113Saved ["whisperDecline"] = text
				return FormatWhisperString (text, "")[1]
			end)

		L.Frames.mainFrame.Settings.topTabs ["Whispers"].txtWhisperAccept = CreateWhisperOptions (L.Frames.mainFrame.Settings.topTabs ["Whispers"], 10, -110, 180, L.Locals.CurrentLocal ["lblMessAccept"], LFG113Saved ["whisperAccept"], L.Locals.CurrentCommLocal ["txtDefaultWhispers"]["Accept"], function (text)
				LFG113Saved ["whisperAccept"] = text
				return FormatWhisperString (text, "")[1]
			end)

		L.Frames.mainFrame.Settings.topTabs ["Whispers"].txtWhisperJoin = CreateWhisperOptions (L.Frames.mainFrame.Settings.topTabs ["Whispers"], 10, -150, 180, L.Locals.CurrentLocal ["lblMessJoin"], LFG113Saved ["whisperJoin"], L.Locals.CurrentCommLocal ["txtDefaultWhispers"]["Join"], function (text)
				LFG113Saved ["whisperJoin"] = text
				return FormatWhisperString (text, "")[1]
			end)

		L.Frames.mainFrame.Settings.topTabs ["Whispers"].txtWhisperInvite = CreateWhisperOptions (L.Frames.mainFrame.Settings.topTabs ["Whispers"], 10, -190, 180, L.Locals.CurrentLocal ["lblMessInvite"], LFG113Saved ["whisperInvite"], L.Locals.CurrentCommLocal ["txtDefaultWhispers"]["Invite"], function (text)
				LFG113Saved ["whisperInvite"] = text
				return FormatWhisperString (text, "")[1]
			end)

		L.Frames.mainFrame.Settings.topTabs ["Whispers"].txtWhisperGuildInvite = CreateWhisperOptions (L.Frames.mainFrame.Settings.topTabs ["Whispers"], 10, -230, 180, L.Locals.CurrentLocal ["lblMessGuildInvite"], LFG113Saved ["whisperGuildInvite"], L.Locals.CurrentCommLocal ["txtDefaultWhispers"]["Guild"], function (text)
				LFG113Saved ["whisperGuildInvite"] = text
				return FormatWhisperString (text, "")[1]
			end)

		L.Frames.mainFrame.Settings.topTabs ["Whispers"].txtWhisperMissingInfo = CreateWhisperOptions (L.Frames.mainFrame.Settings.topTabs ["Whispers"], 10, -270, 180, L.Locals.CurrentLocal ["lblMessMissing"], LFG113Saved ["whisperMissingInformation"], L.Locals.CurrentCommLocal ["txtDefaultWhispers"]["Missing"], function (text)
				LFG113Saved ["whisperMissingInformation"] = text
				return FormatWhisperString (text, "")[1]
			end)

		L.Frames.mainFrame.Settings.topTabs ["Keywords"].lblKeywords = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["Keywords"], 10, -30, "GameFontNormal", L.Locals.CurrentLocal ["lblKeywords"])
		L.Frames.mainFrame.Settings.topTabs ["Keywords"].lblActivity = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["Keywords"], 60, -50, "GameFontNormal", L.Locals.CurrentLocal ["lblInstanceKey"])
		L.Frames.mainFrame.Settings.topTabs ["Keywords"].lblInstanceKey = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["Keywords"], 150, -50, "GameFontHighlight", "")

		L.Frames.mainFrame.Settings.topTabs ["Keywords"].lblPulldown = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["Keywords"], 60, -70, "GameFontNormal", L.Locals.CurrentLocal ["lblPulldown"])
		L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtPulldown = CreateWhisperOptions (L.Frames.mainFrame.Settings.topTabs ["Keywords"], 150, -61, 180, nil, "", nil, function (text)
				local myKeyword = L.Frames.mainFrame.Settings.topTabs ["Keywords"].lblInstanceKey:GetText ();
				if myKeyword and myKeyword:len() > 0 then
					ClearAllDisplayEntries ()
					if LFG113InstanceKeys [myKeyword] == nil then
						LFG113InstanceKeys [myKeyword] = DeepCopy (GetInstanceRow (myKeyword))
						if LFG113InstanceKeys ["h" .. myKeyword] == nil and GetInstanceRow ("h" .. myKeyword) then LFG113InstanceKeys ["h" .. myKeyword] = DeepCopy (GetInstanceRow ("h" .. myKeyword)) end
					end
					LFG113InstanceKeys [myKeyword][2] = text
					if LFG113InstanceKeys ["h" .. myKeyword] then LFG113InstanceKeys ["h" .. myKeyword][2] = "Heroic " .. text end
					DisplayKeys (true)
					DisplayKeys (false)
				else return " "
				end
			end)

		L.Frames.mainFrame.Settings.topTabs ["Keywords"].lblBroadcast = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["Keywords"], 60, -90, "GameFontNormal", L.Locals.CurrentLocal ["lblBroadcast"])
		L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtBroadcast = CreateWhisperOptions (L.Frames.mainFrame.Settings.topTabs ["Keywords"], 150, -81, 180, nil, "", nil, function (text)
				local myKeyword = L.Frames.mainFrame.Settings.topTabs ["Keywords"].lblInstanceKey:GetText ();
				if myKeyword and myKeyword:len() > 0 then
					ClearAllDisplayEntries ()
					if LFG113InstanceKeys [myKeyword] == nil then
						LFG113InstanceKeys [myKeyword] = DeepCopy (GetInstanceRow (myKeyword))
						if LFG113InstanceKeys ["h" .. myKeyword] == nil and GetInstanceRow ("h" .. myKeyword) then LFG113InstanceKeys ["h" .. myKeyword] = DeepCopy (GetInstanceRow ("h" .. myKeyword)) end
					end
					LFG113InstanceKeys [myKeyword][5] = text
					if LFG113InstanceKeys ["h" .. myKeyword] then LFG113InstanceKeys ["h" .. myKeyword][5] = "Heroic " ..  text end
					DisplayKeys (true)
					DisplayKeys (false)
				else return " "
				end
			end)

		L.Frames.mainFrame.Settings.topTabs ["Keywords"].lblLevel = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["Keywords"], 60, -110, "GameFontNormal", "Level Range")
		L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtLowerLevel = CreateWhisperOptions (L.Frames.mainFrame.Settings.topTabs ["Keywords"], 150, -101, 20, nil, "", nil, function (text)
				local myKeyword = L.Frames.mainFrame.Settings.topTabs ["Keywords"].lblInstanceKey:GetText ();
				if myKeyword and myKeyword:len() > 0 then
					ClearAllDisplayEntries ()
					if LFG113InstanceKeys [myKeyword] == nil then
						LFG113InstanceKeys [myKeyword] = DeepCopy (GetInstanceRow (myKeyword))
						if LFG113InstanceKeys ["h" .. myKeyword] == nil and GetInstanceRow ("h" .. myKeyword) then LFG113InstanceKeys ["h" .. myKeyword] = DeepCopy (GetInstanceRow ("h" .. myKeyword)) end
					end
					LFG113InstanceKeys [myKeyword][3] = tonumber (text)
					DisplayKeys (true)
					DisplayKeys (false)
				end
			end)
		L.Frames.mainFrame.Settings.topTabs ["Keywords"].lblLevel = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["Keywords"], 175, -110, "GameFontNormal", "-")
		L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtHigherLevel = CreateWhisperOptions (L.Frames.mainFrame.Settings.topTabs ["Keywords"], 190, -101, 20, nil, "", nil, function (text)
				local myKeyword = L.Frames.mainFrame.Settings.topTabs ["Keywords"].lblInstanceKey:GetText ();
				if myKeyword and myKeyword:len() > 0 then
					ClearAllDisplayEntries ()
					if LFG113InstanceKeys [myKeyword] == nil then
						LFG113InstanceKeys [myKeyword] = DeepCopy (GetInstanceRow (myKeyword))
						if LFG113InstanceKeys ["h" .. myKeyword] == nil and GetInstanceRow ("h" .. myKeyword) then LFG113InstanceKeys ["h" .. myKeyword] = DeepCopy (GetInstanceRow ("h" .. myKeyword)) end
					end
					LFG113InstanceKeys [myKeyword][4] = tonumber (text)
					DisplayKeys (true)
					DisplayKeys (false)
				end
			end)


		L.Frames.mainFrame.Settings.topTabs ["Keywords"].btnAdd = CreateButton (L.Frames.mainFrame.Settings.topTabs ["Keywords"], 300, -110, 20, 20, "+")
		L.Frames.mainFrame.Settings.topTabs ["Keywords"].btnAdd:SetScript ("OnClick", function(self)
				if L.Frames.mainFrame.Settings.topTabs ["Keywords"].lblInstanceKey:GetText () then
					if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
					L.Frames.mainFrame.Settings.topTabs ["Keywords"].btnAdd.SaveName = ""
					StaticPopupDialogs["LFG113_BLOCK"] = {
							timeout = 0, whileDead = true, hideOnEscape = true, hasEditBox = true, preferredIndex = 3,
							text = L.Locals.CurrentLocal ["txtAddQuestion"],
							button1 = L.Locals.CurrentLocal ["btnAddSearch"], button2 = L.Locals.CurrentLocal ["btnCancel"],
							OnAccept = function(self)
									local newKeyword = strlower (self.editBox:GetText ())
									local myKeyword = L.Frames.mainFrame.Settings.topTabs ["Keywords"].lblInstanceKey:GetText ();
									if newKeyword:len() > 0 and myKeyword:len() > 0 then
										ClearAllDisplayEntries ()
										L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList.BlackList = {}
										if LFG113InstanceKeys [myKeyword] == nil then LFG113InstanceKeys [myKeyword] = DeepCopy (GetInstanceRow (myKeyword)) end
										LFG113InstanceKeys [myKeyword][7][newKeyword] = "1"
										DisplayKeys (true)
										DisplayKeys (false)
									end
									StaticPopupDialogs["LFG113_BLOCK"].OnAccept = nil
								end
					}
					StaticPopup_Show  ("LFG113_BLOCK")
				end

			end)
		L.Frames.mainFrame.Settings.topTabs ["Keywords"].btnAdd:Hide ()

		L.Frames.mainFrame.Settings.topTabs ["Keywords"].btnDefault = CreateButton (L.Frames.mainFrame.Settings.topTabs ["Keywords"], 220, -110, 80, 20, L.Locals.CurrentLocal ["btnDefault"])
		L.Frames.mainFrame.Settings.topTabs ["Keywords"].btnDefault:SetScript ("OnClick", function (self)
				if L.Frames.mainFrame.Settings.topTabs ["Keywords"].lblInstanceKey:GetText () then
					local myKeyword = L.Frames.mainFrame.Settings.topTabs ["Keywords"].lblInstanceKey:GetText ();
					ClearAllDisplayEntries ()
					LFG113InstanceKeys [myKeyword] = nil
					LFG113InstanceKeys ["h" .. myKeyword] = nil
					DisplayKeys (true)
					DisplayKeys (false)
					L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtPulldown:SetText (GetInstanceRow (L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtPulldown.key) [2])
					L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtLowerLevel:SetText (GetInstanceRow (L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtPulldown.key) [3])
					L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtHigherLevel:SetText (GetInstanceRow (L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtPulldown.key) [4])
					L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtBroadcast:SetText (GetInstanceRow (L.Frames.mainFrame.Settings.topTabs ["Keywords"].txtPulldown.key) [5])
				end
			end)
		L.Frames.mainFrame.Settings.topTabs ["Keywords"].btnDefault:Hide ()

		L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList = CreateFramecontainer (nil, L.Frames.mainFrame.Settings.topTabs ["Keywords"], 60, -130, -25, 20, "") -- 60, -130
		L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList.ScrollArea = CreateScrollArea (L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList, nil)
		L.Frames.mainFrame.Settings.topTabs ["Keywords"].frmKeywordList.BlackList = {}



		L.Frames.mainFrame.Settings.topTabs ["General"].btnShowNotes = CreateButton (L.Frames.mainFrame.Settings.topTabs ["General"], 190, -10, 150, 25, L.Locals.CurrentLocal ["btnViewNotes"])
		L.Frames.mainFrame.Settings.topTabs ["General"].btnShowNotes:SetFrameLevel (11)
		L.Frames.mainFrame.Settings.topTabs ["General"].btnShowNotes:SetScript ("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				L.Frames.updatedFrame:Show()
			end)

		L.Frames.mainFrame.Settings.topTabs ["General"].keybind = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["General"], 10, -30, "GameFontNormal", L.Locals.CurrentLocal ["lblKeybind"])
		L.Frames.mainFrame.Settings.topTabs ["General"].forceKeybind = CreateCheckbutton(L.Frames.mainFrame.Settings.topTabs ["General"], 60, -40, 10, L.Locals.CurrentLocal ["chkForce"], L.Locals.CurrentLocal ["pupForce"])
		L.Frames.mainFrame.Settings.topTabs ["General"].forceKeybind:SetScript("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Saved ["ForceKeybind"] = self:GetChecked()
				if LFG113Saved ["ForceKeybind"]  then SetBinding ("ALT-I", "LFG113_TOGGLE")
				else SetBinding ("ALT-I")
				end
			end)

		--L.Frames.mainFrame.Settings.topTabs ["General"].keyBound = CreateFrame("EditBox", nil, L.Frames.mainFrame.Settings.topTabs ["General"], "InputBoxTemplate")
		--L.Frames.mainFrame.Settings.topTabs ["General"].keyBound:SetSize (10, 20)
		--L.Frames.mainFrame.Settings.topTabs ["General"].keyBound:SetPoint ("TOPLEFT", 240, -40)
		--L.Frames.mainFrame.Settings.topTabs ["General"].keyBound:SetAutoFocus (false)
		--L.Frames.mainFrame.Settings.topTabs ["General"].keyBound:SetText ("I")
		--L.Frames.mainFrame.Settings.topTabs ["General"].keyBound:SetMaxLetters (1)
		--L.Frames.mainFrame.Settings.topTabs ["General"].keyBound:SetBlinkSpeed (0)
		--L.Frames.mainFrame.Settings.topTabs ["General"].keyBound:SetScript ("OnTextChanged", function (self, valid)
		--		print (valid)
		--	end)

		L.Frames.mainFrame.Settings.topTabs ["General"].accurate = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["General"], 10, -70, "GameFontNormal", L.Locals.CurrentLocal ["lblAccurate"])
		L.Frames.mainFrame.Settings.topTabs ["General"].accurateScan = CreateCheckbutton(L.Frames.mainFrame.Settings.topTabs ["General"], 60, -80, 10, L.Locals.CurrentLocal ["chkEnableScan"], L.Locals.CurrentLocal ["pupAccurate"])
		L.Frames.mainFrame.Settings.topTabs ["General"].accurateScan:SetScript("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Saved ["accurateScan"] = self:GetChecked()
			end)

		L.Frames.mainFrame.Settings.topTabs ["General"].lblDisableSound = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["General"], 10, -110, "GameFontNormal", L.Locals.CurrentLocal ["lblNotifications"])
		L.Frames.mainFrame.Settings.topTabs ["General"].fullGRPAudio = CreateCheckbutton(L.Frames.mainFrame.Settings.topTabs ["General"], 60, -120, 10, L.Locals.CurrentLocal ["chkFullAudio"], L.Locals.CurrentLocal ["pupFullGroup"])
		L.Frames.mainFrame.Settings.topTabs ["General"].fullGRPAudio:SetScript("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Saved ["fullGRPAudio"] = self:GetChecked()
			end)

		L.Frames.mainFrame.Settings.topTabs ["General"].chkEnableSound = CreateCheckbutton(L.Frames.mainFrame.Settings.topTabs ["General"], 60, -140, 10, L.Locals.CurrentLocal ["chkEnableSound"], L.Locals.CurrentLocal ["pupEnableSound"])
		L.Frames.mainFrame.Settings.topTabs ["General"].chkEnableSound:SetScript("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Saved ["enableSound"] = self:GetChecked()
			end)

		L.Frames.mainFrame.Settings.topTabs ["General"].chkPingAlert = CreateCheckbutton(L.Frames.mainFrame.Settings.topTabs ["General"], 60, -160, 10, L.Locals.CurrentLocal ["chkPingAlert"], L.Locals.CurrentLocal ["pupPingAlert"])
		L.Frames.mainFrame.Settings.topTabs ["General"].chkPingAlert:SetScript("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Saved ["pingAlert"] = self:GetChecked()
			end)

		L.Frames.mainFrame.Settings.topTabs ["General"].chkPopupAlert = CreateCheckbutton(L.Frames.mainFrame.Settings.topTabs ["General"], 60, -180, 10, L.Locals.CurrentLocal ["chkPopUpAlert"], L.Locals.CurrentLocal ["pupPopuAlert"])
		L.Frames.mainFrame.Settings.topTabs ["General"].chkPopupAlert:SetScript("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Saved ["popupAlert"] = self:GetChecked()
			end)


		L.Frames.mainFrame.Settings.topTabs ["General"].lblRatingsystem = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["General"], 10, -210, "GameFontNormal", "Rating System")
		L.Frames.mainFrame.Settings.topTabs ["General"].chkRatingsystem = CreateCheckbutton(L.Frames.mainFrame.Settings.topTabs ["General"], 60, -220, 10, "Enable System" , "")
		L.Frames.mainFrame.Settings.topTabs ["General"].chkRatingsystem:SetScript("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Saved ["useRatingSystem"] = self:GetChecked()
			end)


		L.Frames.mainFrame.Settings.topTabs ["General"].lblHookMenu = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["General"], 10, -250, "GameFontNormal", "Add LFG113 Submenu (Re-loading is required)")
		L.Frames.mainFrame.Settings.topTabs ["General"].chkHookMenu = CreateCheckbutton(L.Frames.mainFrame.Settings.topTabs ["General"], 60, -260, 10, "Attach submenu to character menus" , "this will give you the option to use the LFG113 submenu (using TARGET will give you an error")
		L.Frames.mainFrame.Settings.topTabs ["General"].chkHookMenu:SetScript("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Saved ["hooksecurefunc"] = self:GetChecked()
			end)

		L.Frames.mainFrame.Settings.topTabs ["General"].lblSliderLoadtime = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["General"], 10, -290, "GameFontNormal", "Delay load time")
		L.Frames.mainFrame.Settings.topTabs ["General"].sliderLoadtime = CreateFrame("Slider", "LFG113sliderLoadTime", L.Frames.mainFrame.Settings.topTabs ["General"], "OptionsSliderTemplate")
		L.Frames.mainFrame.Settings.topTabs ["General"].sliderLoadtime:SetPoint ("TOPLEFT", 60, -300)
		L.Frames.mainFrame.Settings.topTabs ["General"].sliderLoadtime:SetOrientation("HORIZONTAL")
		L.Frames.mainFrame.Settings.topTabs ["General"].sliderLoadtime:SetSize (240, 20)
		L.Frames.mainFrame.Settings.topTabs ["General"].sliderLoadtime:SetMinMaxValues(5, 180)
		L.Frames.mainFrame.Settings.topTabs ["General"].sliderLoadtime:SetValue (LFG113Saved ["addonLoadTime"])
		L.Frames.mainFrame.Settings.topTabs ["General"].sliderLoadtime:SetValueStep (1)
		L.Frames.mainFrame.Settings.topTabs ["General"].sliderLoadtime.tooltipText = L.Locals.CurrentLocal ["pupBroadcast"]
		getglobal(L.Frames.mainFrame.Settings.topTabs ["General"].sliderLoadtime:GetName() .. "Low"):SetText("5")
		getglobal(L.Frames.mainFrame.Settings.topTabs ["General"].sliderLoadtime:GetName() .. "High"):SetText("180")
		getglobal(L.Frames.mainFrame.Settings.topTabs ["General"].sliderLoadtime:GetName() .. "Text"):SetText(LFG113Saved ["addonLoadTime"] .. " Seconds")
		L.Frames.mainFrame.Settings.topTabs ["General"].sliderLoadtime:SetScript("OnValueChanged", function(self, value)
				LFG113Saved ["addonLoadTime"] = floor(value)
				getglobal(self:GetName() .. "Text"):SetText(floor(value) .. " Seconds")
			end)



		L.Frames.mainFrame.Settings.topTabs ["Display"].lblFreeMovingEye = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["Display"], 10, -30, "GameFontNormal", L.Locals.CurrentLocal ["lblFreeMovingEye"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkFreeMovingEye = CreateCheckbutton(L.Frames.mainFrame.Settings.topTabs ["Display"], 60, -40, 10, L.Locals.CurrentLocal ["chkFreeMovingEye"], L.Locals.CurrentLocal ["pupFreeMovingEye"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkFreeMovingEye:SetScript("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Saved ["freeMovingEye"] = self:GetChecked()
				if LFG113Saved ["freeMovingEye"] then
					LFG113Saved ["minimapX"], LFG113Saved ["minimapY"] = -2, 2
					L.Frames.MinimapButton:ClearAllPoints ()
					L.Frames.MinimapButton:SetPoint ("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", LFG113Saved ["minimapX"], LFG113Saved ["minimapY"])
				end
				SetMinimapHandler ()
			end)

		L.Frames.mainFrame.Settings.topTabs ["Display"].chkAlwaysShowEye = CreateCheckbutton(L.Frames.mainFrame.Settings.topTabs ["Display"], 60, -60, 10, L.Locals.CurrentLocal ["chkAlwaysShowEye"], L.Locals.CurrentLocal ["pupAlwaysShowEye"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkAlwaysShowEye:SetScript("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Saved ["alwaysShowEye"] = self:GetChecked()
				if LFG113Saved ["alwaysShowEye"] then
					L.Frames.MinimapButton:Show ()
					L.Frames.MinimapButton.tooltip = { L.Locals.CurrentLocal ["pupActiveSearch"][1], { "\n" }, L.Locals.CurrentLocal ["pupActiveSearch"][4], L.Locals.CurrentLocal ["pupActiveSearch"][5]}
				else
					L.Frames.MinimapButton:Hide ()
					L.Frames.MinimapButton.tooltip = L.Locals.CurrentLocal ["pupActiveSearch"]
				end
			end)

		L.Frames.mainFrame.Settings.topTabs ["Display"].chkDisableAutoNotification = CreateCheckbutton(L.Frames.mainFrame.Settings.topTabs ["Display"], 60, -80, 10, L.Locals.CurrentLocal ["chkDisableAutoNotification"], L.Locals.CurrentLocal ["pupDisableAutoNotification"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkDisableAutoNotification:SetScript("OnClick", function(self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Saved ["disableAutomaticBroadcast"] = self:GetChecked ()
			end)

		L.Frames.mainFrame.Settings.topTabs ["Display"].btnReset = CreateButton (L.Frames.mainFrame.Settings.topTabs ["Display"], 220, -20, 100, 20, L.Locals.CurrentLocal ["btnDefault"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].btnReset.tooltip = L.Locals.CurrentLocal ["pupResetEye"]
		L.Frames.mainFrame.Settings.topTabs ["Display"].btnReset:SetScript ("OnClick", function ()
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				L.Frames.MinimapButton:ClearAllPoints ()
				if LFG113Saved ["freeMovingEye"] then
					LFG113Saved ["minimapX"], LFG113Saved ["minimapY"] = -2, 2
					L.Frames.MinimapButton:SetPoint ("TOPLEFT", Minimap, "TOPLEFT", LFG113Saved ["minimapX"], LFG113Saved ["minimapY"])
				else
					LFG113Saved ["minimapX"], LFG113Saved ["minimapY"] = GetScreenWidth() * UIParent:GetEffectiveScale() / 2, GetScreenHeight() * UIParent:GetEffectiveScale() / 1.1
					L.Frames.MinimapButton:SetPoint ("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", LFG113Saved ["minimapX"], LFG113Saved ["minimapY"])
				end
				SetMinimapHandler ()
			end)

		L.Frames.mainFrame.Settings.topTabs ["Display"].lblCompactDesign = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["Display"], 10, -110, "GameFontNormal", "Compact Search")
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkCompactDesign = CreateCheckbutton(L.Frames.mainFrame.Settings.topTabs ["Display"], 60, -120, 10, L.Locals.CurrentLocal ["chkCompact"], L.Locals.CurrentLocal ["pupCompact"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkCompactDesign:SetScript ("OnClick", function (self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Saved ["compactDesign"] = self:GetChecked ()
			end)

		local tmpPullDownList = {}
		for key, value in pairs (L.Locals.CurrentCommLocal ["cmbLanguage"]) do
			if value [2] then tmpPullDownList [#tmpPullDownList + 1] = value [3] end
		end
		L.Frames.mainFrame.Settings.topTabs ["Display"].lblCompactDesign = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["Display"], 10, -150, "GameFontNormal", L.Locals.CurrentLocal ["lblChangeLanguage"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].Languages = CreateGeneralPullDown (L.Frames.mainFrame.Settings.topTabs ["Display"], 40, -165, 160, tmpPullDownList, function (Value)
				for key, value in pairs (L.Locals.CurrentLocal ["cmbLanguage"]) do
					if value [3] == Value then
						LFG113Saved ["LanguageUsed"] = value [1]
						L.Frames.mainFrame.Settings.topTabs ["Display"].btnReload:Show ()
					end
				end
			end, function (Value)
				for key, value in pairs (L.Locals.CurrentLocal ["cmbLanguage"]) do
					if value [3] == Value and value [1] == LFG113Saved ["LanguageUsed"] then return true end
				end
				return false
			end)
		for key, value in pairs (L.Locals.CurrentLocal ["cmbLanguage"]) do
			if value [1] == LFG113Saved ["LanguageUsed"] then UIDropDownMenu_SetText (L.Frames.mainFrame.Settings.topTabs ["Display"].Languages, value [3]) end
		end

		L.Frames.mainFrame.Settings.topTabs ["Display"].lblCompactDesign = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["Display"], 10, -195, "GameFontNormal", L.Locals.CurrentLocal ["lblCommLanguage"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].Languages = CreateGeneralPullDown (L.Frames.mainFrame.Settings.topTabs ["Display"], 40, -210, 160, tmpPullDownList, function (Value)
				for key, value in pairs (L.Locals.CurrentCommLocal ["cmbLanguage"]) do
					if value [3] == Value then SetCommumnicationLanguage (value [1]) end
				end
			end, function (Value)
				for key, value in pairs (L.Locals.CurrentCommLocal ["cmbLanguage"]) do
					if value [3] == Value and value [1] == LFG113Saved ["CommLanguageUsed"] then return true end
				end
				return false
			end)
		for key, value in pairs (L.Locals.CurrentCommLocal ["cmbLanguage"]) do
			if value [1] == LFG113Saved ["CommLanguageUsed"] then UIDropDownMenu_SetText (L.Frames.mainFrame.Settings.topTabs ["Display"].Languages, value [3]) end
		end

		L.Frames.mainFrame.Settings.topTabs ["Display"].btnReload = CreateButton (L.Frames.mainFrame.Settings.topTabs ["Display"],  242, -168, 90, 20, L.Locals.CurrentLocal ["btnReload"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].btnReload:SetScript ("OnClick", function ()
				ReloadUI ()
			end)
		L.Frames.mainFrame.Settings.topTabs ["Display"].btnReload:Hide ()

		L.Frames.mainFrame.Settings.topTabs ["Display"].lblShowNewmessage = CreateLabel (L.Frames.mainFrame.Settings.topTabs ["Display"], 10, -245, "GameFontNormal", L.Locals.CurrentLocal ["lblShowNewMessage"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkShowNewmessage = CreateCheckbutton(L.Frames.mainFrame.Settings.topTabs ["Display"], 60, -255, 10, L.Locals.CurrentLocal ["chkShowNewMessage"], L.Locals.CurrentLocal ["pupShowNewMessage"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkShowNewmessage:SetScript ("OnClick", function (self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Saved ["showNewMessage"] = self:GetChecked ()
				if (self:GetChecked ()) then
					L.Frames.mainFrame.Settings.topTabs ["Display"].chkSoundNewMessage:Show ()
					L.Frames.mainFrame.Settings.topTabs ["Display"].chkSoloNewMessage:Show ()
				else
					L.Frames.mainFrame.Settings.topTabs ["Display"].chkSoundNewMessage:Hide ()
					L.Frames.mainFrame.Settings.topTabs ["Display"].chkSoloNewMessage:Hide ()
				end
			end)
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkSoundNewMessage = CreateCheckbutton(L.Frames.mainFrame.Settings.topTabs ["Display"], 60, -275, 10, L.Locals.CurrentLocal ["chkSoundNewMessage"], L.Locals.CurrentLocal ["pupSoundNewMessage"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkSoundNewMessage:SetScript ("OnClick", function (self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Saved ["soundNewMessage"] = self:GetChecked ()
			end)
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkSoloNewMessage = CreateCheckbutton(L.Frames.mainFrame.Settings.topTabs ["Display"], 60, -295, 10, L.Locals.CurrentLocal ["chkSoloNewMessage"], L.Locals.CurrentLocal ["pupSoloNewMessage"])
		L.Frames.mainFrame.Settings.topTabs ["Display"].chkSoloNewMessage:SetScript ("OnClick", function (self)
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
				LFG113Saved ["soloNewMessage"] = self:GetChecked ()
			end)

		L.Frames.mainFrame.Results = CreateFramecontainer (nil, L.Frames.mainFrame, -1, -440, -5, 3, "Interface/Tooltips/UI-Tooltip-Background")
		L.Frames.mainFrame.Results.lblMessage = CreateLabel (L.Frames.mainFrame.Results, 10, -10, "GameFontNormal", L.Locals.CurrentLocal ["lblOutput"]  .. ":")
		L.Frames.mainFrame.Results.Message = CreateLabel (L.Frames.mainFrame.Results, 60, -10, "ChatFontNormal", "")
		L.Frames.mainFrame.Results.Message:SetJustifyH ("LEFT")
		L.Frames.mainFrame.Results.Message:SetWidth (420)

		L.Frames.frmRatings:Hide ()
		L.Frames.frmRatings:SetSize (450, 250)
		L.Frames.frmRatings:SetPoint ("CENTER")
		L.Frames.frmRatings:SetFrameLevel (21)
		DragFrame (L.Frames.frmRatings)
		L.Frames.frmRatings.title = CreateLabel (L.Frames.frmRatings, 175, -5, "GameFontNormal", "New Ratings")
		L.Frames.frmRatings.workingArea = CreateFramecontainer (nil, L.Frames.frmRatings, 0, -20, -25, 0, "Interface/Tooltips/UI-Tooltip-Background")
		L.Frames.frmRatings.scrollArea = CreateScrollArea (L.Frames.frmRatings.workingArea, "Interface/ARCHEOLOGY/ArchRare-ScimitaroftheSirocco.blp")

		SetRoleIconDisplay (false)
		HideAllPulldowns ()
		L.Frames.mainFrame.TopTab.instances:Show ()
		tinsert(UISpecialFrames, L.Frames.mainFrame:GetName())
	end
	L.Frames.mainFrame:SetScript ("OnShow", function () UpdateDisplayFrame () end)

	function ConvertRoleToNumbers (msg)
		msg = msg:lower ()
		tmpStr = ""
		if msg:find (L.Locals.CurrentLocal ["NeedAll"]:lower ()) then tmpStr = "123" end
		if msg:find (L.Locals.CurrentLocal ["Tank"]:lower ()) then tmpStr = "1" end
		if msg:find (L.Locals.CurrentLocal ["Heal"]:lower ()) or msg:find (L.Locals.CurrentLocal ["Heal"]:lower ()) then tmpStr = tmpStr .. "2" end
		if msg:find (L.Locals.CurrentLocal ["DPS"]:lower ()) then tmpStr = tmpStr .. "3" end
		return tmpStr
	end

	function FormatRecievedMessage (msg)
		msg = msg:gsub ("[%p%c%s]", " ")
		msg = msg:gsub ("[%A]", " ")
		msg = msg:gsub ("\\s+", " ")
		return " " .. msg .. " "
	end

	local myWhisperEventHandler = function(frame, event, message, auth, ...)
		if message:sub(1, 4) == "!113" then
			if event == "CHAT_MSG_WHISPER_INFORM" then return true end
			L.Variables.BlacklistClient = auth
			L.Variables.BlacklistSwapping = 1
			BlacklistSwap (message:sub(5, 5), message:sub(6))
			return true
		elseif message:sub(1, 4) == "!114" then
			if event == "CHAT_MSG_WHISPER_INFORM" then return true end
			L.Variables.RatingsClient = auth
			L.Variables.RatingsSwapping = 1
			RatingsSwap (message:sub(5, 5), message:sub(6))
			return true
		end
		return false
	end
	ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", myWhisperEventHandler)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", myWhisperEventHandler)

	L.Frames.chatFrame:RegisterEvent ("CHAT_MSG_WHISPER")
	L.Frames.chatFrame:RegisterEvent ("CHAT_MSG_CHANNEL")
	L.Frames.chatFrame:RegisterEvent ("CHAT_MSG_GUILD")
	L.Frames.chatFrame:SetScript ("OnEvent", function (self, event, msg, auth, Lang, Channel, ...)
			if L.Locals.CurrentLocal == nil then return "" end
			if msg == nil then msg = "" end
	--		if msg:len() > 200 then return end
			auth = auth:lower()
			if auth ~= nil and auth:find("-") then auth = auth:sub(1, auth:find("-") - 1) end
			if event == "CHAT_MSG_WHISPER" then
				local inGroup,l =  memberIsInGroup (auth)
				if not memberIsInGroup (auth) and LFG113Saved ["autoAcceptWhisper"] and L.Variables.TabViewing == 1 and L.Variables.broadcastAppString ~= "" and L.Variables.Player ~= auth then
					local level = msg:match ("%d+")
					if not level or tonumber (level) < 10 then level = 0 end
					local role = ConvertRoleToNumbers (msg)
					if (level ~= nil and role == "") or (level == nil and role ~= "") then
						SendChatMessage(FormatWhisperString (LFG113Saved ["whisperMissingInformation"], auth)[1], "WHISPER", "Common", auth)
						return ""
					elseif not level or role == "" then return ""
					elseif L.Variables.AddOnChatWindowMessages [auth] == nil then
						local class = ""
						for key, value in pairs (L.Variables.PlayerClass) do
							if msg:lower():find (key) then class = key end
						end
						local AddStr = "5,".. auth .. "," .. class .. "," .. level .. "," .. role .. ","
						L.Variables.AddOnChatWindowMessages [auth] = { time (), AddStr, "", false, true }
					end
				end
			else
				if auth ~= nil and msg ~= nil and (auth:find(L.Variables.Player .. "-") == nil) and (event == "CHAT_MSG_CHANNEL" or event == "CHAT_MSG_GUILD") then
					-- If not channel not in listen, then leave.. Filter out extras from Channel
					if Channel ~= nil and Channel:find("%[") then Channel = Channel:sub(1, Channel:find("%[") + 2) end
					if Channel ~= nil and Channel:find(".") then Channel = Channel:sub(Channel:find(".") + 3) end
					if Channel ~= nil and Channel:find("-") then Channel = Channel:sub(1, Channel:find("-") - 2) end
					if LFG113Saved["channels"][strlower(Channel)] and not LFG113Saved["channels"][strlower(Channel)]["Load"] then return end

					local originalStr = msg
					msg = " " .. msg:lower() .. " "

					for key, value in pairs (L.Locals.CurrentLocal ["Ignore"]) do if msg:find (key) then return "" end end
					if msg:find ("lf ") or msg:find ("looking for") then
						local index = msg:find ("lf")
						if index and index > 3 then msg = gsub (msg, "lf ", "lfg ")
						elseif not index then
							index = msg:find ("looking for")
							if index > 3 then msg = gsub (msg, "looking for", "lfg") end
						end
					end
					if msg:find ("lfg") or (msg:find("any ") and msg:find (" group")) then
						local BroadcastString = "1," .. auth .. ","
						local tmpStr, ValidInstance = "", false
						msg = FormatRecievedMessage (msg)
						local level = originalStr:match ('%d+')
						if not level or tonumber (level) < 10 then level = 0 end
						for key, value in pairs (L.Variables.PlayerClass) do
							if msg:lower():find (" " .. key .. " ") then tmpStr = key end
						end
						BroadcastString = BroadcastString .. level .. "," .. tmpStr
						tmpStr, fullTmpStr = "", ""
						for key, value in pairs (L.Locals.CurrentLocal ["PulldownInstance"]) do
							for innerKey, innerValue in pairs (value [7]) do
								if msg:find (innerKey) then
									local Heroic = (msg:find(" heroic ") or msg:find(" hero ") or msg:find(" hc ") or msg:find (" h ")) and (L.Locals.CurrentLocal ["PulldownInstance"]["h" .. key] ~= nil)
									if value [8] and value [8] ~= "" then ValidInstance, fullTmpStr = true, fullTmpStr .. (fullTmpStr ~= "" and "!" or "") .. value [8] break
									else ValidInstance, fullTmpStr = true, fullTmpStr .. (fullTmpStr ~= "" and "!" or "") .. "1:" .. (Heroic and "h" or "") .. key break
									end
								end
							end
						end
						for key, value in pairs (L.Locals.CurrentLocal ["PulldownSecondChance"]) do
							for innerKey, innerValue in pairs (value [7]) do
								if msg:find (innerKey) and not fullTmpStr:find (strtrim(innerKey)) then ValidInstance, fullTmpStr = true, fullTmpStr .. (fullTmpStr ~= "" and "!" or "") .. value [8] break end
							end
						end
						for key, value in pairs (L.Locals.CurrentLocal ["PulldownRaids"]) do
							for innerKey, innerValue in pairs (value [7]) do
								if msg:find (innerKey) then ValidInstance, fullTmpStr = true, fullTmpStr .. (fullTmpStr ~= "" and "!" or "") .. "2:" .. key break end
							end
						end
						if originalStr:find ("%(") and originalStr:find ("%[") then --local msg = "LFM [[70]] Deathblow to the Legion (10409)]"
							local tmpQuestID = originalStr:match ("%((%d+)%)")
							if tmpQuestID then
								local QuestId = tonumber (tmpQuestID)
								if QuestId and L.Variables.Quests [QuestId] then ValidInstance, fullTmpStr = true, fullTmpStr .. (fullTmpStr ~= "" and "!" or "") .. "3:" .. QuestId	end
							end
						end
						for key, value in pairs (L.Locals.CurrentLocal ["PulldownPVP"]) do
							for innerKey, innerValue in pairs (value [7]) do
								if msg:find (innerKey) then ValidInstance, fullTmpStr = true, fullTmpStr .. (fullTmpStr ~= "" and "!" or "") .. "4:" .. key break end
							end
						end
						if ValidInstance then
							BroadcastString = (BroadcastString .. "," .. fullTmpStr .. "," .. ConvertRoleToNumbers (msg)):lower() .. ","
							msg = L.Functions.Comms.EncodeString (strtrim (originalStr))
							L.Variables.AddOnChatWindowMessages [auth] = { time (), BroadcastString, msg, false, false }
						end
					elseif msg:find ("lfm ") or msg:find ("lf ") or msg:find ("lf1") or msg:find ("lf2") or msg:find ("lf3")  or msg:find ("lf4") or msg:find ("need ") or msg:find ("looking for a ") then
						local BroadcastString = "2," .. auth
						local tmpStr, ValidInstance, NumberNeed = "", false, 0
						msg = msg:lower()
						NumberNeed = (msg:find ("lf1") or msg:find ("lf 1m") or msg:find ("lf 1 ")) and 1 or ((msg:find ("lf2") or msg:find ("lf 2m") or msg:find ("lf 2 ")) and 2 or ((msg:find ("lf3") or msg:find ("lf 3m") or msg:find ("lf 3 ")) and 3 or ((msg:find ("lf4") or msg:find ("lf 4m") or msg:find ("lf 4 ")) and 4 or 0)))
						msg = FormatRecievedMessage (msg)
						tmpStr, fullTmpStr = "", ""
						for key, value in pairs (L.Locals.CurrentLocal ["PulldownInstance"]) do
							if LFG113InstanceKeys [key] then value = LFG113InstanceKeys [key] end
							for innerKey, innerValue in pairs (value [7]) do
								if msg:find (innerKey) then
									local Heroic = (msg:find(" heroic ") or msg:find(" hero ") or msg:find(" hc ") or msg:find (" h ")) and (L.Locals.CurrentLocal ["PulldownInstance"]["h" .. key] ~= nil)
									if value [8] and value [8] ~= "" then ValidInstance, fullTmpStr = 1, fullTmpStr .. (fullTmpStr ~= "" and "!" or "") .. value [8] break
									else ValidInstance, fullTmpStr = true, fullTmpStr .. (fullTmpStr ~= "" and "!" or "") .. "1:" .. (Heroic and "h" or "") .. key break
									end
								end
							end
						end
						for key, value in pairs (L.Locals.CurrentLocal ["PulldownSecondChance"]) do
							if LFG113InstanceKeys [key] then value = LFG113InstanceKeys [key] end
							for innerKey, innerValue in pairs (value [7]) do
								if msg:find (innerKey) and not fullTmpStr:find (strtrim(innerKey)) then ValidInstance, fullTmpStr = true, fullTmpStr .. (fullTmpStr ~= "" and "!" or "") .. value [8] break end
							end
						end
						for key, value in pairs (L.Locals.CurrentLocal ["PulldownRaids"]) do
							if LFG113InstanceKeys [key] then value = LFG113InstanceKeys [key] end
							for innerKey, innerValue in pairs (value [7]) do
								if msg:find (innerKey) then ValidInstance, fullTmpStr = true, fullTmpStr .. (fullTmpStr ~= "" and "!" or "") .. "2:" .. key break end
							end
						end
						if originalStr:find ("%(") and originalStr:find ("%[") then --local msg = "LFM [[70]] Deathblow to the Legion (10409)]"
							local tmpQuestID = originalStr:match ("%((%d+)%)")
							if tmpQuestID then
								local QuestId = tonumber (tmpQuestID)
								if QuestId and L.Variables.Quests [QuestId] then ValidInstance, fullTmpStr = true, fullTmpStr .. (fullTmpStr ~= "" and "!" or "") .. "3:" .. QuestId	end
							end
						end
						for key, value in pairs (L.Locals.CurrentLocal ["PulldownPVP"]) do
							if LFG113InstanceKeys [key] then value = LFG113InstanceKeys [key] end
							for innerKey, innerValue in pairs (value [7]) do
								if msg:find (innerKey) then ValidInstance, fullTmpStr = true, fullTmpStr .. (fullTmpStr ~= "" and "!" or "") .. "4:" .. key break end
							end
						end

						if ValidInstance then
							BroadcastString = (BroadcastString .. "," .. fullTmpStr .. "," .. (NumberNeed > 0 and NumberNeed or "0") .. "," .. ConvertRoleToNumbers(msg)):lower() .. ","
							msg = L.Functions.Comms.EncodeString (strtrim (originalStr))
							L.Variables.AddOnChatWindowMessages [auth] = { time (), BroadcastString, msg, false, false }
						end
					end
				end
			end
		end)


				--LFG113Ratings ["Joined"]["sophalacia"] = {
		--	["Race"]		= englishRace,
		--	["Class"]		= englishClass:lower(),
		--	["Sex"]			= UnitSex (key),
		--	["Level"]		= UnitLevel (key),
		--	["Rating"]		= 0,
		--	["Instances"]	= {},
		--	["Comment"]		= {},
		--}

		--LFG113Ratings["Ratings"]["sophalacia"] = {
		--	["Class"]	= "PRIEST",
		--	["Race"]	= "Draenei",
		--	["Sex"]		= 2,
		--	["Rating"]	= 0,
		--	["Instances"] = {
		--		["07/02/21 21:37"] = {
		--			["Instances"] = { ["ShadowLabs"] = true, },
		--			["Comment"] = "",
		--			["Rating"] = 4,
		--			["Level"] = 64,
		--		},
		--	}
		--},



	local function GetRatingLine (parent, person, player, yOffset, canEdit)
		local function SetStars (parent, StarNumber)
			parent.Star1.image.texture:SetTexCoord (StarNumber < 1 and .25 or .375, StarNumber < 1 and .375 or .5, .5, .75)
			parent.Star2.image.texture:SetTexCoord (StarNumber < 2 and .25 or .375, StarNumber < 2 and .375 or .5, .5, .75)
			parent.Star3.image.texture:SetTexCoord (StarNumber < 3 and .25 or .375, StarNumber < 3 and .375 or .5, .5, .75)
			parent.Star4.image.texture:SetTexCoord (StarNumber < 4 and .25 or .375, StarNumber < 4 and .375 or .5, .5, .75)
			parent.Star5.image.texture:SetTexCoord (StarNumber < 5 and .25 or .375, StarNumber < 5 and .375 or .5, .5, .75)
			parent:SetBackdropColor (1, 1, 1, .5)
			player["Rating"] = StarNumber
		end

		local function CreateStarLine (parent, _x, _clickNumber)
			local Line = CreateFrame ("Button", nil, parent)
			Line:SetPoint ("TOPLEFT", _x, -10)
			Line:SetSize (16, 16)
			Line.image = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\Interface.tga", Line, 0, 0, 20, 20)
			Line.image.texture:SetTexCoord (.25, .375, .5, .75)
			Line:SetScript ("OnEnter", function (self) if canEdit then SetStars (parent, _clickNumber) end end)
			Line:SetScript ("OnLeave", function (self) if canEdit then SetStars (parent, parent.Currentstar) end end)
			Line:SetScript ("OnClick", function (self)
					if canEdit then
						parent.Currentstar = _clickNumber
						player["Rating"] = _clickNumber
						if LFG113Ratings ["Ratings"][person] == nil then
							LFG113Ratings ["Ratings"][person] = {
								["Class"] = player["Class"],
								["Race"] = player["Race"],
								["Sex"] = player["Sex"],
								["Rating"] = player["Rating"],
								["Instances"] = { [LFG113Ratings.RatingTimeStamp] = { ["Instances"] = player["Instances"], ["Comment"] = player["Comment"], ["Rating"] = _clickNumber, ["Level"] = player["Level"], }, },
							}
						else LFG113Ratings ["Ratings"][person]["Instances"][LFG113Ratings.RatingTimeStamp] =  { ["Instances"] = player["Instances"], ["Comment"] = player["Comment"], ["Rating"] = player["Rating"], ["Level"] = player["Level"], }
						end
						local myRun, tmpRating, numInstance = LFG113Ratings ["Ratings"][person], 0, 0
						for key, value in pairs (player["Instances"]) do myRun["Instances"][LFG113Ratings.RatingTimeStamp]["Instances"][key] = true end
						for key, value in pairs (myRun["Instances"]) do tmpRating = value["Rating"] + tmpRating numInstance = numInstance + 1 end
						myRun["Rating"] = math.floor ((tmpRating / numInstance) + 0.5)
						if LFG113Ratings ["Joined"][person] then LFG113Ratings ["Joined"][person] = nil end
					end
				end)
			return Line
		end

		local myRatingFrame = CreateFrame ("Frame", nil, parent, BackdropTemplateMixin and "BackdropTemplate")
		myRatingFrame.Currentstar = player ["Rating"] ~= nil and player ["Rating"] or 0
		myRatingFrame:SetSize (410, 40)
		myRatingFrame:SetPoint ("TOPLEFT", 0, -yOffset)
		myRatingFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 }})
		local SexOffset = player["Sex"] == 3 and .5 or 0
		myRatingFrame.race = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\RaceClass.tga", myRatingFrame, 10, -10, 20, 20)
		myRatingFrame.race.texture:SetTexCoord (L.Variables.PlayerRace [player["Race"]]["map"]["sx"], L.Variables.PlayerRace [player["Race"]]["map"]["ex"], L.Variables.PlayerRace [player["Race"]]["map"]["sy"] + SexOffset, L.Variables.PlayerRace [player["Race"]]["map"]["ey"] + SexOffset)
		playersClass = player["Class"]--:lower()
		myRatingFrame.class = CreateTexture ("Interface\\AddOns\\LFG113\\textures\\RaceClass.tga", myRatingFrame, 34, -10, 20, 20)
		myRatingFrame.class.texture:SetTexCoord (L.Variables.PlayerClass [playersClass]["map"]["sx"], L.Variables.PlayerClass [playersClass]["map"]["ex"], L.Variables.PlayerClass [playersClass]["map"]["sy"], L.Variables.PlayerClass [playersClass]["map"]["ey"])
		myRatingFrame.lblPerson = CreateLabel (myRatingFrame, 58, -13, "GameFontHighlightLarge", person) -- ChatFontNormal
		myRatingFrame.Star1 = CreateStarLine (myRatingFrame, 210, 1)
		myRatingFrame.Star2 = CreateStarLine (myRatingFrame, 230, 2)
		myRatingFrame.Star3 = CreateStarLine (myRatingFrame, 250, 3)
		myRatingFrame.Star4 = CreateStarLine (myRatingFrame, 270, 4)
		myRatingFrame.Star5 = CreateStarLine (myRatingFrame, 290, 5)
		if player ["Rating"] ~= nil then SetStars (myRatingFrame, player ["Rating"]) end
		myRatingFrame:SetBackdropColor(1, 1, 1, 0)

		myRatingFrame.Comment = CreateButton (myRatingFrame, 320, -10, 80, 20, "Comment")
		myRatingFrame.Comment:SetScript ("OnClick", function (self)
				if canEdit then
					L.Frames.mainFrame.TopTab.customMainFrame:SetParent (parent)
					L.Frames.mainFrame.TopTab.customMainFrame:SetPoint ("TOPLEFT", 10, -40)
					L.Frames.mainFrame.TopTab.customMainFrame:SetFrameLevel (100)
					L.Frames.mainFrame.TopTab.customMainFrame:Show ()
					L.Frames.mainFrame.TopTab.customMainFrameText:SetFocus ()
					L.Frames.mainFrame.TopTab.customMainFrameText:SetText (player["Comment"] ~= nil and player["Comment"] or "")
					L.Frames.mainFrame.TopTab.customMainFrameText.ReturnText = function (text)
						player["Comment"] = text
						if LFG113Ratings ["Ratings"][person] == nil then
							LFG113Ratings ["Ratings"][person] = {
								["Class"] = player["Class"],
								["Race"] = player["Race"],
								["Sex"] = player["Sex"],
								["Rating"] = player["Rating"],
								["Instances"] = { [LFG113Ratings.RatingTimeStamp] = { ["Instances"] = player["Instances"], ["Comment"] = player["Comment"], ["Rating"] = _clickNumber, ["Level"] = player["Level"], }, },
							}
						else LFG113Ratings ["Ratings"][person]["Instances"][LFG113Ratings.RatingTimeStamp] =  { ["Instances"] = player["Instances"], ["Comment"] = player["Comment"], ["Rating"] = player["Rating"], ["Level"] = player["Level"], }
						end
						if LFG113Ratings ["Joined"][person] then LFG113Ratings ["Joined"][person] = nil end
					end
				end
			end)
		if canEdit then myRatingFrame.Comment:Show ()
		else myRatingFrame.Comment:Hide ()
		end

		myRatingFrame.Comment:SetScript ("OnHide", function (self) if canEdit then LFG113Ratings ["Joined"] = {} LFG113Ratings.RatingTimeStamp = nil end end)
		myRatingFrame:SetScript ("OnEnter", function (self)	myRatingFrame:SetBackdropColor (1, 1, 1, .5) end)
		myRatingFrame:SetScript ("OnLeave", function (self)	myRatingFrame:SetBackdropColor(1, 1, 1, 0) end)
		return myRatingFrame
	end

	local function ShowRatingsPopup ()
		local yHeight = 0

		if L.Frames.frmRatings.Line == nil then L.Frames.frmRatings.Line = {} end
		for key, value in pairs (L.Frames.frmRatings.Line) do
			value:Hide()
			L.Frames.frmRatings.Line[key] = nil
		end
		L.Frames.frmRatings.Line = {}
		if LFG113Ratings.RatingTimeStamp == nil then LFG113Ratings.RatingTimeStamp = date("%m/%d/%y %H:%M") end
		for key, value in pairs (LFG113Ratings ["Joined"]) do
			if next (value["Instances"]) ~= nil then
				L.Frames.frmRatings.Line [#L.Frames.frmRatings.Line + 1] = GetRatingLine (L.Frames.frmRatings.scrollArea.content, key:lower(), value, yHeight, true)
				yHeight = yHeight + 40
			end
		end
		L.Frames.frmRatings.workingArea.vScrollbar:SetMinMaxValues (1, math.max (1, math.abs (yHeight) - L.Frames.frmRatings.workingArea:GetHeight () + 25))
		if yHeight > 0 then
			L.Frames.frmRatings.title:SetText ("New Ratings")
			L.Frames.frmRatings:Show()
		end
	end

	function getGroupList ()
		local plist={}
		if IsInRaid() then
			for i=1,40 do
				if (UnitName('raid'..i)) then
					plist [UnitName('raid'..i)] = true
				end
			end
		elseif IsInGroup() then
			for i=1,4 do
				if (UnitName('party'..i)) then
					plist [UnitName('party'..i)] = true
				end
			end
		end
		return plist
	end



		--["sophalacia"] = {
		--	["Class"]	= "PRIEST",
		--	["Race"]	= "Draenei",
		--	["Rating"]	= 0,
		--	["Instances"] = {
		--		["07/02/21 21:37"] = {
		--			["Instances"] = { "ShadowLabs", },
		--			["Comment"] = "",
		--			["Rating"] = 4,
		--			["Level"] = 64,
		--		},
		--	}
		--},

	local function RecordPlayerInformation ()
		local unknownExists = false
		local currentGroupList = getGroupList ()
		local InstanceName = GetInstanceInfo()
		local inInstance = IsInInstance ()
		local isPopup = false
		local yHeight = 0

		L.Frames.frmRatings:Hide()
		if L.Frames.frmRatings.Line == nil then L.Frames.frmRatings.Line = {} end
		for frmKey, frmValue in pairs (L.Frames.frmRatings.Line) do
			frmValue:Hide()
			L.Frames.frmRatings.Line[frmKey] = nil
		end
		L.Frames.frmRatings.Line = {}

		local isNew = false
		for key, value in pairs (currentGroupList) do isNew = isNew or (LFG113Ratings ["Joined"][key] == nil) end
		for key, value in pairs (currentGroupList) do
			if key == "Unknown" or UnitLevel (key) == 0 or UnitSex (key) == 1 then unknownExists = true
			else
				if LFG113Ratings ["Joined"][key] == nil then
					isNew = true
					local localizedClass, englishClass, indexClass = UnitClass(key)
					local localizedRace, englishRace = UnitRace(key)
					LFG113Ratings ["Joined"][key] = {
						["Race"]		= englishRace,
						["Class"]		= englishClass:lower(),
						["Sex"]			= UnitSex (key),
						["Level"]		= UnitLevel (key),
						["Rating"]		= 0,
						["Instances"]	= {},
						["Comment"]		= "",
					}
				end
				if inInstance then LFG113Ratings ["Joined"][key]["Instances"][InstanceName] = true end
				if isNew and L.Frames.frmRatings.scrollArea and LFG113Ratings ["Ratings"][key:lower()] then
					isPopup = true
					L.Frames.frmRatings.Line [#L.Frames.frmRatings.Line + 1] = GetRatingLine (L.Frames.frmRatings.scrollArea.content, key:lower(), LFG113Ratings ["Ratings"][key:lower()], yHeight, false)
					yHeight = yHeight + 40
				end
			end
		end
		if  L.Frames.frmRatings.workingArea and isPopup and yHeight > 0 then
			L.Frames.frmRatings.workingArea.vScrollbar:SetMinMaxValues (1, math.max (1, math.abs (yHeight) - L.Frames.frmRatings.workingArea:GetHeight () + 25))
			L.Frames.frmRatings.title:SetText ("Existing Ratings")
			L.Frames.frmRatings:Show()
		end
		if unknownExists then C_Timer.After (5, RecordPlayerInformation) end
	end

	local function LoadGlobals ()
		L.Variables.Major = strsub(GetBuildInfo(), 1, 2)
		L.Variables.reporters = {}
		if not LFG113Saved then LFG113Saved = {} end
		if not LFG113Searches then LFG113Searches = {} end
		if not LFG113BlackList then LFG113BlackList = {} end
		if not LFG113Ratings then LFG113Ratings = { ["Ratings"] = {}, ["Joined"] = {} } end
		if not LFG113Premades then LFG113Premades = {} end
		if not LFG113InstanceKeys then LFG113InstanceKeys = {} end

		if LFG113Saved ["LanguageUsed"] ~= nil then SetInterfaceLanguage (LFG113Saved ["LanguageUsed"])
		elseif L.Locals [GetLocale ()] then SetInterfaceLanguage (L.Locals ["enUS"]["cmbLanguage"][GetLocale ()][1])
		else SetInterfaceLanguage (4)
		end
		if LFG113Saved ["CommLanguageUsed"] ~= nil then SetCommumnicationLanguage (LFG113Saved ["CommLanguageUsed"])
		elseif L.Locals [GetLocale ()] then SetCommumnicationLanguage (L.Locals ["enUS"]["cmbLanguage"][GetLocale ()][1])
		else SetCommumnicationLanguage (4)
		end
		if LFG113Saved ["useRatingSystem"] == nil then LFG113Saved ["useRatingSystem"] = false end
		if LFG113Saved ["soloNewMessage"] == nil then LFG113Saved ["soloNewMessage"] = false end
		if LFG113Saved ["soundNewMessage"] == nil then LFG113Saved ["soundNewMessage"] = false end
		if LFG113Saved ["showNewMessage"] == nil then LFG113Saved ["showNewMessage"] = false end
		if LFG113Saved ["enableChannelModification"] == nil then LFG113Saved ["enableChannelModification"] = false end
		if LFG113Saved ["addonLoadTime"] == nil then LFG113Saved ["addonLoadTime"] = 10 end
		if LFG113Saved ["hooksecurefunc"] == nil then LFG113Saved ["hooksecurefunc"] = true end
		if LFG113Saved ["channels"] == nil then LFG113Saved ["channels"] = {} end
		if LFG113Saved ["disableAutomaticBroadcast"] == nil then LFG113Saved ["disableAutomaticBroadcast"] = false end
		if LFG113Saved ["compactDesign"] == nil then LFG113Saved ["compactDesign"] = false end
		if LFG113Saved ["alwaysShowEye"] == nil then LFG113Saved ["alwaysShowEye"] = false end
		if LFG113Saved ["ForceKeybind"] == nil then LFG113Saved ["ForceKeybind"] = false end
		if LFG113Saved ["accurateScan"] == nil then LFG113Saved ["accurateScan"] = false end
		if LFG113Saved ["autoAcceptWhisper"] == nil then LFG113Saved ["autoAcceptWhisper"] = true end
		if LFG113Saved ["fullGRPAudio"] == nil then LFG113Saved ["fullGRPAudio"] = true end
		if LFG113Saved ["enableSound"] == nil then LFG113Saved ["enableSound"] = true end
		if LFG113Saved ["popupAlert"] == nil then LFG113Saved ["popupAlert"] = false end
		if LFG113Saved ["pingAlert"] == nil then LFG113Saved ["pingAlert"] = true end
		if LFG113Saved ["sliderTimer"] == nil then LFG113Saved ["sliderTimer"] = 60 end
		if LFG113Saved ["sliderTimeToLive"] == nil then LFG113Saved ["sliderTimeToLive"] = 120 end
		if LFG113Saved ["freeMovingEye"] == nil then LFG113Saved ["freeMovingEye"] = true end
		if LFG113Saved ["whisperDecline"] == nil then LFG113Saved ["whisperDecline"] = L.Locals.CurrentCommLocal ["txtDefaultWhispers"]["Decline"] end
		if LFG113Saved ["whisperAccept"] == nil then LFG113Saved ["whisperAccept"] = L.Locals.CurrentCommLocal ["txtDefaultWhispers"]["Accept"] end
		if LFG113Saved ["whisperJoin"] == nil then LFG113Saved ["whisperJoin"] = L.Locals.CurrentCommLocal ["txtDefaultWhispers"]["Join"] end
		if LFG113Saved ["whisperInvite"] == nil then LFG113Saved ["whisperInvite"] = L.Locals.CurrentCommLocal ["txtDefaultWhispers"]["Invite"] end
		if LFG113Saved ["whisperGuildInvite"] == nil then LFG113Saved ["whisperGuildInvite"] = L.Locals.CurrentCommLocal ["txtDefaultWhispers"]["Guild"] end
		if LFG113Saved ["whisperMissingInformation"] == nil then LFG113Saved ["whisperMissingInformation"] = L.Locals.CurrentCommLocal ["txtDefaultWhispers"]["Missing"] end
		if LFG113Saved ["LFMFormat"] == nil then LFG113Saved ["LFMFormat"] = L.Locals.CurrentCommLocal ["txtDefaultSearch"]["LFM"] end
		if LFG113Saved ["LFGFormat"] == nil then LFG113Saved ["LFGFormat"] = L.Locals.CurrentCommLocal ["txtDefaultSearch"]["LFG"] end
	end

	local function LoadChannels (specificChannel)
		if specificChannel ~= nil then
			if LFG113Saved["channels"][strlower(specificChannel)] ~= nil then
				SetUpChannel (specificChannel, { ["Pass"] = LFG113Saved["channels"][strlower(specificChannel)]["Pass"], ["Load"] = LFG113Saved["channels"][strlower(specificChannel)]["Load"], ["Broadcast"] = LFG113Saved["channels"][strlower(specificChannel)]["Broadcast"] })
			end
		else
			L.Variables.ChannelsUsed = {}
			local i
			for i = 1, 100 do
				local _, cName = GetChannelName(i)
				if cName ~= nil then
					if cName and cName:match("LFG113") then LeaveChannelByName (cName) end
					if cName and cName:match("Trade") then SetUpChannel ("trade", { ["WithCaps"] = "Trade", ["Pass"] = nil, ["Load"] = false, ["Broadcast"] = false, ["exists"] = true })
					elseif cName and cName:match("General") then SetUpChannel ("general", { ["WithCaps"] = "General", ["Pass"] = nil, ["Load"] = false, ["Broadcast"] = false, ["exists"] = true })
					elseif cName and cName:match("LocalDefense") then SetUpChannel ("localdefense", { ["WithCaps"] = "LocalDefense", ["Pass"] = nil, ["Load"] = false, ["Broadcast"] = false, ["exists"] = true })
					elseif cName and cName:match("WorldDefense") then SetUpChannel ("worlddefense", { ["WithCaps"] = "WorldDefense", ["Pass"] = nil, ["Load"] = false, ["Broadcast"] = false, ["exists"] = true })
					elseif cName and cName:match("LookingForGroup") then SetUpChannel ("lookingforgroup", { ["WithCaps"] = "LookingForGroup", ["Pass"] = nil, ["Load"] = false, ["Broadcast"] = false, ["exists"] = true })
					elseif cName and cName:match("guildrecruitment") then SetUpChannel ("guildrecruitment", { ["WithCaps"] = "GuildRecruitment", ["Pass"] = nil, ["Load"] = false, ["Broadcast"] = false, ["exists"] = true })
					else SetUpChannel (strlower(cName), { ["WithCaps"] = cName, ["Pass"] = nil, ["Load"] = false, ["Broadcast"] = false, ["exists"] = true })
					end
				end
			end
			--if TESTCHANNEL then L.Variables.BroadCastChannel = "LFG113TEST" end
			for key, value in pairs (LFG113Saved ["channels"]) do SetUpChannel (value ["WithCaps"], { ["WithCaps"] = value ["WithCaps"], ["Pass"] = value ["Pass"], ["Load"] = value ["Load"], ["Broadcast"] = value ["Broadcast"] }) end
		end
	end

	L.Variables.login = true
	L.Frames.rosterFrame:RegisterEvent ("PLAYER_ENTERING_WORLD")
	L.Frames.rosterFrame:RegisterEvent ("PLAYER_LOGIN")
	L.Frames.rosterFrame:RegisterEvent ("GROUP_ROSTER_UPDATE")
	L.Frames.rosterFrame:RegisterEvent ("PLAYER_LOGOUT")
	L.Frames.rosterFrame:SetScript ("OnEvent", function (self, event, arg1, arg2, ...)
			if L.Variables.login and event == "PLAYER_LOGIN" then
				L.Variables.login = nil
				LoadGlobals ()
				local Broadcaster = C_Timer.After (LFG113Saved ["addonLoadTime"], function ()
					L.Frames.rosterFrame:UnregisterEvent("PLAYER_LOGIN")
					guildName, guildRankName, guildRankIndex = GetGuildInfo("player")
					L.Variables.guildName = (guildName or ""):lower()

					for key, value in pairs (LFG113BlackList) do
						for innerKey, innerValue in pairs (value) do
							local thisDate = { strsplit ("/", value[innerKey]["date"]) }
							local daysfrom = difftime(time(), time{year = tonumber ("20" .. thisDate[1]), month = tonumber (thisDate[2]), day = tonumber (thisDate[3])}) / (24 * 60 * 60) -- seconds in a day
							local expired = math.floor(daysfrom) - 30
							if  expired > 0 then value [innerKey] = nil
							else
								if L.Variables.reporters [innerKey] == nil then L.Variables.reporters [innerKey] = { ["count"] = 0, ["dates"] = {} } end
								if L.Variables.Player == innerKey then
									if LFG113BlackList [key][innerKey]["personal"] == "n" then L.Variables.reporters [innerKey]["count"] = L.Variables.reporters [innerKey]["count"] + 1 end
								else L.Variables.reporters [innerKey]["count"] = L.Variables.reporters [innerKey]["count"] + 1
								end
								L.Variables.reporters [innerKey][key] = LFG113BlackList [key][innerKey]
							end
						end
						if not next (LFG113BlackList [key]) then LFG113BlackList [key] = nil end
					end

					LoadChannels  (nil)
					CreateMainDisplay ()
					ResetAllPulldowns ()
					L.Variables.TabViewing = 1
					ClearAllDisplayEntries ()
					UpdateDisplayFrame ()

					L.Frames.rosterFrame.tmrEyeMovement = C_Timer.NewTicker (.1, MovingEyeAnimation)
					L.Frames.rosterFrame.tmrTableUpdate = C_Timer.NewTicker (LFG113Saved ["accurateScan"] and 1 or 5, function ()
							local CurrentTimeStamp = time ()
							for key, value in pairs (L.Variables.AddOnChatWindowMessages) do
								if (value[1] + LFG113Saved ["sliderTimeToLive"]) < CurrentTimeStamp then L.Variables.AddOnChatWindowMessages[key] = nil end
							end
							TableUpdate ()
							NewUserAlert ()
						end)

					--print (not GetBindingByKey("ALT-I"))
					--print (LFG113Saved ["ForceKeybind"] )
					--print (not GetBindingByKey("ALT-I") or LFG113Saved ["ForceKeybind"])
					if LFG113Saved ["ForceKeybind"] then SetBinding ("ALT-I", "LFG113_TOGGLE") end

					if not (UnitIsGroupLeader ("player") or GetNumGroupMembers() == 0) then	UpdateDisplayFrame () end
					if LFG113Saved ["useRatingSystem"] then RecordPlayerInformation() end

					L.Frames.MinimapButton:Load ()
					if not LFG113Saved ["alwaysShowEye"] then L.Frames.MinimapButton:Hide ()
					else L.Frames.MinimapButton.tooltip = { L.Locals.CurrentLocal ["pupActiveSearch"][1], { "\n" }, L.Locals.CurrentLocal ["pupActiveSearch"][4], L.Locals.CurrentLocal ["pupActiveSearch"][5]}
					end

					local DisplayReady = L.Locals.CurrentLocal ["LanguageUsed"] .. " " .. L.Locals.CurrentLocal ["lblLanguage"]
					if L.Locals.CurrentLocal ["TranslatedBy"] then DisplayReady = DisplayReady .. " " .. L.Locals.CurrentLocal ["TranslatedBy"] end
					ChatFrame1:AddMessage (L.Locals.CurrentLocal ["txtLoaded"] .. " " .. L.Variables.version, 0, 1, 1)
					ChatFrame1:AddMessage (DisplayReady, 0, 1, 1)

					-- WOW removed UnitPopupButtons in WOTLK Classic?
					--if LFG113Saved ["hooksecurefunc"] then
					--	UnitPopupButtons["LFG113_ADD_TO"] = { text = "LFG113", distIndex = 0, nested = 1 }
					--	UnitPopupButtons["ADD_TO_PREME"] = { text = L.Locals.CurrentLocal ["txtAddToPremade"], distIndex = 0 }
					--	UnitPopupButtons["ADD_TO_BLACKLIST"] = { text = L.Locals.CurrentLocal ["txtAddToBlackList"], distIndex = 0 }
					--	UnitPopupButtons["SHARE_BLACKLIST"] = { text = L.Locals.CurrentLocal ["txtShareBlackList"], distIndex = 0 }
					--	UnitPopupButtons["SHARE_RATING"] = { text = L.Locals.CurrentLocal ["txtShareRating"], distIndex = 0 }
					--	table.insert (UnitPopupMenus["FRIEND"], #UnitPopupMenus["FRIEND"]-1, "LFG113_ADD_TO")
					--	table.insert (UnitPopupMenus["PARTY"], #UnitPopupMenus["PARTY"]-1, "LFG113_ADD_TO")
					--	table.insert (UnitPopupMenus["PLAYER"], #UnitPopupMenus["PLAYER"]-1, "LFG113_ADD_TO")
					--	table.insert (UnitPopupMenus["RAID"], #UnitPopupMenus["RAID"]-1, "LFG113_ADD_TO")
					--	UnitPopupMenus ["LFG113_ADD_TO"] = { "ADD_TO_PREME", "ADD_TO_BLACKLIST", "SHARE_BLACKLIST", "SHARE_RATING"}
					--	hooksecurefunc("UnitPopup_OnClick", MySubMenu_Setup) --UnitPopup_HideButtons
					--end
				end)
			elseif event == "GROUP_ROSTER_UPDATE"  then
				if L.Variables.GroupRosterSecondFire == nil then L.Variables.GroupRosterSecondFire = true
				else
					L.Variables.GroupRosterSecondFire = nil
					local NumGroupMembers = GetNumGroupMembers ()
					if LFG113Saved ["useRatingSystem"] then
						if NumGroupMembers > 0  then RecordPlayerInformation ()
						else
							for key, value in pairs (LFG113Ratings ["Joined"]) do
								if next (value["Instances"]) == nil then LFG113Ratings ["Joined"][key] = nil end
							end
							if next(LFG113Ratings ["Joined"]) then ShowRatingsPopup ()
							else LFG113Ratings["RatingTimeStamp"] = nil
							end
						end
					end

					if L.Variables.broadcastAppString ~= "" then -- Check if we should be broadcasting
						if UnitIsGroupLeader("player") or NumGroupMembers == 0 then
						else L.Frames.mainFrame.TopTab.btnSearch:GetScript ("OnClick")(L.Frames.mainFrame.TopTab.btnSearch)
						end
					end
					if UnitIsGroupLeader("player") then
						if L.Variables.LoadedPremade and LFG113Premades [L.Variables.LoadedPremade [2]]["isRaid"] then ConvertToRaid () end
						local maxCount = 40
						for key, value in pairs (L.Variables.CurrentSearch) do
							if maxCount > value [2][1] then maxCount = value [2][1] end
						end
						if tonumber(NumGroupMembers) >= tonumber(maxCount) and L.Variables.broadcastAppString ~= "" then
							if LFG113Saved ["enableSound"] and LFG113Saved ["fullGRPAudio"] then PlaySound(SOUNDKIT.IG_QUEST_CANCEL) end
							L.Frames.mainFrame.TopTab.btnSearch:GetScript ("OnClick")(L.Frames.mainFrame.TopTab.btnSearch)
						end
					elseif NumGroupMembers > 0 and L.Variables.TabViewing == 2 then
						L.Frames.mainFrame.LeftTab.LFGButton.bottomMouseover:Hide ()
						L.Frames.mainFrame.LeftTab.LFGButton.topMouseover:Hide ()
						L.Frames.mainFrame.LeftTab.LFGButton.topSelected:Hide ()
						L.Frames.mainFrame.LeftTab.LFGButton.bottomSelected:Hide ()
						L.Frames.mainFrame.LeftTab.LFMButton.button:GetScript ("OnClick")(L.Frames.mainFrame.LeftTab.LFMButton.button)
					end

					ClearAllDisplayEntries ()
					UpdateDisplayFrame ()
				end
			elseif event == "PLAYER_LOGOUT" and LFG113Saved ["enableChannelModification"] then
				for key, value in pairs (L.Variables.ChannelsUsed) do
					if value ["used"] == false then LeaveChannelByName (key) end
				end
			elseif event == "PLAYER_ENTERING_WORLD" then -- We have entered/left an instance or logged in/out from DC
				if LFG113Saved ["useRatingSystem"] and GetNumGroupMembers () > 0  then RecordPlayerInformation () end
			end
		end)

	--L.Frames.autoInviteFrame:RegisterEvent("BN_FRIEND_ACCOUNT_ONLINE")
	L.Frames.autoInviteFrame:RegisterEvent("CHAT_MSG_SYSTEM")
	L.Frames.autoInviteFrame:SetScript ("OnEvent", function (self, event, social_info, ...)
			--print (event)
			--print (social_info)
			if L.Variables.LoadedPremade == nil then return end
			if event == "BN_FRIEND_ACCOUNT_ONLINE" then
				local total_RID = BNGetNumFriends()
				for i=1,total_RID do
					local presenceID, givenName, surname, toonName, toonID, client, isOnline, lastOnline, isAFK, isDND, broadcastText, noteText, isFriend, broadcastTime =  BNGetFriendInfo(i)
					if client == "WoW" then
						local hasFocus, toonName, client, realmName, faction, race, class, guild, zoneName, level, gameText = BNGetToonInfo(presenceID)
						wtwt_classcolor(class)
						if current_realm ~= realmName then toonName = toonName .. " - " .. realmName end
						if social_info == presenceID then
							if class_color == nil then class_color = "7AB8EE" end
							--print("WOW1 |cff7AB8EE*** " .. givenName .. " " .. surname .." (|r|cff" .. class_color .. toonName .. "|r|cff7AB8EE) -|r |cff77FF77ONLINE|r |cff7AB8EE***|r")
							PlaySoundFile("Sound\\Spells\\BlizzardImpact1a.wav")
							social_info = " "
							break
						end
					else
						if social_info == presenceID then
							--print("WOW2 |cff7AB8EE*** " .. givenName .. " " .. surname .." (|r" .. client .. "|cff7AB8EE) -|r |cff77FF77ONLINE|r |cff7AB8EE***|r")
							PlaySoundFile("Sound\\Spells\\BlizzardImpact1a.wav")
							social_info = " "
							break
						end
					end
				end
			elseif event == "CHAT_MSG_SYSTEM" then
				local friend_check = { strsplit (" ", social_info) }
				local friend_name = (friend_check[1] .. "9"):lower ()
				if friend_name:find ('%[') ~= nil and social_info:find (" online") ~= nil then
					friend_name = friend_name:sub (friend_name:find('%[') + 1, friend_name:find('%]') - 1)
					if LFG113Premades [L.Variables.LoadedPremade [2]][friend_name] ~= nil then InviteUnit (friend_name) end
				end
			end
		end)

		-- This will display when we have an important update and people need to know major changes have occured
	StaticPopupDialogs["LFG113_BLOCK"] = {
		--text = L.Locals.CurrentLocal ["txtReportQuestion"], button1 = L.Locals.CurrentLocal ["btnReport"], button2 = L.Locals.CurrentLocal ["btnCancel"],
		--timeout = 0, whileDead = true, hideOnEscape = true, hasEditBox = true, preferredIndex = 3,
		--OnAccept = function(self) if self.editBox:GetText() and self.editBox:GetText():len() > 0 then	end end,
	}

	function LFG113Show ()
		if L.Frames.mainFrame.title then
			if L.Frames.mainFrame:IsShown() then
				L.Frames.mainFrame:Hide()
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_CHARACTER_INFO_CLOSE) end
			else
				L.Frames.mainFrame:Show()
				if LFG113Saved ["messageNumber"] == nil or (LFG113Saved ["messageNumber"] and LFG113Saved ["messageNumber"] ~= L.Variables.version) then
					LFG113Saved ["messageNumber"] = L.Variables.version
					L.Frames.updatedFrame:Show()
				end
				if LFG113Saved ["enableSound"] then PlaySound(SOUNDKIT.IG_CHARACTER_INFO_OPEN) end
			end
		end
end

	-- Add Slash command to hide/show
	SLASH_LFG1 = "/lfg"
	SlashCmdList["LFG"] = function() LFG113Show () end

	-- Add menuitem to right click on chat window for opening interface and copying name into Blacklist
	function MySubMenu_Setup(self, ...)
		local dropdownFrame = UIDROPDOWNMENU_INIT_MENU;
		local name = dropdownFrame.name;
		local button = self.value;
		if button == "ADD_TO_BLACKLIST" then -- If the button is our button...
			if not L.Frames.mainFrame:IsShown() then L.Frames.mainFrame:Show() end
			L.Frames.mainFrame.LeftTab.BlackListButton.button:GetScript ("OnClick")(L.Frames.mainFrame.LeftTab.BlackListButton.button)
			L.Frames.mainFrame.BlockList.reportedText:SetText (name)
			L.Frames.mainFrame.BlockList.Add:SetEnabled (L.Frames.mainFrame.BlockList.reportedText:GetText ():len () > 0 and L.Frames.mainFrame.BlockList.issueText:GetText ():len() > 0)
			return true
		elseif button == "ADD_TO_PREME" then -- If the button is our button...
			if not L.Frames.mainFrame:IsShown() then L.Frames.mainFrame:Show() end
			L.Frames.mainFrame.LeftTab.PremadeButton.button:GetScript ("OnClick")(L.Frames.mainFrame.LeftTab.PremadeButton.button)
			L.Frames.mainFrame.BlockList.reportedText:SetText (name)
			L.Frames.mainFrame.BlockList.Add:SetEnabled (L.Frames.mainFrame.BlockList.reportedText:GetText ():len () > 0 and L.Frames.mainFrame.BlockList.issueText:GetText ():len() > 0)
			return true
		elseif button == "SHARE_BLACKLIST" then
			L.Variables.BlacklistSwapping = 1
			L.Variables.BlacklistClient = name
			print ("Blacklist Sync Started with " .. L.Variables.BlacklistClient)
			SendChatMessage ("!1131 If you see this then you need to update your LFG113:Classic Looking For Group to Sync Blacklists", "WHISPER", "Common", L.Variables.BlacklistClient)
		elseif button == "SHARE_RATING" then
			L.Variables.RatingSwapping = 1
			L.Variables.RatingClient = name
			print ("Rating Sync Started with " .. L.Variables.RatingClient)
			SendChatMessage ("!1141 If you see this then you need to update your LFG113:Classic Looking For Group to Sync Ratings", "WHISPER", "Common", L.Variables.RatingClient)
		end
	end
