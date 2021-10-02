local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames')

local CreateFrame = CreateFrame
function UF.HealthClipFrame_HealComm(frame)
	if frame.HealthPrediction then
		UF:SetAlpha_HealComm(frame.HealthPrediction, 1)
	end
end

function UF:SetAlpha_HealComm(obj, alpha)
	obj.myBar:SetAlpha(alpha)
	obj.otherBar:SetAlpha(alpha)
end

function UF:SetTexture_HealComm(obj, texture)
	if type(texture) == 'number' then texture = E.media.blankTex end

	obj.myBar:SetStatusBarTexture(texture)
	obj.otherBar:SetStatusBarTexture(texture)
end

function UF:SetFrameLevel_HealComm(obj, level)
	obj.myBar:SetFrameLevel(level)
	obj.otherBar:SetFrameLevel(level)
end

function UF:Construct_HealComm(frame)
	local health = frame.Health
	local parent = health.ClipFrame

	local myBar = CreateFrame('StatusBar', nil, parent)
	local otherBar = CreateFrame('StatusBar', nil, parent)

	local prediction = {
		myBar = myBar,
		otherBar = otherBar,
		maxOverflow = 1,
		health = health,
		parent = parent,
		frame = frame
	}

	UF:SetAlpha_HealComm(prediction, 0)
	UF:SetFrameLevel_HealComm(prediction, 11)
	UF:SetTexture_HealComm(prediction, E.media.blankTex)

	return prediction
end

function UF:SetSize_HealComm(frame)
	local health = frame.Health
	local pred = frame.HealthPrediction
	local orientation = health:GetOrientation()

	local db = frame.db.healPrediction
	local width, height = health:GetSize()

	if orientation == 'HORIZONTAL' then
		local barHeight = db.height
		if barHeight == -1 or barHeight > height then barHeight = height end

		pred.myBar:SetSize(width, barHeight)
		pred.otherBar:SetSize(width, barHeight)
		pred.parent:SetSize(width * (pred.maxOverflow or 0), height)
	else
		local barWidth = db.height -- this is really width now not height
		if barWidth == -1 or barWidth > width then barWidth = width end

		pred.myBar:SetSize(barWidth, height)
		pred.otherBar:SetSize(barWidth, height)
		pred.parent:SetSize(width, height * (pred.maxOverflow or 0))
	end
end

function UF:Configure_HealComm(frame)
	local db = frame.db.healPrediction
	if db and db.enable then
		local pred = frame.HealthPrediction
		local parent = pred.parent
		local myBar = pred.myBar
		local otherBar = pred.otherBar

		local colors = UF.db.colors.healPrediction
		pred.maxOverflow = 1 + (colors.maxOverflow or 0)

		if not frame:IsElementEnabled('HealthPrediction') then
			frame:EnableElement('HealthPrediction')
		end

		local health = frame.Health
		local orientation = health:GetOrientation()
		local reverseFill = health:GetReverseFill()
		local healthBarTexture = health:GetStatusBarTexture()

		pred.reverseFill = reverseFill
		pred.healthBarTexture = healthBarTexture
		pred.myBarTexture = myBar:GetStatusBarTexture()
		pred.otherBarTexture = otherBar:GetStatusBarTexture()

		UF:SetTexture_HealComm(pred, UF.db.colors.transparentHealth and E.media.blankTex or healthBarTexture:GetTexture())

		myBar:SetReverseFill(reverseFill)
		otherBar:SetReverseFill(reverseFill)

		myBar:SetStatusBarColor(colors.personal.r, colors.personal.g, colors.personal.b, colors.personal.a)
		otherBar:SetStatusBarColor(colors.others.r, colors.others.g, colors.others.b, colors.others.a)

		myBar:SetOrientation(orientation)
		otherBar:SetOrientation(orientation)

		if orientation == 'HORIZONTAL' then
			local p1 = reverseFill and 'RIGHT' or 'LEFT'
			local p2 = reverseFill and 'LEFT' or 'RIGHT'

			local anchor = db.anchorPoint
			pred.anchor, pred.anchor1, pred.anchor2 = anchor, p1, p2

			myBar:ClearAllPoints()
			myBar:Point(anchor, health)
			myBar:Point(p1, healthBarTexture, p2)

			otherBar:ClearAllPoints()
			otherBar:Point(anchor, health)
			otherBar:Point(p1, pred.myBarTexture, p2)

			parent:ClearAllPoints()
			parent:Point(p1, health, p1)
		else
			local p1 = reverseFill and 'TOP' or 'BOTTOM'
			local p2 = reverseFill and 'BOTTOM' or 'TOP'

			-- anchor converts while the health is in vertical orientation to be able to use a height
			-- (well in this case, width) other than -1 which positions the absorb on the left or right side
			local anchor = (db.anchorPoint == 'BOTTOM' and 'RIGHT') or (db.anchorPoint == 'TOP' and 'LEFT') or db.anchorPoint
			pred.anchor, pred.anchor1, pred.anchor2 = anchor, p1, p2

			myBar:ClearAllPoints()
			myBar:Point(anchor, health)
			myBar:Point(p1, healthBarTexture, p2)

			otherBar:ClearAllPoints()
			otherBar:Point(anchor, health)
			otherBar:Point(p1, pred.myBarTexture, p2)

			parent:ClearAllPoints()
			parent:Point(p1, health, p1)
		end
	elseif frame:IsElementEnabled('HealthPrediction') then
		frame:DisableElement('HealthPrediction')
	end

	UF:SetSize_HealComm(frame)
end
