local addonName, addOn = ...

BetterQuestFrame = CreateFrame("Frame", nil, UIParent)
local BQF = BetterQuestFrame
local AnchorFrame = CreateFrame("Frame")
local ClickFrames = {}
local isCollapsed = false
local showAnchors = false

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

	AnchorFrame:SetSize(1, 1)
	self:SetFrameStrata("BACKGROUND")
	self:SetMovable(true)
	self:SetClampedToScreen(true)
	self:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background"})
	self:SetBackdropColor(0, 0, 0, 0)
	
	-- DEBUG
	--self:SetBackdropColor(1, 1, 1, 0.5)
	--self:EnableMouse(true)
	-- DEBUG
	
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
	title:SetPoint("TOPLEFT", 20, -9)
	
	local collapseButton = CreateFrame("BUTTON", nil, minimize)
	self.header.collapse = collapseButton
	collapseButton:SetWidth(15.5)
	collapseButton:SetHeight(15.5)
	collapseButton:SetPoint("TOPRIGHT", self, "TOPRIGHT", -5, -1.5)
	collapseButton:SetNormalTexture("Interface\\BUTTONS\\UI-Panel-CollapseButton-Up.blp")
	collapseButton:SetPushedTexture("Interface\\BUTTONS\\UI-Panel-CollapseButton-Down.blp")
	collapseButton:SetHighlightTexture("Interface\\BUTTONS\\UI-Panel-MinimizeButton-Highlight.blp")
	collapseButton:SetScript("OnClick", function()
		if isCollapsed == true then
			isCollapsed = false
			self:LoadQuests()
			collapseButton:SetNormalTexture("Interface\\BUTTONS\\UI-Panel-CollapseButton-Up.blp")
			collapseButton:SetPushedTexture("Interface\\BUTTONS\\UI-Panel-CollapseButton-Down.blp")
		else
			isCollapsed = true
			self:LoadQuests()
			collapseButton:SetNormalTexture("Interface\\BUTTONS\\UI-Panel-ExpandButton-Up.blp")
			collapseButton:SetPushedTexture("Interface\\BUTTONS\\UI-Panel-ExpandButton-Down.blp")
		end
	end)
		
	self.fontStrings = {};
	
end

function BQF:LoadQuests()

	if QuestWatchFrame:IsVisible() then
		QuestWatchFrame:Hide()
	end
	
	QuestWatchFrame.Show = QuestWatchFrame.Hide
	
	-- Config Values
	local showQuestCount = self.db.showQuestCount
	local questTitleFormat = self.db.questTitleFormat
	
	for i = 1, table.getn(self.fontStrings), 1 do
		self.fontStrings[i]:Hide()
		self.fontStrings[i] = nil;
	end
	
	local numEntries, _ = GetNumQuestLogEntries()
	local questCount = 0
	local l = 0
	
	for i = 1, numEntries, 1
	do
		local title, level, _, isHeader, _, isComplete, _, questID, _, displayQuestID, _, _, _, _ = GetQuestLogTitle(i);
		
		if not isHeader then
		
			l = l + 1
			questCount = questCount + 1
			
			if isCollapsed ~= true then
					
				local questHeader = questTitleFormat
				questHeader = string.gsub(questHeader, "%[quest:title%]", title)
				questHeader = string.gsub(questHeader, "%[quest:level%]", level)
		
				local questTitle = self:CreateFontString(nil, nil, "GameFontNormal")
				self.fontStrings[l] = questTitle
				questTitle:SetText(questHeader)
				questTitle:SetJustifyH("LEFT")
				
				if isComplete then
					questTitle:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b) -- 1, .82, 0			
				else
					questTitle:SetTextColor(.75, .61, 0)
				end
				
				if l == 1 then			
					questTitle:SetPoint("TOPLEFT", self.header.title, "BOTTOMLEFT", 5, -15)
				else
					questTitle:SetPoint("TOPLEFT", self.fontStrings[l - 1], "BOTTOMLEFT", 0, -5)
				end
				
				questTitle:SetPoint("RIGHT", self, "RIGHT", -5, 0)
				
				local objectivesCount = GetNumQuestLeaderBoards(i)
				local objectives = {}
				
				if objectivesCount > 0 then			
					for j = 1, objectivesCount, 1
					do
						l = l + 1
						
						local desc, _, done = GetQuestLogLeaderBoard(j, i)
						
						local objectiveText = self:CreateFontString(nil, nil, "GameFontNormal")
						self.fontStrings[l] = objectiveText
						objectiveText:SetText(" - " .. desc)
						objectiveText:SetJustifyH("LEFT")
						
						if done then
							objectiveText:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
						else
							objectiveText:SetTextColor(.8, .8, .8)
						end
						
						objectiveText:SetPoint("TOPLEFT", self.fontStrings[l - 1], "BOTTOMLEFT", 0, -1)
						objectiveText:SetPoint("RIGHT", self, "RIGHT", -5, 0)
						
						local objective = {}
						objective.text = self.fontStrings[l]
						objective.done = done
						tinsert(objectives, objective)
					end
				else
					l = l + 1			
					
					SelectQuestLogEntry(i);
					local _, desc = GetQuestLogQuestText()
					
					local objectiveText = self:CreateFontString(nil, nil, "GameFontNormal")				
					self.fontStrings[l] = objectiveText
					objectiveText:SetText(" - " .. desc)
					objectiveText:SetJustifyH("LEFT")
					objectiveText:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
					objectiveText:SetPoint("TOPLEFT", self.fontStrings[l - 1], "BOTTOMLEFT", 0, -1)
					objectiveText:SetPoint("RIGHT", self, "RIGHT", -5, 0)
					
					local objective = {}
					objective.text = self.fontStrings[l]
					objective.done = true
					tinsert(objectives, objective)
					
					objectivesCount = 1
				end
				
				BQF:SetClickFrame(i, self.fontStrings[l - objectivesCount], objectives, isComplete)
				
			end
		end
	end
	
	if table.getn(self.fontStrings) > l then
		for i = l, table.getn(self.fontStrings), 1 do
			self.fontStrings = nil;
		end
	end
	
	-- -- Auto-set frame height
	-- local frameHeight = 0
	
	-- frameHeight = frameHeight + 20						-- Offset of the header text
	-- frameHeight = frameHeight + 15						-- Spacing between header and first quest
	-- frameHeight = frameHeight + ((questCount - 1) * 5)	-- Spacing before all quest titles but the first
	-- frameHeight = frameHeight + ((l - questCount) * 1)	-- Spacing before each quest objectives
	-- frameHeight = frameHeight + l						-- General spacing between each FontString
	
	-- for _, text in pairs(self.fontStrings) do
		-- frameHeight = frameHeight + text:GetHeight() 	-- Height for each quest
	-- end
	
	self:RefreshSize()
	self:RefreshPosition()
			
	local headerText = "Quests"
	
	if showQuestCount then
		headerText = headerText .. " (" .. questCount .. "/20)"
	end	
	
	self.header.title:SetText(headerText)
end

local function OnMouseUp(self)
	if IsShiftKeyDown() then -- untrack quest
		local questID = GetQuestIDFromLogIndex(self.questIndex)
		for index, value in ipairs(QUEST_WATCH_LIST) do
			if value.id == questID then
				tremove(QUEST_WATCH_LIST, index)
			end
		end
		RemoveQuestWatch(self.questIndex)
		QuestWatch_Update()
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

function BQF:SetClickFrame(questIndex, headerText, objectives, completed)
	if not ClickFrames[questIndex] then
		ClickFrames[questIndex] = CreateFrame("Frame")
		ClickFrames[questIndex]:SetScript("OnMouseUp", OnMouseUp)
		ClickFrames[questIndex]:SetScript("OnEnter", OnEnter)
		ClickFrames[questIndex]:SetScript("OnLeave", OnLeave)
	end
	local f = ClickFrames[questIndex]
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