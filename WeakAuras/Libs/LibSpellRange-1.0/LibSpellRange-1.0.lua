--- = Background =
-- Blizzard's IsSpellInRange API has always been very limited - you either must have the name of the spell, or its spell book ID. Checking directly by spellID is simply not possible.
-- Now, in Mists of Pandaria, Blizzard changed the way that many talents and specialization spells work - instead of giving you a new spell when leaned, they replace existing spells. These replacement spells do not work with Blizzard's IsSpellInRange function whatsoever; this limitation is what prompted the creation of this lib.
-- = Usage = 
-- **LibSpellRange-1.0** exposes an enhanced version of IsSpellInRange that:
-- * Allows ranged checking based on both spell name and spellID.
-- * Works correctly with replacement spells that will not work using Blizzard's IsSpellInRange method alone.
--
-- @class file
-- @name LibSpellRange-1.0.lua

local major = "SpellRange-1.0"
local minor = 18

assert(LibStub, format("%s requires LibStub.", major))

local Lib = LibStub:NewLibrary(major, minor)
if not Lib then return end

local tonumber = _G.tonumber
local strlower = _G.strlower
local wipe = _G.wipe
local type = _G.type
local select = _G.select

local GetSpellTabInfo = _G.GetSpellTabInfo
local GetNumSpellTabs = _G.GetNumSpellTabs
local GetSpellBookItemInfo = _G.GetSpellBookItemInfo
local GetSpellBookItemName = _G.GetSpellBookItemName
local GetSpellLink = _G.GetSpellLink
local GetSpellInfo = _G.GetSpellInfo

local IsSpellInRange = _G.IsSpellInRange
local SpellHasRange = _G.SpellHasRange

local UnitExists = _G.UnitExists
local GetPetActionInfo = _G.GetPetActionInfo
local UnitIsUnit = _G.UnitIsUnit

-- isNumber is basically a tonumber cache for maximum efficiency
Lib.isNumber = Lib.isNumber or setmetatable({}, {
	__mode = "kv",
	__index = function(t, i)
		local o = tonumber(i) or false
		t[i] = o
		return o
end})
local isNumber = Lib.isNumber

-- strlower cache for maximum efficiency
Lib.strlowerCache = Lib.strlowerCache or setmetatable(
{}, {
	__index = function(t, i)
		if not i then return end
		local o
		if type(i) == "number" then
			o = i
		else
			o = strlower(i)
		end
		t[i] = o
		return o
	end,
}) local strlowerCache = Lib.strlowerCache

-- Matches lowercase player spell names to their spellBookID
Lib.spellsByName_spell = Lib.spellsByName_spell or {}
local spellsByName_spell = Lib.spellsByName_spell

-- Matches player spellIDs to their spellBookID
Lib.spellsByID_spell = Lib.spellsByID_spell or {}
local spellsByID_spell = Lib.spellsByID_spell

-- Matches lowercase pet spell names to their spellBookID
Lib.spellsByName_pet = Lib.spellsByName_pet or {}
local spellsByName_pet = Lib.spellsByName_pet

-- Matches pet spellIDs to their spellBookID
Lib.spellsByID_pet = Lib.spellsByID_pet or {}
local spellsByID_pet = Lib.spellsByID_pet

-- Matches pet spell names to their pet action bar slot
Lib.actionsByName_pet = Lib.actionsByName_pet or {}
local actionsByName_pet = Lib.actionsByName_pet

-- Matches pet spell IDs to their pet action bar slot
Lib.actionsById_pet = Lib.actionsById_pet or {}
local actionsById_pet = Lib.actionsById_pet

-- Caches whether a pet spell has been observed to ever have had a range.
-- Since this should never change for any particular spell,
-- it is not wiped.
Lib.petSpellHasRange = Lib.petSpellHasRange or {}
local petSpellHasRange = Lib.petSpellHasRange

-- Updates spellsByName and spellsByID
local function UpdateBook(bookType)
	local max = 0
	for i = 1, GetNumSpellTabs() do
		local _, _, offs, numspells, _, specId = GetSpellTabInfo(i)
		if specId == 0 then
			max = offs + numspells
		end
	end

	local spellsByName = Lib["spellsByName_" .. bookType]
	local spellsByID = Lib["spellsByID_" .. bookType]
	
	wipe(spellsByName)
	wipe(spellsByID)
	
	for spellBookID = 1, max do
		local type, baseSpellID = GetSpellBookItemInfo(spellBookID, bookType)
		
		if type == "SPELL" or type == "PETACTION" then
			local currentSpellName, _, currentSpellID = GetSpellBookItemName(spellBookID, bookType)
			if not currentSpellID then
				local link = GetSpellLink(currentSpellName)
				currentSpellID = tonumber(link and link:gsub("|", "||"):match("spell:(%d+)"))
			end

			-- For each entry we add to a table,
			-- only add it if there isn't anything there already.
			-- This prevents weird passives from overwriting real, legit spells.
			-- For example, in WoW 7.3.5 the ret paladin mastery 
			-- was coming back with a base spell named "Judgement",
			-- which was overwriting the real "Judgement".
			-- Passives usually come last in the spellbook,
			-- so this should work just fine as a workaround.
			-- This issue with "Judgement" is gone in BFA because the mastery changed.
			
			if currentSpellName and not spellsByName[strlower(currentSpellName)] then
				spellsByName[strlower(currentSpellName)] = spellBookID
			end
			if currentSpellID and not spellsByID[currentSpellID] then
				spellsByID[currentSpellID] = spellBookID
			end
			
			if type == "SPELL" then
				-- PETACTION (pet abilities) don't return a spellID for baseSpellID,
				-- so base spells only work for proper player spells.
				local baseSpellName = GetSpellInfo(baseSpellID)
				if baseSpellName and not spellsByName[strlower(baseSpellName)] then
					spellsByName[strlower(baseSpellName)] = spellBookID
				end
				if baseSpellID and not spellsByID[baseSpellID] then
					spellsByID[baseSpellID] = spellBookID
				end
			end
		end
	end
end

local function UpdatePetBar()
	wipe(actionsByName_pet)
	wipe(actionsById_pet)
	if not UnitExists("pet") then return end

	for i = 1, NUM_PET_ACTION_SLOTS do
		local name, texture, isToken, isActive, autoCastAllowed, autoCastEnabled, spellID, checksRange, inRange = GetPetActionInfo(i)
		if checksRange then
			actionsByName_pet[strlower(name)] = i
			actionsById_pet[spellID] = i

			petSpellHasRange[strlower(name)] = true
			petSpellHasRange[spellID] = true
		end
	end
end
UpdatePetBar()

-- Handles updating spellsByName and spellsByID
if not Lib.updaterFrame then
	Lib.updaterFrame = CreateFrame("Frame")
end
Lib.updaterFrame:UnregisterAllEvents()
Lib.updaterFrame:RegisterEvent("SPELLS_CHANGED")
Lib.updaterFrame:RegisterEvent("PET_BAR_UPDATE")
Lib.updaterFrame:RegisterEvent("PLAYER_TARGET_CHANGED")

local function UpdateSpells(_, event)
	if event == "PET_BAR_UPDATE" then
		UpdatePetBar()
	elseif event == "PLAYER_TARGET_CHANGED" then
		-- `checksRange` from GetPetActionInfo() changes based on whether the player has a target or not.
		UpdatePetBar()
	elseif event == "SPELLS_CHANGED" then
		UpdateBook("spell")
		UpdateBook("pet")
	end
end

Lib.updaterFrame:SetScript("OnEvent", UpdateSpells)
UpdateSpells()

--- Improved spell range checking function.
-- @name SpellRange.IsSpellInRange
-- @paramsig spell, unit
-- @param spell Name or spellID of a spell that you wish to check the range of. The spell must be a spell that you have in your spellbook or your pet's spellbook.
-- @param unit UnitID of the spell that you wish to check the range on.
-- @return Exact same returns as http://wowprogramming.com/docs/api/IsSpellInRange
-- @usage
-- -- Check spell range by spell name on unit "target"
-- local SpellRange = LibStub("SpellRange-1.0")
-- local inRange = SpellRange.IsSpellInRange("Stormstrike", "target")
--
-- -- Check spell range by spellID on unit "mouseover"
-- local SpellRange = LibStub("SpellRange-1.0")
-- local inRange = SpellRange.IsSpellInRange(17364, "mouseover")
function Lib.IsSpellInRange(spellInput, unit)
	if isNumber[spellInput] then
		local spell = spellsByID_spell[spellInput]
		if spell then
			return IsSpellInRange(spell, "spell", unit)
		else
			local spell = spellsByID_pet[spellInput]
			if spell then
				local petResult = IsSpellInRange(spell, "pet", unit)
				if petResult ~= nil then
					return petResult
				end
				
				-- IsSpellInRange seems to no longer work for pet spellbook,
				-- so we also try the action bar API.
				local actionSlot = actionsById_pet[spellInput]
				if actionSlot and (unit == "target" or UnitIsUnit(unit, "target")) then
					return select(9, GetPetActionInfo(actionSlot)) and 1 or 0
				end
			end
		end
	else
		local spellInput = strlowerCache[spellInput]
		
		local spell = spellsByName_spell[spellInput]
		if spell then
			return IsSpellInRange(spell, "spell", unit)
		else
			local spell = spellsByName_pet[spellInput]
			if spell then
				local petResult = IsSpellInRange(spell, "pet", unit)
				if petResult ~= nil then
					return petResult
				end

				-- IsSpellInRange seems to no longer work for pet spellbook,
				-- so we also try the action bar API.
				local actionSlot = actionsByName_pet[spellInput]
				if actionSlot and (unit == "target" or UnitIsUnit(unit, "target")) then
					return select(9, GetPetActionInfo(actionSlot)) and 1 or 0
				end
			end
		end
		
		return IsSpellInRange(spellInput, unit)
	end
	
end


--- Improved SpellHasRange.
-- @name SpellRange.SpellHasRange
-- @paramsig spell
-- @param spell Name or spellID of a spell that you wish to check for a range. The spell must be a spell that you have in your spellbook or your pet's spellbook.
-- @return Exact same returns as http://wowprogramming.com/docs/api/SpellHasRange
-- @usage
-- -- Check if a spell has a range by spell name
-- local SpellRange = LibStub("SpellRange-1.0")
-- local hasRange = SpellRange.SpellHasRange("Stormstrike")
--
-- -- Check if a spell has a range by spellID
-- local SpellRange = LibStub("SpellRange-1.0")
-- local hasRange = SpellRange.SpellHasRange(17364)
function Lib.SpellHasRange(spellInput)
	if isNumber[spellInput] then
		local spell = spellsByID_spell[spellInput]
		if spell then
			return SpellHasRange(spell, "spell")
		else
			local spell = spellsByID_pet[spellInput]
			if spell then
				-- SpellHasRange seems to no longer work for pet spellbook.
				return SpellHasRange(spell, "pet") or petSpellHasRange[spellInput] or false
			end
		end
	else
		local spellInput = strlowerCache[spellInput]
		
		local spell = spellsByName_spell[spellInput]
		if spell then
			return SpellHasRange(spell, "spell")
		else
			local spell = spellsByName_pet[spellInput]
			if spell then
				-- SpellHasRange seems to no longer work for pet spellbook.
				return SpellHasRange(spell, "pet") or petSpellHasRange[spellInput] or false
			end
		end
		
		return SpellHasRange(spellInput)
	end
	
end