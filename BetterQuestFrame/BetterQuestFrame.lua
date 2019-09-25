local addonName, addOn = ...

BetterQuestFrame = CreateFrame("Frame", nil, UIParent)
local BQF = BetterQuestFrame
local AnchorFrame = CreateFrame("Frame")
local showAnchors = false
local isCollapsed = false
local showHidden = false

local defaults = {
	version = 3,
	positionX = 500,
	positionY = 500,
	frameHeight = 500,
	frameWidth = 270,
	showQuestCount = true,
	questTitleFormat = "[quest:title] ([quest:level])",
}

function BQF:Initialize()

	if QuestWatchFrame:IsVisible() then
		QuestWatchFrame:Hide()
	end
	
	QuestWatchFrame.Show = QuestWatchFrame.Hide

	AnchorFrame:SetSize(1, 1)
	self:SetFrameStrata("BACKGROUND")
	self:SetMovable(true)
	self:SetClampedToScreen(true)
	self:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background"})
	self:SetBackdropColor(0, 0, 0, 0)
	
	self:RegisterForDrag("LeftButton")
	self:SetScript("OnDragStart", self.StartMoving)
	self:SetScript("OnDragStop", function(frame)
		frame:StopMovingOrSizing()
		frame:SetUserPlaced(false) -- we dont want it to be a character-specific UIParent managed frame
		local effectiveScale = UIParent:GetEffectiveScale()
		local right = frame:GetRight() * effectiveScale
		local top = frame:GetTop() * effectiveScale
		self.db.positionX = right
		self.db.positionY = top
		LibStub("AceConfigRegistry-3.0"):NotifyChange("BetterQuestFrame")
	end)

	-- block FramePositionDelegate.UIParentManageFramePositions from moving this on every OnAttributeChanged
	local oldSetPoint = self.SetPoint
	self.SetPoint = function(frame, point, relativeTo, relativePoint, x, y, override)
		if override then
			oldSetPoint(frame, point, relativeTo, relativePoint, x, y)
		end
	end
	
	self.header = {}
	
	local background = self:CreateTexture(nil, "BACKGROUND")
	self.header.background = background
	background:SetWidth(296)
	background:SetHeight(90)
	background:SetPoint("TOPLEFT", -13, 15)
	background:SetAtlas("Objective-Header")
	
	local title = self:CreateFontString(nil, nil, "GameFontNormal")
	self.header.title = title
	title:SetText("Quests")
	title:SetPoint("TOPLEFT", 21, -8)
	
	local collapseButton = CreateFrame("BUTTON")
	self.header.collapse = collapseButton
	collapseButton:SetWidth(15.5)
	collapseButton:SetHeight(15.5)
	collapseButton:SetPoint("TOPRIGHT", self, "TOPRIGHT", -4.5, -1.5)
	collapseButton:SetNormalTexture("Interface\\BUTTONS\\UI-Panel-CollapseButton-Up.blp")
	collapseButton:SetPushedTexture("Interface\\BUTTONS\\UI-Panel-CollapseButton-Down.blp")
	collapseButton:SetHighlightTexture("Interface\\BUTTONS\\UI-Panel-MinimizeButton-Highlight.blp")
	collapseButton:SetScript("OnClick", function()
		if isCollapsed == true then
			isCollapsed = false
			collapseButton:SetNormalTexture("Interface\\BUTTONS\\UI-Panel-CollapseButton-Up.blp")
			collapseButton:SetPushedTexture("Interface\\BUTTONS\\UI-Panel-CollapseButton-Down.blp")
		else
			isCollapsed = true
			collapseButton:SetNormalTexture("Interface\\BUTTONS\\UI-Panel-ExpandButton-Up.blp")
			collapseButton:SetPushedTexture("Interface\\BUTTONS\\UI-Panel-ExpandButton-Down.blp")
		end		
		self:LoadQuests()
	end)
	
	local showHiddenButton = CreateFrame("CHECKBUTTON", nil, nil, "UICheckButtonTemplate")
	self.header.showHidden = showHiddenButton
	showHiddenButton:SetSize(14.5, 14.5)
	showHiddenButton:SetPoint("TOPRIGHT", collapseButton, "TOPLEFT", 1, -1)
	showHiddenButton:SetScript("OnClick", function()
		showHidden = not(showHidden)
		self:LoadQuests()
	end)
		
	self.checkBoxes = {}
	self.fontStrings = {}
	self.clickFrames = {}
	
end

function BQF:LoadQuests()
	
	local hiddenQuests = BetterQuestFrameCharDB
	local newHidden = {}
	
	-- Config Values
	local showQuestCount = self.db.showQuestCount
	local questTitleFormat = self.db.questTitleFormat
	
	local numEntries, _ = GetNumQuestLogEntries()
	local totalQuestCount = 0
	local visibleQuestCount = 0
	local textLines = 0
	
	for i = 1, numEntries, 1
	do
		local title, level, _, isHeader, _, isComplete, _, questID, _, _, _, _, _, _ = GetQuestLogTitle(i);
		
		if not isHeader then
		
			totalQuestCount = totalQuestCount + 1
			
			local showQuest = true

			if hiddenQuests[questID] ~= nil then
				showQuest = hiddenQuests[questID]
			end
			
			newHidden[questID] = showQuest
			
			if (showHidden == true or showQuest == true) and isCollapsed ~= true then
			
				visibleQuestCount = visibleQuestCount + 1				
				textLines = textLines + 1
				
				if not self.checkBoxes[visibleQuestCount] then
					self.checkBoxes[visibleQuestCount] = CreateFrame("CHECKBUTTON", nil, nil, "UICheckButtonTemplate")
				end
				
				local checkButton = self.checkBoxes[visibleQuestCount]
				checkButton:SetSize(14.5, 14.5)
				checkButton:SetChecked(showQuest)
				checkButton.questID = questID
				checkButton:SetScript("OnClick", function(cBtn)
					BetterQuestFrameCharDB[cBtn.questID] = not(BetterQuestFrameCharDB[cBtn.questID])
				end)
				
				if visibleQuestCount == 1 then			
					checkButton:SetPoint("TOPLEFT", self.header.title, "BOTTOMLEFT", -13.5, -7)
				else
					checkButton:SetPoint("TOP", self.fontStrings[textLines - 1], "BOTTOM", 3, 0)
					checkButton:SetPoint("LEFT", self.checkBoxes[visibleQuestCount - 1], "LEFT", 0, 0)
				end
				
				if showHidden == true then
					checkButton:Show()
				else
					checkButton:Hide()
				end
					
				local questHeader = questTitleFormat
				questHeader = string.gsub(questHeader, "%[quest:title%]", title)
				questHeader = string.gsub(questHeader, "%[quest:level%]", level)
				
				if not self.fontStrings[textLines] then
					self.fontStrings[textLines] = self:CreateFontString(nil, nil, "GameFontNormal")
				end
		
				local questTitle = self.fontStrings[textLines]
				questTitle:Show()
				questTitle:SetText(questHeader)
				questTitle:SetJustifyH("LEFT")
				
				if isComplete then
					questTitle:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b) -- 1, .82, 0			
				else
					questTitle:SetTextColor(.75, .61, 0)
				end
				
				questTitle:SetPoint("TOPLEFT", checkButton, "TOPRIGHT", 3, -4)
				
				local objectivesCount = GetNumQuestLeaderBoards(i)
				local objectives = {}
				
				if objectivesCount > 0 then			
					for j = 1, objectivesCount, 1
					do
						textLines = textLines + 1
						
						local desc, _, done = GetQuestLogLeaderBoard(j, i)
						
						if not self.fontStrings[textLines] then
							self.fontStrings[textLines] = self:CreateFontString(nil, nil, "GameFontNormal")
						end
						
						local objectiveText = self.fontStrings[textLines]
						objectiveText:Show()
						objectiveText:SetText(" - " .. desc)
						objectiveText:SetJustifyH("LEFT")
						
						if done then
							objectiveText:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
						else
							objectiveText:SetTextColor(.8, .8, .8)
						end
						
						objectiveText:SetPoint("TOPLEFT", self.fontStrings[textLines - 1], "BOTTOMLEFT", 0, -1)
						objectiveText:SetPoint("RIGHT", self, "RIGHT", -5, 0)
						
						local objective = {}
						objective.text = objectiveText
						objective.done = done
						tinsert(objectives, objective)
					end
				else
					textLines = textLines + 1			
					
					SelectQuestLogEntry(i);
					local _, desc = GetQuestLogQuestText()

					if not self.fontStrings[textLines] then
						self.fontStrings[textLines] = self:CreateFontString(nil, nil, "GameFontNormal")
					end
					
					local objectiveText = self.fontStrings[textLines]
					objectiveText:Show()
					objectiveText:SetText(" - " .. desc)
					objectiveText:SetJustifyH("LEFT")
					objectiveText:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
					objectiveText:SetPoint("TOPLEFT", self.fontStrings[textLines - 1], "BOTTOMLEFT", 0, -1)
					objectiveText:SetPoint("RIGHT", self, "RIGHT", -5, 0)
					
					local objective = {}
					objective.text = objectiveText
					objective.done = true
					tinsert(objectives, objective)
					
					objectivesCount = 1
				end
				
				BQF:SetClickFrame(visibleQuestCount, i, questTitle, objectives, isComplete)
				
			end
		end
	end
		
	if table.getn(self.checkBoxes) > visibleQuestCount then
		for i = visibleQuestCount + 1, table.getn(self.checkBoxes), 1 do
			self.checkBoxes[i]:Hide()
			self.checkBoxes[i] = nil
		end
	end
	
	if table.getn(self.fontStrings) > textLines then
		for i = textLines + 1, table.getn(self.fontStrings), 1 do
			self.fontStrings[i]:Hide()
			self.fontStrings[i] = nil
		end
	end
	
	if table.getn(self.clickFrames) > visibleQuestCount then
		for i = visibleQuestCount + 1, table.getn(self.clickFrames), 1 do
			self.clickFrames[i]:Hide()
			self.clickFrames[i] = nil
		end
	end
	
	self:RefreshSize()
	self:RefreshPosition()
			
	local headerText = "Quests"
	
	if showQuestCount then
		headerText = headerText .. " (" .. totalQuestCount .. "/20)"
	end	
	
	self.header.title:SetText(headerText)
	
	BetterQuestFrameCharDB = CopyTable(newHidden)
end

local function OnMouseUp(self)
	if IsShiftKeyDown() then -- untrack quest
		local questID = GetQuestIDFromLogIndex(self.questIndex)
		BetterQuestFrameCharDB[questID] = not(BetterQuestFrameCharDB[questID])
		BQF:LoadQuests()
	else -- open to quest log
		if QuestLogEx then -- https://www.wowinterface.com/downloads/info24980-QuestLogEx.html
			ShowUIPanel(QuestLogExFrame)
			QuestLogEx:QuestLog_SetSelection(self.questIndex)
			QuestLogEx:Maximize()
		elseif ClassicQuestLog then -- https://www.wowinterface.com/downloads/info24937-ClassicQuestLogforClassic.html
			ShowUIPanel(ClassicQuestLog)
			QuestLog_SetSelection(self.questIndex)
		else
			ShowUIPanel(QuestLogFrame)
			QuestLog_SetSelection(self.questIndex)
			local valueStep = QuestLogListScrollFrame.ScrollBar:GetValueStep()
			QuestLogListScrollFrame.ScrollBar:SetValue(self.questIndex*valueStep/2)
		end
	end
end

local function OnEnter(self)
	if self.completed then
		-- use normal colors instead as highlight
		self.headerText:SetTextColor(.75, .61, 0)
		for _, objective in ipairs(self.objectives) do
			objective.text:SetTextColor(.8, .8, .8)
		end
	else
		self.headerText:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b) -- 1, .82, 0
		for _, objective in ipairs(self.objectives) do
			objective.text:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
		end
	end
end

local function OnLeave(self)
	if self.completed then
		self.headerText:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b) -- 1, .82, 0
		for _, objective in ipairs(self.objectives) do
			objective.text:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
		end
	else
		self.headerText:SetTextColor(.75, .61, 0)
		for _, objective in ipairs(self.objectives) do
			if objective.done then
				objective.text:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
			else
				objective.text:SetTextColor(.8, .8, .8)
			end
		end
	end
end

function BQF:SetClickFrame(index, questIndex, headerText, objectives, completed)
	if not self.clickFrames[index] then
		self.clickFrames[index] = CreateFrame("Frame")
		self.clickFrames[index]:SetScript("OnMouseUp", OnMouseUp)
		self.clickFrames[index]:SetScript("OnEnter", OnEnter)
		self.clickFrames[index]:SetScript("OnLeave", OnLeave)
	end
	local f = self.clickFrames[index]
	f:SetAllPoints(headerText)
	f.questIndex = questIndex
	f.headerText = headerText
	f.objectives = objectives
	f.completed = completed
end

-- use a separate anchor frame to make it expand down/leftwards only
function BQF:SetPosition(point, relativeTo, relativePoint, x, y)
	AnchorFrame:ClearAllPoints()
	AnchorFrame:SetPoint(point, relativeTo, relativePoint, x, y)
	self:ClearAllPoints()
	self:SetPoint("TOPRIGHT", AnchorFrame, "TOPRIGHT", 0, 0, true)
end

-- use a separate anchor frame to make it expand down/leftwards only
function BQF:RefreshPosition()
	self:SetPosition("TOPRIGHT", "UIParent", "BOTTOMLEFT", self.db.positionX, self.db.positionY)
end

function BQF:RefreshSize()
	self:SetSize(self.db.frameWidth, self.db.frameHeight)	
end

local function round(num)
  return math.floor(num + 0.5)
end

function BQF:GetResolution()
	local scale = string.match(GetCVar("gxWindowedResolution"), "%d+x(%d+)");
	local uiScale = UIParent:GetScale()	
	local realScale = 768 / scale / uiScale	
	
	return {
		height = math.floor(GetScreenHeight() / realScale + 0.5),
		width = math.floor(GetScreenWidth() / realScale + 0.5),
	}
end

function BQF:ToggleAnchors()
	if showAnchors == false then
		self:EnableMouse(true)
		self:SetBackdropColor(0, 0, 0, .5)
		showAnchors = true
	else
		self:EnableMouse(false)
		self:SetBackdropColor(0, 0, 0, 0)
		-- avoid getting stuck to the cursor when alt is released while dragging
		self:StopMovingOrSizing()
		showAnchors = false
	end
end

function BQF:ADDON_LOADED(addon)
	if addon == addonName then
		if not BetterQuestFrameDB or BetterQuestFrameDB.version == nil or BetterQuestFrameDB.version < defaults.version then
			BetterQuestFrameDB = CopyTable(defaults)
		end
		if not BetterQuestFrameCharDB then
			BetterQuestFrameCharDB = {}
		end
		self.db = BetterQuestFrameDB
		self:Initialize()
		self:RefreshPosition()
		self:UnregisterEvent("ADDON_LOADED")
	end
end

function BQF:QUEST_LOG_UPDATE(unitTarget)
	self:LoadQuests()
end

function BQF:OnEvent(event, ...)
	self[event](self, ...)
end

-- DEFAULT_CHAT_FRAME:AddMessage("Test")

BQF:RegisterEvent("ADDON_LOADED")
BQF:RegisterEvent("QUEST_LOG_UPDATE")
BQF:SetScript("OnEvent", BQF.OnEvent)