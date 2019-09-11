local MM = GetAddOnMetadata("MarkMe", "Title")
local MMVersionNum = GetAddOnMetadata("MarkMe", "Version")

DEFAULT_CHAT_FRAME:AddMessage(MM.. ' v.' ..MMVersionNum.. ' is loaded.')
DEFAULT_CHAT_FRAME:AddMessage(MM..' Use /mm options to open options, use /mm reset to reset to default')

local MMSettings_Default =
{
	locked_skull = false,
	locked_cross = false,
	locked_square = false,
	locked_moon = false,
	locked_triangle = false,
	locked_diamond = false,
	locked_circle = true,
	locked_star = true,
	skull_line = "Skull - kill first",
	cross_line = "Cross - kill second",
	square_line = "Square - trap",
	moon_line = "Moon - sheep",
	triangle_line = "Triangle - fear",
	diamond_line = "Diamond - sap",
	circle_line = "Circle - ",
	star_line = "Star - ",
	mainFrameScale = 1,
	lock_frame = false,
	show_cog = true,
	use_fade = false,
	fade_num = 0.2,
}

MMGLOBALS = {}

local defaultBackdrop = {
	bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	tile = true,
	tileSize = 16,
	edgeSize = 16,
	insets = {left = 4, right = 4, top = 4, bottom = 4,}
}

local defaultBackdropSmall = {
	bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	tile = true,
	tileSize = 12,
	edgeSize = 12,
	insets = {left = 4, right = 4, top = 4, bottom = 4,}
}

local borderlessBackdrop = {
	bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
	tile = true,
	tileSize = 16
}

local enable_readycheck = false
local enable_announcer = false
------------- Main Frame -------------

mainFrame = CreateFrame("Frame", "mainFrame", UIParent)
mainFrame:SetBackdrop(borderlessBackdrop)
mainFrame:SetBackdropColor(0,0,0,0)
mainFrame:EnableMouse(true)
mainFrame:SetMovable(true)
mainFrame:SetUserPlaced(true)
mainFrame:SetUserPlaced(false)
mainFrame:SetSize(255,40)
mainFrame:SetPoint("CENTER", UIParent, "CENTER")
mainFrame:SetScript("OnMouseDown", function(self,button) if (button=="LeftButton" and MMSettings.lock_frame ~= true) then mainFrame:StartMoving() end end)
mainFrame:SetClampedToScreen(false)

------------- Icon Frame -------------

local iconFrame = CreateFrame("Frame", "iconFrame", mainFrame)
iconFrame:SetBackdrop(defaultBackdrop)
iconFrame:SetBackdropColor(0.1,0.1,0.1,0.7)
iconFrame:EnableMouse(true)
iconFrame:SetMovable(true)
iconFrame:SetSize(255,40)
iconFrame:SetPoint("LEFT", mainFrame, "LEFT")
iconFrame:SetScript("OnMouseDown", function(self,button) if (button=="LeftButton" and MMSettings.lock_frame ~= true) then mainFrame:StartMoving() end end)
iconFrame:SetScript("OnMouseUp", function(self) mainFrame:StopMovingOrSizing() end)
iconFrame:SetScript('OnEnter', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("highlight") end end)
iconFrame:SetScript('OnLeave', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("fade") end end)


------------- Readycheck Frame -------------

local ReadycheckFrame = CreateFrame("Frame", "ReadycheckFrame", mainFrame)
ReadycheckFrame:SetBackdrop(defaultBackdrop)
ReadycheckFrame:SetBackdropColor(0.1,0.1,0.1,0.7)
ReadycheckFrame:EnableMouse(true)
ReadycheckFrame:SetMovable(true)
ReadycheckFrame:SetSize(40, 40)
ReadycheckFrame:SetPoint("RIGHT", mainFrame, "LEFT")
ReadycheckFrame:SetScript("OnMouseDown", function(self,button) if (button=="LeftButton" and MMSettings.lock_frame ~= true) then mainFrame:StartMoving() end end)
ReadycheckFrame:SetScript("OnMouseUp", function(self) mainFrame:StopMovingOrSizing() end)
ReadycheckFrame:SetScript('OnEnter', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("highlight") end end)
ReadycheckFrame:SetScript('OnLeave', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("fade") end end)

------------- Announce Frame -------------

local AnnounceFrame = CreateFrame("Frame", "AnnounceFrame", mainFrame)
AnnounceFrame:SetBackdrop(defaultBackdrop)
AnnounceFrame:SetBackdropColor(0.1,0.1,0.1,0.7)
AnnounceFrame:EnableMouse(true)
AnnounceFrame:SetMovable(true)
AnnounceFrame:SetSize(40, 40)
AnnounceFrame:SetPoint("LEFT", mainFrame, "Right")
AnnounceFrame:SetScript("OnMouseDown", function(self,button) if (button=="LeftButton" and MMSettings.lock_frame ~= true) then mainFrame:StartMoving() end end)
AnnounceFrame:SetScript("OnMouseUp", function(self) mainFrame:StopMovingOrSizing() end)
AnnounceFrame:SetScript('OnEnter', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("highlight") end end)
AnnounceFrame:SetScript('OnLeave', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("fade") end end)


------------- Mark Buttons -------------
local iconSkull = CreateFrame("Button", "iconSkull", iconFrame)
iconSkull:SetSize(25,25)
iconSkull:SetPoint("LEFT", iconFrame, "LEFT",10,0)
iconSkull:SetNormalTexture("interface\\targetingframe\\ui-raidtargetingicons")
iconSkull:GetNormalTexture():SetTexCoord(0.75,1,0.25,0.5)
iconSkull:EnableMouse(true)
iconSkull:SetScript("OnClick", function(self) SetRaidTargetIcon("target", 8) end)
iconSkull:SetScript("OnMouseDown", function(self,button) if (button=="RightButton") then ToggleOP("Skull") end end)
iconSkull:SetScript('OnEnter', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("highlight") end end)
iconSkull:SetScript('OnLeave', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("fade") end end)

local iconCross = CreateFrame("Button", "iconCross", iconFrame)
iconCross:SetSize(25,25)
iconCross:SetPoint("LEFT", iconSkull, "RIGHT", 5, 0)
iconCross:SetNormalTexture("interface\\targetingframe\\ui-raidtargetingicons")
iconCross:GetNormalTexture():SetTexCoord(0.5,0.75,0.25,0.5)
iconCross:EnableMouse(true)
iconCross:SetScript("OnClick", function(self) SetRaidTargetIcon("target", 7) end)
iconCross:SetScript("OnMouseDown", function(self,button) if (button=="RightButton") then ToggleOP("Cross") end end)
iconCross:SetScript('OnEnter', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("highlight") end end)
iconCross:SetScript('OnLeave', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("fade") end end)

local iconSquare = CreateFrame("Button", "iconSquare", iconFrame)
iconSquare:SetSize(25,25)
iconSquare:SetPoint("LEFT", iconCross, "RIGHT", 5, 0)
iconSquare:SetNormalTexture("interface\\targetingframe\\ui-raidtargetingicons")
iconSquare:GetNormalTexture():SetTexCoord(0.25,0.5,0.25,0.5)
iconSquare:EnableMouse(true)
iconSquare:SetScript("OnClick", function(self) SetRaidTargetIcon("target", 6) end)
iconSquare:SetScript("OnMouseDown", function(self,button) if (button=="RightButton") then ToggleOP("Square") end end)
iconSquare:SetScript('OnEnter', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("highlight") end end)
iconSquare:SetScript('OnLeave', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("fade") end end)

local iconMoon = CreateFrame("Button", "iconMoon", iconFrame)
iconMoon:SetSize(25,25)
iconMoon:SetPoint("LEFT", iconSquare, "RIGHT", 5, 0)
iconMoon:SetNormalTexture("interface\\targetingframe\\ui-raidtargetingicons")
iconMoon:GetNormalTexture():SetTexCoord(0,0.25,0.25,0.5)
iconMoon:EnableMouse(true)
iconMoon:SetScript("OnClick", function(self) SetRaidTargetIcon("target", 5) end)
iconMoon:SetScript("OnMouseDown", function(self,button) if (button=="RightButton") then ToggleOP("Moon") end end)
iconMoon:SetScript('OnEnter', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("highlight") end end)
iconMoon:SetScript('OnLeave', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("fade") end end)

local iconTriangle = CreateFrame("Button", "iconTriangle", iconFrame)
iconTriangle:SetSize(25,25)
iconTriangle:SetPoint("LEFT", iconMoon, "RIGHT", 5, 0)
iconTriangle:SetNormalTexture("interface\\targetingframe\\ui-raidtargetingicons")
iconTriangle:GetNormalTexture():SetTexCoord(0.75,1,0,0.25)
iconTriangle:EnableMouse(true)
iconTriangle:SetScript("OnClick", function(self) SetRaidTargetIcon("target", 4) end)
iconTriangle:SetScript("OnMouseDown", function(self,button) if (button=="RightButton") then ToggleOP("Triangle") end end)
iconTriangle:SetScript('OnEnter', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("highlight") end end)
iconTriangle:SetScript('OnLeave', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("fade") end end)

local iconDiamond = CreateFrame("Button", "iconDiamond", iconFrame)
iconDiamond:SetSize(25,25)
iconDiamond:SetPoint("LEFT", iconTriangle, "RIGHT", 5, 0)
iconDiamond:SetNormalTexture("interface\\targetingframe\\ui-raidtargetingicons")
iconDiamond:GetNormalTexture():SetTexCoord(0.5,0.75,0,0.25)
iconDiamond:EnableMouse(true)
iconDiamond:SetScript("OnClick", function(self) SetRaidTargetIcon("target", 3) end)
iconDiamond:SetScript("OnMouseDown", function(self,button) if (button=="RightButton") then ToggleOP("Diamond") end end)
iconDiamond:SetScript('OnEnter', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("highlight") end end)
iconDiamond:SetScript('OnLeave', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("fade") end end)

local iconCircle = CreateFrame("Button", "iconCircle", iconFrame)
iconCircle:SetSize(25,25)
iconCircle:SetPoint("LEFT", iconDiamond, "RIGHT", 5, 0)
iconCircle:SetNormalTexture("interface\\targetingframe\\ui-raidtargetingicons")
iconCircle:GetNormalTexture():SetTexCoord(0.25,0.5,0,0.25)
iconCircle:EnableMouse(true)
iconCircle:SetScript("OnClick", function(self) SetRaidTargetIcon("target", 2) end)
iconCircle:SetScript("OnMouseDown", function(self,button) if (button=="RightButton") then ToggleOP("Circle") end end)
iconCircle:SetScript('OnEnter', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("highlight") end end)
iconCircle:SetScript('OnLeave', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("fade") end end)

local iconStar = CreateFrame("Button", "iconStar", iconFrame)
iconStar:SetSize(25,25)
iconStar:SetPoint("LEFT", iconCircle, "RIGHT", 5, 0)
iconStar:SetNormalTexture("interface\\targetingframe\\ui-raidtargetingicons")
iconStar:GetNormalTexture():SetTexCoord(0,0.25,0,0.25)
iconStar:EnableMouse(true)
iconStar:SetScript("OnClick", function(self) SetRaidTargetIcon("target", 1) end)
iconStar:SetScript("OnMouseDown", function(self,button) if (button=="RightButton") then ToggleOP("Star") end end)
iconStar:SetScript('OnEnter', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("highlight") end end)
iconStar:SetScript('OnLeave', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("fade") end end)

------------- Toggle Buttons -------------

local ToggleSkull = CreateFrame("Button", "ToggleSkull", iconFrame)
ToggleSkull:SetSize(12,12)
ToggleSkull:SetPoint("TOP", iconSkull, "BOTTOM",0,-6)
ToggleSkull:SetNormalTexture("interface\\GLUES\\LOGIN\\Glues-CheckBox-Check")
ToggleSkull:EnableMouse(false)

local ToggleCross = CreateFrame("Button", "ToggleCross", iconFrame)
ToggleCross:SetSize(12,12)
ToggleCross:SetPoint("TOP", iconCross, "BOTTOM", 0, -6)
ToggleCross:SetNormalTexture("interface\\GLUES\\LOGIN\\Glues-CheckBox-Check")
ToggleCross:EnableMouse(false)

local ToggleSquare = CreateFrame("Button", "ToggleSquare", iconFrame)
ToggleSquare:SetSize(12,12)
ToggleSquare:SetPoint("TOP", iconSquare, "BOTTOM", 0, -6)
ToggleSquare:SetNormalTexture("interface\\GLUES\\LOGIN\\Glues-CheckBox-Check")
ToggleSquare:EnableMouse(false)

local ToggleMoon = CreateFrame("Button", "ToggleMoon", iconFrame)
ToggleMoon:SetSize(14,14)
ToggleMoon:SetPoint("TOP", iconMoon, "BOTTOM", 0, -6)
ToggleMoon:SetNormalTexture("interface\\GLUES\\LOGIN\\Glues-CheckBox-Check")
ToggleMoon:EnableMouse(false)

local ToggleTriangle = CreateFrame("Button", "ToggleTriangle", iconFrame)
ToggleTriangle:SetSize(14,14)
ToggleTriangle:SetPoint("TOP", iconTriangle, "BOTTOM", 0, -6)
ToggleTriangle:SetNormalTexture("interface\\GLUES\\LOGIN\\Glues-CheckBox-Check")
ToggleTriangle:EnableMouse(false)

local ToggleDiamond = CreateFrame("Button", "ToggleDiamond", iconFrame)
ToggleDiamond:SetSize(14,14)
ToggleDiamond:SetPoint("TOP", iconDiamond, "BOTTOM", 0, -6)
ToggleDiamond:SetNormalTexture("interface\\GLUES\\LOGIN\\Glues-CheckBox-Check")
ToggleDiamond:EnableMouse(false)

local ToggleCircle = CreateFrame("Button", "ToggleCircle", iconFrame)
ToggleCircle:SetSize(14,14)
ToggleCircle:SetPoint("TOP", iconCircle, "BOTTOM", 0, -6)
ToggleCircle:SetNormalTexture("interface\\GLUES\\LOGIN\\Glues-CheckBox-Check")
ToggleCircle:EnableMouse(false)

local ToggleStar = CreateFrame("Button", "ToggleStar", iconFrame)
ToggleStar:SetSize(14,14)
ToggleStar:SetPoint("TOP", iconStar, "BOTTOM", 0, -6)
ToggleStar:SetNormalTexture("interface\\GLUES\\LOGIN\\Glues-CheckBox-Check")
ToggleStar:EnableMouse(false)


------------- Readycheck Button -------------

local Readycheck = CreateFrame("Button", "Readycheck", ReadycheckFrame)
Readycheck:SetSize(25,25)
Readycheck:SetPoint("CENTER", ReadycheckFrame , "CENTER", 0, 0)
Readycheck:SetNormalTexture("Interface\\RAIDFRAME\\ReadyCheck-Ready")
Readycheck:EnableMouse(true)
Readycheck:SetScript("OnClick", function(self) DoReadyCheck() end)
Readycheck:SetScript('OnEnter', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("highlight") end end)
Readycheck:SetScript('OnLeave', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("fade") end end)



------------- Settings Button -------------
local settingsIcon = CreateFrame("Button", "settingsIcon", mainFrame)
settingsIcon:SetSize(13,13)
settingsIcon:SetPoint("CENTER", iconFrame , "BOTTOMRIGHT", 0, -3)
settingsIcon:SetNormalTexture("Interface\\GossipFrame\\BinderGossipIcon")
settingsIcon:EnableMouse(true)
settingsIcon:SetScript("OnClick", function(self) OpenOptions() end)
settingsIcon:SetScript('OnEnter', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("highlight") end end)
settingsIcon:SetScript('OnLeave', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("fade") end end)



------------- Announce Button -------------
local announceIcon = CreateFrame("Button", "announceIcon", AnnounceFrame)
announceIcon:SetSize(23,23)
announceIcon:SetPoint("CENTER", AnnounceFrame , "CENTER", 0, 0)
announceIcon:SetNormalTexture("Interface\\CURSOR\\Speak")

announceIcon:EnableMouse(true)
announceIcon:SetScript("OnClick", function(self) AnnounceOP() end)
announceIcon:SetScript('OnEnter', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("highlight") end end)
announceIcon:SetScript('OnLeave', function(self,button) if (MMSettings.use_fade) then MM_HighlightMe("fade") end end)

------------- Chat Parser -------------
SLASH_MM1 = '/MM'
function SlashCmdList.MM(msg, editbox)
	if (msg=="reset") then
		SetDefaultSettings()
		Init()
    elseif (msg=="options" or "settings") then
		OpenOptions()
	else
	DEFAULT_CHAT_FRAME:AddMessage("Use /mm options to open options, use /mm reset to reset to default")
	end
end

------------- OPs -------------

function Init()
	if (MMSettings == nil) then 
	SetDefaultSettings()
	else 
	InitVars()
	UpdateToggles()
	end
	PartyChecker()
	UpdateSettings()
end

function SetDefaultSettings()
	MMSettings = MMSettings_Default	
end

function InitVars()
if (MMSettings.mainFrameScale == nil) then
	MMSettings.mainFrameScale = 1
end
if (MMSettings.lock_frame == nil) then
	MMSettings.lock_frame = false
end
if (MMSettings.show_cog== nil) then
	MMSettings.show_cog = true
end
if (MMSettings.use_fade== nil) then
	MMSettings.use_fade = false
end
if (MMSettings.fade_num== nil) then
	MMSettings.fade_num = 0.2
end
	---other vars watchers go here
end

function UpdateSettings()
getglobal(ScaleSlider:GetName().."Text"):SetText(MM .." scale: "..math.floor((MMSettings.mainFrameScale*100)).."%")	
ScaleSlider:SetValue(MMSettings.mainFrameScale)
mainFrame:SetScale(MMSettings.mainFrameScale);
Use_Fade_Num:SetText(MMSettings.fade_num)
FadeInit()
CogInit()
end


function FadeInit()
	if (MMSettings.use_fade == false) then
		MM_HighlightMe("highlight")
	else
		MM_HighlightMe("no")
	end
end

function CogInit()
	if(MMSettings.show_cog) then 
		settingsIcon:Show()
	else
		settingsIcon:Hide()
	end
end

function UpdateToggles()
	if(MMSettings.locked_skull) then 
	ToggleSkull:Show()
	else
	ToggleSkull:Hide()
	end
	Announce_Skull_Toggle:SetChecked(not MMSettings.locked_skull)

	if(MMSettings.locked_cross) then 
	ToggleCross:Show()
	else
	ToggleCross:Hide()
	end
	Announce_Cross_Toggle:SetChecked(not MMSettings.locked_cross)
	
	if(MMSettings.locked_square) then 
	ToggleSquare:Show()	
	else
	ToggleSquare:Hide()
	end
	Announce_Square_Toggle:SetChecked(not MMSettings.locked_square)
	
	if(MMSettings.locked_moon) then 
	ToggleMoon:Show()
	else
	ToggleMoon:Hide()
	end
	Announce_Moon_Toggle:SetChecked(not MMSettings.locked_moon)
	
	if(MMSettings.locked_triangle) then 
	ToggleTriangle:Show()
	else
	ToggleTriangle:Hide()
	end
	Announce_Triangle_Toggle:SetChecked(not MMSettings.locked_triangle)

	if(MMSettings.locked_diamond) then 
	ToggleDiamond:Show()
	else
	ToggleDiamond:Hide()
	end
	Announce_Diamond_Toggle:SetChecked(not MMSettings.locked_diamond)

	if(MMSettings.locked_circle) then 
	ToggleCircle:Show()
	else
	ToggleCircle:Hide()
	end
	Announce_Circle_Toggle:SetChecked(not MMSettings.locked_circle)

	if(MMSettings.locked_star) then 
	ToggleStar:Show()
	else
	ToggleStar:Hide()
	end
	Announce_Star_Toggle:SetChecked(not MMSettings.locked_star)
	
	Lock_Toggle:SetChecked(MMSettings.lock_frame)
	Show_Options_Cog:SetChecked(MMSettings.show_cog)
	Use_Fade:SetChecked(MMSettings.use_fade)
end

function ToggleOP(symbol)
	if (symbol == "Skull") then
		if (MMSettings.locked_skull) then
		MMSettings.locked_skull = false
		else
		MMSettings.locked_skull = true
		end
	end
	if (symbol == "Cross") then
		if (MMSettings.locked_cross) then
		MMSettings.locked_cross = false
		else
		MMSettings.locked_cross= true
		end
	end
	if (symbol == "Square") then
		if (MMSettings.locked_square) then
		MMSettings.locked_square = false
		else
		MMSettings.locked_square= true
		end
	end
	if (symbol == "Moon") then
		if (MMSettings.locked_moon) then
		MMSettings.locked_moon = false
		else
		MMSettings.locked_moon = true
		end
	end
	if (symbol == "Triangle") then
		if (MMSettings.locked_triangle) then
		MMSettings.locked_triangle = false
		else
		MMSettings.locked_triangle = true
		end
	end
	if (symbol == "Diamond") then
		if (MMSettings.locked_diamond) then
		MMSettings.locked_diamond = false
		else
		MMSettings.locked_diamond = true
		end
	end
	if (symbol == "Circle") then
		if (MMSettings.locked_circle) then
		MMSettings.locked_circle= false
		else
		MMSettings.locked_circle = true
		end
	end
	if (symbol == "Star") then
		if (MMSettings.locked_star) then
		MMSettings.locked_star= false
		else
		MMSettings.locked_star = true
		end
	end
	UpdateToggles()
end

----------------- Party Checker ----------
function PartyChecker()   
    if (IsInGroup()) then --in party
			if (IsInRaid()) then -- in raid
				if (UnitIsGroupLeader("player") or UnitIsGroupAssistant("player")) then
					ReadycheckFrame:SetAlpha(1)
					AnnounceFrame:SetAlpha(1)
					enable_readycheck = true
					enable_announcer = true
					Readycheck:SetEnabled(true)
					announceIcon:SetEnabled(true)
				else
					ReadycheckFrame:SetAlpha(0.2)
					AnnounceFrame:SetAlpha(0.2)
					enable_readycheck = false
					enable_announcer = false
					Readycheck:SetEnabled(false)
					announceIcon:SetEnabled(false)
				end
			else -- IN APARTY
				if (UnitIsGroupLeader("player")) then
					ReadycheckFrame:SetAlpha(1)
					AnnounceFrame:SetAlpha(1)
					enable_readycheck = true
					enable_announcer = true
					Readycheck:SetEnabled(true)
					announceIcon:SetEnabled(true)
				else
					ReadycheckFrame:SetAlpha(0.2)
					AnnounceFrame:SetAlpha(0.2)
					enable_readycheck = false
					enable_announcer = false
					Readycheck:SetEnabled(false)
					announceIcon:SetEnabled(false)
				end
			end
		else --solo
			ReadycheckFrame:SetAlpha(0.2)
			AnnounceFrame:SetAlpha(1)
			enable_readycheck = false
			enable_announcer = true
			Readycheck:SetEnabled(false)
			announceIcon:SetEnabled(true)
		end
   
end


function OpenOptions ()
InterfaceOptionsFrame_OpenToCategory(MarkMeOptions.panel)
InterfaceOptionsFrame_OpenToCategory(MarkMeOptions.panel)
end


function AnnounceOP ()
if (MMSettings.locked_skull and MMSettings.locked_cross and MMSettings.locked_square and MMSettings.locked_moon and	MMSettings.locked_triangle and MMSettings.locked_diamond and MMSettings.locked_circle and MMSettings.locked_star) then
	print ("No marks set for announce")	
	else
	if IsInGroup() then
			if IsInRaid() then 
				if UnitIsGroupLeader("player") or UnitIsGroupAssistant("player") then		-- ABLE TO MARK
					SendChatMessage(AnnounceComposer(), "RAID", nil) 
				end
			else
				SendChatMessage(AnnounceComposer(), "PARTY", nil) 
			end	
		else
			print ("Preview in solo mode. Your message won't be sent")
			print (AnnounceComposer())
		end
end
end

function AnnounceComposer()
local AnnounceString = ""
	if (MMSettings.locked_skull ~= true)  then
		AnnounceString = MMSettings.skull_line
	end
	if (MMSettings.locked_cross ~= true)  then
		if (AnnounceString ~= "") then
		AnnounceString = (AnnounceString.. ", " ..MMSettings.cross_line)
		else
		AnnounceString = MMSettings.cross_line
		end
	end
	if (MMSettings.locked_square ~= true)  then
		if (AnnounceString ~= "") then
		AnnounceString = (AnnounceString.. ", " ..MMSettings.square_line)
		else
		AnnounceString = MMSettings.square_line
		end
	end
	if (MMSettings.locked_moon ~= true)  then
		if (AnnounceString ~= "") then
		AnnounceString = (AnnounceString.. ", " ..MMSettings.moon_line)
		else
		AnnounceString = MMSettings.moon_line
		end
	end
	if (MMSettings.locked_triangle ~= true)  then
		if (AnnounceString ~= "") then
		AnnounceString = (AnnounceString.. ", " ..MMSettings.triangle_line)
		else
		AnnounceString = MMSettings.triangle_line
		end
	end
	if (MMSettings.locked_diamond ~= true)  then
		if (AnnounceString ~= "") then
		AnnounceString = (AnnounceString.. ", " ..MMSettings.diamond_line)
		else
		AnnounceString = MMSettings.diamond_line
		end
	end
	if (MMSettings.locked_circle ~= true)  then
		if (AnnounceString ~= "") then
		AnnounceString = (AnnounceString.. ", " ..MMSettings.circle_line)
		else
		AnnounceString = MMSettings.circle_line
		end
	end
	if (MMSettings.locked_star ~= true)  then
		if (AnnounceString ~= "") then
		AnnounceString = (AnnounceString.. ", " ..MMSettings.star_line)
		else
		AnnounceString = MMSettings.star_line
		end
	end
	
return (AnnounceString)
end

function EchoNYI()
print("This feature is coming soon")
end

------------- Settings -------------

MarkMeOptions = {};
MarkMeOptions.panel = CreateFrame( "Frame", "MarkMeOptions", InterfaceOptionsFramePanelContainer );
MarkMeOptions.panel.name = "Mark Me";
MarkMeOptions.panel.okay = function(self) MM_Save(); end
MarkMeOptions.panel.cancel = function(self) MM_Save(); end
MarkMeOptions.panel.default = function(self) SetDefaultSettings(); MM_UpdateAnnouncer(); end
MarkMeOptions.panel.refresh = function(self) MM_Save(); MM_UpdateAnnouncer(); end
InterfaceOptions_AddCategory(MarkMeOptions.panel);

local OptionsText = MarkMeOptions.panel:CreateFontString("OptionsText", "OVERLAY", "ChatFontNormal")
OptionsText:SetPoint("TOP", MarkMeOptions.panel, "TOP",0,-10)
OptionsText:SetText(MM.."|cffe1a500 Options")
OptionsText:SetFont("Fonts\\ARIALN.TTF", 16)

local Lock_Toggle = CreateFrame("CheckButton", "Lock_Toggle", MarkMeOptions.panel, "UICheckButtonTemplate")
Lock_Toggle:SetPoint("TOPLEFT", MarkMeOptions.panel, "TOPLEFT", 20,-40)
Lock_Toggle:SetSize(25,20)
Lock_Toggle:SetScript("OnClick", function(self) MM_lock_toggle() end)
local Lock_Toggle_Text = MarkMeOptions.panel:CreateFontString("Lock_Toggle_Text", "OVERLAY", "ChatFontNormal")
Lock_Toggle_Text:SetText("Lock frame position")
Lock_Toggle_Text:SetPoint("LEFT", Lock_Toggle, "RIGHT", 10,0)

local Show_Options_Cog = CreateFrame("CheckButton", "Show_Options_Cog", MarkMeOptions.panel, "UICheckButtonTemplate")
Show_Options_Cog:SetPoint("LEFT", Lock_Toggle, "BOTTOMLEFT",0,-15)
Show_Options_Cog:SetSize(20,20)
Show_Options_Cog:SetScript("OnClick", function(self) MM_show_options_cog_toggle() end)
local Show_Options_Cog_Text = MarkMeOptions.panel:CreateFontString("Show_Options_Cog_Text", "OVERLAY", "ChatFontNormal")
Show_Options_Cog_Text:SetText("Show options cog")
Show_Options_Cog_Text:SetPoint("LEFT", Show_Options_Cog, "RIGHT", 10,0)

local Use_Fade = CreateFrame("CheckButton", "Use_Fade", MarkMeOptions.panel, "UICheckButtonTemplate")
Use_Fade:SetPoint("LEFT", Show_Options_Cog, "BOTTOMLEFT",0,-15)
Use_Fade:SetSize(20,20)
Use_Fade:SetScript("OnClick", function(self) MM_use_fade_toggle() end)
local Use_Fade_Text = MarkMeOptions.panel:CreateFontString("Use_Fade_Text", "OVERLAY", "ChatFontNormal")
Use_Fade_Text:SetText("Use fade")
Use_Fade_Text:SetPoint("LEFT", Use_Fade, "RIGHT", 10,0)
local Use_Fade_Num = CreateFrame("EditBox", "Use_Fade_Num", MarkMeOptions.panel, "InputBoxTemplate")
Use_Fade_Num:SetPoint("LEFT", Use_Fade_Text, "RIGHT", 10,0)
Use_Fade_Num:SetSize(20,20)
Use_Fade_Num:SetNumeric()
Use_Fade_Num:SetScript("OnEnterPressed", function(self) self:ClearFocus(); MM_Use_fade_num() end)
Use_Fade_Num:SetFont("Fonts\\ARIALN.TTF", 12)



local ScaleSlider = CreateFrame("Slider", "ScaleSlider", MarkMeOptions.panel, "OptionsSliderTemplate")
ScaleSlider:SetPoint("LEFT", Use_Fade, "BOTTOMLEFT",0,-35)
ScaleSlider:SetSize(180,16)
ScaleSlider:SetMinMaxValues(0.5,1.5)
ScaleSlider:SetValue(1)
ScaleSlider:SetValueStep(0.5)
ScaleSlider:SetOrientation("HORIZONTAL")
ScaleSlider:SetScript("OnValueChanged", function(self) MM_Scale(self) end)
ScaleSlider:SetScript("OnMouseUp", function(self) MMSettings.mainFrameScale = (ScaleSlider:GetValue()) end)
ScaleSlider:SetScript("OnLoad", function(self) MM_Scale(self) end)
 getglobal(ScaleSlider:GetName() .. 'Low'):SetText('50%');
 getglobal(ScaleSlider:GetName() .. 'High'):SetText('150%');

local Announce_Skull_Toggle = CreateFrame("CheckButton", "Announce_Skull_Toggle", MarkMeOptions.panel, "UICheckButtonTemplate")
Announce_Skull_Toggle:SetPoint("LEFT", ScaleSlider, "BOTTOMLEFT",0,-35)
Announce_Skull_Toggle:SetSize(20,20)
Announce_Skull_Toggle:SetScript("OnClick", function(self) ToggleOP("Skull") end)
local Announce_Skull_Msg = CreateFrame("EditBox", "Announce_Skull_Msg", MarkMeOptions.panel, "InputBoxTemplate")
Announce_Skull_Msg:SetPoint("LEFT", Announce_Skull_Toggle, "RIGHT", 10,0)
Announce_Skull_Msg:SetSize(320,20)
Announce_Skull_Msg:SetFont("Fonts\\ARIALN.TTF", 12)
local Announce_Skull_Icon = CreateFrame("Button", "Announce_Skull_Icon", MarkMeOptions.panel)
Announce_Skull_Icon:SetSize(20,20)
Announce_Skull_Icon:SetPoint("LEFT", Announce_Skull_Msg, "Right",5,0)
Announce_Skull_Icon:SetNormalTexture("interface\\targetingframe\\ui-raidtargetingicons")
Announce_Skull_Icon:GetNormalTexture():SetTexCoord(0.75,1,0.25,0.5)
Announce_Skull_Icon:EnableMouse(false)

local Announce_Cross_Toggle = CreateFrame("CheckButton", "Announce_Cross_Toggle", MarkMeOptions.panel, "UICheckButtonTemplate")
Announce_Cross_Toggle:SetPoint("TOPLEFT", Announce_Skull_Toggle, "TOPLEFT",0,-30)
Announce_Cross_Toggle:SetSize(20,20)
Announce_Cross_Toggle:SetScript("OnClick", function(self) ToggleOP("Cross") end)
local Announce_Cross_Msg = CreateFrame("EditBox", "Announce_Cross_Msg", MarkMeOptions.panel, "InputBoxTemplate")
Announce_Cross_Msg:SetPoint("LEFT", Announce_Cross_Toggle, "RIGHT", 10,0)
Announce_Cross_Msg:SetSize(320,20)
Announce_Cross_Msg:SetFont("Fonts\\ARIALN.TTF", 12)
local Announce_Cross_Icon = CreateFrame("Button", "Announce_Cross_Icon", MarkMeOptions.panel)
Announce_Cross_Icon:SetSize(20,20)
Announce_Cross_Icon:SetPoint("LEFT", Announce_Cross_Msg, "Right",5,0)
Announce_Cross_Icon:SetNormalTexture("interface\\targetingframe\\ui-raidtargetingicons")
Announce_Cross_Icon:GetNormalTexture():SetTexCoord(0.5,0.75,0.25,0.5)
Announce_Cross_Icon:EnableMouse(false)

local Announce_Square_Toggle = CreateFrame("CheckButton", "Announce_Square_Toggle", MarkMeOptions.panel, "UICheckButtonTemplate")
Announce_Square_Toggle:SetPoint("TOPLEFT", Announce_Cross_Toggle, "TOPLEFT",0,-30)
Announce_Square_Toggle:SetSize(20,20)
Announce_Square_Toggle:SetScript("OnClick", function(self) ToggleOP("Square") end)
local Announce_Square_Msg = CreateFrame("EditBox", "Announce_Square_Msg", MarkMeOptions.panel, "InputBoxTemplate")
Announce_Square_Msg:SetPoint("LEFT", Announce_Square_Toggle, "RIGHT", 10,0)
Announce_Square_Msg:SetSize(320,20)
Announce_Square_Msg:SetFont("Fonts\\ARIALN.TTF", 12)
local Announce_Square_Icon = CreateFrame("Button", "Announce_Square_Icon", MarkMeOptions.panel)
Announce_Square_Icon:SetSize(20,20)
Announce_Square_Icon:SetPoint("LEFT", Announce_Square_Msg, "Right",5,0)
Announce_Square_Icon:SetNormalTexture("interface\\targetingframe\\ui-raidtargetingicons")
Announce_Square_Icon:GetNormalTexture():SetTexCoord(0.25,0.5,0.25,0.5)
Announce_Square_Icon:EnableMouse(false)

local Announce_Moon_Toggle = CreateFrame("CheckButton", "Announce_Moon_Toggle", MarkMeOptions.panel, "UICheckButtonTemplate")
Announce_Moon_Toggle:SetPoint("TOPLEFT", Announce_Square_Toggle, "TOPLEFT",0,-30)
Announce_Moon_Toggle:SetSize(20,20)
Announce_Moon_Toggle:SetScript("OnClick", function(self) ToggleOP("Moon") end)
local Announce_Moon_Msg = CreateFrame("EditBox", "Announce_Moon_Msg", MarkMeOptions.panel, "InputBoxTemplate")
Announce_Moon_Msg:SetPoint("LEFT", Announce_Moon_Toggle, "RIGHT", 10,0)
Announce_Moon_Msg:SetSize(320,20)
Announce_Moon_Msg:SetFont("Fonts\\ARIALN.TTF", 12)
local Announce_Moon_Icon = CreateFrame("Button", "Announce_Moon_Icon", MarkMeOptions.panel)
Announce_Moon_Icon:SetSize(20,20)
Announce_Moon_Icon:SetPoint("LEFT", Announce_Moon_Msg, "Right",5,0)
Announce_Moon_Icon:SetNormalTexture("interface\\targetingframe\\ui-raidtargetingicons")
Announce_Moon_Icon:GetNormalTexture():SetTexCoord(0,0.25,0.25,0.5)
Announce_Moon_Icon:EnableMouse(false)

local Announce_Triangle_Toggle = CreateFrame("CheckButton", "Announce_Triangle_Toggle", MarkMeOptions.panel, "UICheckButtonTemplate")
Announce_Triangle_Toggle:SetPoint("TOPLEFT", Announce_Moon_Toggle, "TOPLEFT",0,-30)
Announce_Triangle_Toggle:SetSize(20,20)
Announce_Triangle_Toggle:SetScript("OnClick", function(self) ToggleOP("Triangle") end)
local Announce_Triangle_Msg = CreateFrame("EditBox", "Announce_Triangle_Msg", MarkMeOptions.panel, "InputBoxTemplate")
Announce_Triangle_Msg:SetPoint("LEFT", Announce_Triangle_Toggle, "RIGHT", 10,0)
Announce_Triangle_Msg:SetSize(320,20)
Announce_Triangle_Msg:SetFont("Fonts\\ARIALN.TTF", 12)
local Announce_Triangle_Icon = CreateFrame("Button", "Announce_Triangle_Icon", MarkMeOptions.panel)
Announce_Triangle_Icon:SetSize(20,20)
Announce_Triangle_Icon:SetPoint("LEFT", Announce_Triangle_Msg, "Right",5,0)
Announce_Triangle_Icon:SetNormalTexture("interface\\targetingframe\\ui-raidtargetingicons")
Announce_Triangle_Icon:GetNormalTexture():SetTexCoord(0.75,1,0,0.25)
Announce_Triangle_Icon:EnableMouse(false)

local Announce_Diamond_Toggle = CreateFrame("CheckButton", "Announce_Diamond_Toggle", MarkMeOptions.panel, "UICheckButtonTemplate")
Announce_Diamond_Toggle:SetPoint("TOPLEFT", Announce_Triangle_Toggle, "TOPLEFT",0,-30)
Announce_Diamond_Toggle:SetSize(20,20)
Announce_Diamond_Toggle:SetScript("OnClick", function(self) ToggleOP("Diamond") end)
local Announce_Diamond_Msg = CreateFrame("EditBox", "Announce_Diamond_Msg", MarkMeOptions.panel, "InputBoxTemplate")
Announce_Diamond_Msg:SetPoint("LEFT", Announce_Diamond_Toggle, "RIGHT", 10,0)
Announce_Diamond_Msg:SetSize(320,20)
Announce_Diamond_Msg:SetFont("Fonts\\ARIALN.TTF", 12)
local Announce_Diamond_Icon = CreateFrame("Button", "Announce_Diamond_Icon", MarkMeOptions.panel)
Announce_Diamond_Icon:SetSize(20,20)
Announce_Diamond_Icon:SetPoint("LEFT", Announce_Diamond_Msg, "Right",5,0)
Announce_Diamond_Icon:SetNormalTexture("interface\\targetingframe\\ui-raidtargetingicons")
Announce_Diamond_Icon:GetNormalTexture():SetTexCoord(0.5,0.75,0,0.25)
Announce_Diamond_Icon:EnableMouse(false)

local Announce_Circle_Toggle = CreateFrame("CheckButton", "Announce_Circle_Toggle", MarkMeOptions.panel, "UICheckButtonTemplate")
Announce_Circle_Toggle:SetPoint("TOPLEFT", Announce_Diamond_Toggle, "TOPLEFT",0,-30)
Announce_Circle_Toggle:SetSize(20,20)
Announce_Circle_Toggle:SetScript("OnClick", function(self) ToggleOP("Circle") end)
local Announce_Circle_Msg = CreateFrame("EditBox", "Announce_Circle_Msg", MarkMeOptions.panel, "InputBoxTemplate")
Announce_Circle_Msg:SetPoint("LEFT", Announce_Circle_Toggle, "RIGHT", 10,0)
Announce_Circle_Msg:SetSize(320,20)
Announce_Circle_Msg:SetFont("Fonts\\ARIALN.TTF", 12)
local Announce_Circle_Icon = CreateFrame("Button", "Announce_Circle_Icon", MarkMeOptions.panel)
Announce_Circle_Icon:SetSize(20,20)
Announce_Circle_Icon:SetPoint("LEFT", Announce_Circle_Msg, "Right",5,0)
Announce_Circle_Icon:SetNormalTexture("interface\\targetingframe\\ui-raidtargetingicons")
Announce_Circle_Icon:GetNormalTexture():SetTexCoord(0.25,0.5,0,0.25)
Announce_Circle_Icon:EnableMouse(false)

local Announce_Star_Toggle = CreateFrame("CheckButton", "Announce_Star_Toggle", MarkMeOptions.panel, "UICheckButtonTemplate")
Announce_Star_Toggle:SetPoint("TOPLEFT", Announce_Circle_Toggle, "TOPLEFT",0,-30)
Announce_Star_Toggle:SetSize(20,20)
Announce_Star_Toggle:SetScript("OnClick", function(self) ToggleOP("Star") end)
local Announce_Star_Msg = CreateFrame("EditBox", "Announce_Star_Msg", MarkMeOptions.panel, "InputBoxTemplate")
Announce_Star_Msg:SetPoint("LEFT", Announce_Star_Toggle, "RIGHT", 10,0)
Announce_Star_Msg:SetSize(320,20)
Announce_Star_Msg:SetFont("Fonts\\ARIALN.TTF", 12)
local Announce_Star_Icon = CreateFrame("Button", "Announce_Star_Icon", MarkMeOptions.panel)
Announce_Star_Icon:SetSize(20,20)
Announce_Star_Icon:SetPoint("LEFT", Announce_Star_Msg, "Right",5,0)
Announce_Star_Icon:SetNormalTexture("interface\\targetingframe\\ui-raidtargetingicons")
Announce_Star_Icon:GetNormalTexture():SetTexCoord(0,0.25,0,0.25)
Announce_Star_Icon:EnableMouse(false)

------------- Settings  OPs -------------
function MM_lock_toggle()
MMSettings.lock_frame = not MMSettings.lock_frame
end

function MM_show_options_cog_toggle()
CogInit()
end

function MM_use_fade_toggle()
MMSettings.use_fade =  not MMSettings.use_fade
FadeInit()
end

function MM_Use_fade_num()
MMSettings.fade_num = (Use_Fade_Num:GetNumber())
FadeInit()
end

function MM_Scale(self)
	if self == nil then return end
    	MMSettings.mainFrameScale = (self:GetValue());
		getglobal(ScaleSlider:GetName().."Text"):SetText(MM .." scale: "..math.floor((MMSettings.mainFrameScale*100)).."%")		
        mainFrame:SetScale(MMSettings.mainFrameScale);
end

function MM_Save()
MMSettings.skull_line = (Announce_Skull_Msg:GetText())
MMSettings.cross_line = (Announce_Cross_Msg:GetText())
MMSettings.square_line = (Announce_Square_Msg:GetText())
MMSettings.moon_line = (Announce_Moon_Msg:GetText())
MMSettings.triangle_line = (Announce_Triangle_Msg:GetText())
MMSettings.diamond_line = (Announce_Diamond_Msg:GetText())
MMSettings.circle_line = (Announce_Circle_Msg:GetText())
MMSettings.star_line = (Announce_Star_Msg:GetText())
MMSettings.fade_num = (Use_Fade_Num:GetNumber())
end

function MM_UpdateAnnouncer()
Announce_Skull_Msg:SetText(MMSettings.skull_line)
Announce_Skull_Msg:SetCursorPosition(0)
Announce_Cross_Msg:SetText(MMSettings.cross_line)
Announce_Cross_Msg:SetCursorPosition(0)
Announce_Square_Msg:SetText(MMSettings.square_line)
Announce_Square_Msg:SetCursorPosition(0)
Announce_Moon_Msg:SetText(MMSettings.moon_line)
Announce_Moon_Msg:SetCursorPosition(0)
Announce_Triangle_Msg:SetText(MMSettings.triangle_line)
Announce_Triangle_Msg:SetCursorPosition(0)
Announce_Diamond_Msg:SetText(MMSettings.diamond_line)
Announce_Diamond_Msg:SetCursorPosition(0)
Announce_Circle_Msg:SetText(MMSettings.circle_line)
Announce_Circle_Msg:SetCursorPosition(0)
Announce_Star_Msg:SetText(MMSettings.star_line)
Announce_Star_Msg:SetCursorPosition(0)
end

function MM_HighlightMe (state)
		if (state == "highlight") then
	---	iconFrame:SetAlpha(1)
		mainFrame:SetAlpha(1)
			if (enable_readycheck) then
			ReadycheckFrame:SetAlpha(1)
			end
			if (enable_announcer) then
			AnnounceFrame:SetAlpha(1)
			end
		else
		mainFrame:SetAlpha(MMSettings.fade_num)
	---	iconFrame:SetAlpha(0.2)
	---	ReadycheckFrame:SetAlpha(0.2)
	---	AnnounceFrame:SetAlpha(0.2)
		end
end

------------- Events -------------
local MM_OnUpdate = CreateFrame("Frame")
MM_OnUpdate:RegisterEvent("ADDON_LOADED")
MM_OnUpdate:RegisterEvent("PLAYER_LOGIN")
MM_OnUpdate:RegisterEvent("PLAYER_LOGOUT")
MM_OnUpdate:RegisterEvent("GROUP_ROSTER_UPDATE")


MM_OnUpdate:SetScript("OnEvent", function(self,event,addon,...)
	
	if (event=="ADDON_LOADED" and addon=="MarkMe") then
	Init();
	PartyChecker()
	end
	
	if (event=="PLAYER_LOGIN") then
		MM_UpdateAnnouncer()
	end

	if (event=="PLAYER_LOGOUT") then
		MM_Save()
	end
	
	if (event=="GROUP_ROSTER_UPDATE") then
		PartyChecker()
    end
end
)