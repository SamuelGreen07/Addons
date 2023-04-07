if not WeakAuras.IsLibsOK() then return end

local L = WeakAuras.L

-- WeakAuras/Templates
	L["Abilities"] = "Abilities"
	L["Add Triggers"] = "Add Triggers"
	L["Always Active"] = "Always Active"
	L["Always Show"] = "Always Show"
	L["Always show the aura, highlight it if debuffed."] = "Always show the aura, highlight it if debuffed."
	L["Always show the aura, turns grey if on cooldown."] = "Always show the aura, turns grey if on cooldown."
	L["Always show the aura, turns grey if the debuff not active."] = "Always show the aura, turns grey if the debuff not active."
	L["Always shows highlights if enchant missing."] = "Always shows highlights if enchant missing."
	L["Always shows the aura, grey if buff not active."] = "Always shows the aura, grey if buff not active."
	L["Always shows the aura, highlight it if buffed."] = "Always shows the aura, highlight it if buffed."
	L["Always shows the aura, highlight when active, turns blue on insufficient resources."] = "Always shows the aura, highlight when active, turns blue on insufficient resources."
	L["Always shows the aura, highlight while proc is active, blue on insufficient resources."] = "Always shows the aura, highlight while proc is active, blue on insufficient resources."
	L["Always shows the aura, highlight while proc is active, blue when not usable."] = "Always shows the aura, highlight while proc is active, blue when not usable."
	L["Always shows the aura, highlight while proc is active, turns red when out of range, blue on insufficient resources."] = "Always shows the aura, highlight while proc is active, turns red when out of range, blue on insufficient resources."
	L["Always shows the aura, turns blue on insufficient resources."] = "Always shows the aura, turns blue on insufficient resources."
	L["Always shows the aura, turns blue when not usable."] = "Always shows the aura, turns blue when not usable."
	L["Always shows the aura, turns grey if on cooldown."] = "Always shows the aura, turns grey if on cooldown."
	L["Always shows the aura, turns grey if the ability is not usable and red when out of range."] = "Always shows the aura, turns grey if the ability is not usable and red when out of range."
	L["Always shows the aura, turns grey if the ability is not usable."] = "Always shows the aura, turns grey if the ability is not usable."
	L["Always shows the aura, turns red when out of range, blue on insufficient resources."] = "Always shows the aura, turns red when out of range, blue on insufficient resources."
	L["Always shows the aura, turns red when out of range."] = "Always shows the aura, turns red when out of range."
	L["Always shows the aura."] = "Always shows the aura."
	L["Back"] = "Back"
	L["Basic Show On Cooldown"] = "Basic Show On Cooldown"
	L["Basic Show On Ready"] = "Basic Show On Ready"
	L["Bloodlust/Heroism"] = "Bloodlust/Heroism"
	L["buff"] = "buff"
	L["Buffs"] = "Buffs"
	L["Cancel"] = "Cancel"
	L["Cast"] = "Cast"
	L["Charge and Buff Tracking"] = "Charge and Buff Tracking"
	L["Charge and Debuff Tracking"] = "Charge and Debuff Tracking"
	L["Charge and Duration Tracking"] = "Charge and Duration Tracking"
	L["Charge Tracking"] = "Charge Tracking"
	L["cooldown"] = "cooldown"
	L["Cooldown Tracking"] = "Cooldown Tracking"
	L["Cooldowns"] = "Cooldowns"
	L["Create Auras"] = "Create Auras"
	L["debuff"] = "debuff"
	L["Debuffs"] = "Debuffs"
	L["General"] = "General"
	L["Health"] = "Health"
	L["Highlight while action is queued."] = "Highlight while action is queued."
	L["Highlight while active, red when out of range."] = "Highlight while active, red when out of range."
	L["Highlight while active."] = "Highlight while active."
	L["Highlight while buffed, red when out of range."] = "Highlight while buffed, red when out of range."
	L["Highlight while buffed."] = "Highlight while buffed."
	L["Highlight while debuffed, red when out of range."] = "Highlight while debuffed, red when out of range."
	L["Highlight while debuffed."] = "Highlight while debuffed."
	L["Highlight while spell is active."] = "Highlight while spell is active."
	L["Hold CTRL to create multiple auras at once"] = "Hold CTRL to create multiple auras at once"
	L["Keeps existing triggers intact"] = "Keeps existing triggers intact"
	L["Max 3"] = "Max 3"
	L["Max 4"] = "Max 4"
	L["Next"] = "Next"
	L["Only show the aura if the target has the debuff."] = "Only show the aura if the target has the debuff."
	L["Only show the aura when the item is on cooldown."] = "Only show the aura when the item is on cooldown."
	L["Only shows if the weapon is enchanted."] = "Only shows if the weapon is enchanted."
	L["Only shows if the weapon is not enchanted."] = "Only shows if the weapon is not enchanted."
	L["Only shows the aura if the target has the buff."] = "Only shows the aura if the target has the buff."
	L["Only shows the aura when the ability is on cooldown."] = "Only shows the aura when the ability is on cooldown."
	L["Only shows the aura when the ability is ready to use."] = "Only shows the aura when the ability is ready to use."
	L["Other cooldown"] = "Other cooldown"
	L["Pet alive"] = "Pet alive"
	L["Pet Behavior"] = "Pet Behavior"
	L["PvP Talents"] = "PvP Talents"
	L["Replace all existing triggers"] = "Replace all existing triggers"
	L["Replace Triggers"] = "Replace Triggers"
	L["Resources"] = "Resources"
	L["Resources and Shapeshift Form"] = "Resources and Shapeshift Form"
	L["Rogue cooldown"] = "Rogue cooldown"
	L["Runes"] = "Runes"
	L["Shapeshift Form"] = "Shapeshift Form"
	L["Show Always, Glow on Missing"] = "Show Always, Glow on Missing"
	L["Show Charges and Check Usable"] = "Show Charges and Check Usable"
	L["Show Charges with Proc Tracking"] = "Show Charges with Proc Tracking"
	L["Show Charges with Range Tracking"] = "Show Charges with Range Tracking"
	L["Show Charges with Usable Check"] = "Show Charges with Usable Check"
	L["Show Cooldown and Action Queued"] = "Show Cooldown and Action Queued"
	L["Show Cooldown and Buff"] = "Show Cooldown and Buff"
	L["Show Cooldown and Buff and Check for Target"] = "Show Cooldown and Buff and Check for Target"
	L["Show Cooldown and Buff and Check Usable"] = "Show Cooldown and Buff and Check Usable"
	L["Show Cooldown and Check for Target"] = "Show Cooldown and Check for Target"
	L["Show Cooldown and Check for Target & Proc Tracking"] = "Show Cooldown and Check for Target & Proc Tracking"
	L["Show Cooldown and Check Usable"] = "Show Cooldown and Check Usable"
	L["Show Cooldown and Check Usable & Target"] = "Show Cooldown and Check Usable & Target"
	L["Show Cooldown and Check Usable, Proc Tracking"] = "Show Cooldown and Check Usable, Proc Tracking"
	L["Show Cooldown and Check Usable, Target & Proc Tracking"] = "Show Cooldown and Check Usable, Target & Proc Tracking"
	L["Show Cooldown and Debuff"] = "Show Cooldown and Debuff"
	L["Show Cooldown and Debuff and Check for Target"] = "Show Cooldown and Debuff and Check for Target"
	L["Show Cooldown and Duration"] = "Show Cooldown and Duration"
	L["Show Cooldown and Duration and Check for Target"] = "Show Cooldown and Duration and Check for Target"
	L["Show Cooldown and Duration and Check Usable"] = "Show Cooldown and Duration and Check Usable"
	L["Show Cooldown and Proc Tracking"] = "Show Cooldown and Proc Tracking"
	L["Show Cooldown and Totem Information"] = "Show Cooldown and Totem Information"
	L["Show if Enchant Missing"] = "Show if Enchant Missing"
	L["Show on Ready"] = "Show on Ready"
	L["Show Only if Buffed"] = "Show Only if Buffed"
	L["Show Only if Debuffed"] = "Show Only if Debuffed"
	L["Show Only if Enchanted"] = "Show Only if Enchanted"
	L["Show Only if on Cooldown"] = "Show Only if on Cooldown"
	L["Show Totem and Charge Information"] = "Show Totem and Charge Information"
	L["Stance"] = "Stance"
	L["Track the charge and proc, highlight while proc is active, turns red when out of range, blue on insufficient resources."] = "Track the charge and proc, highlight while proc is active, turns red when out of range, blue on insufficient resources."
	L["Tracks the charge and the buff, highlight while the buff is active, blue on insufficient resources."] = "Tracks the charge and the buff, highlight while the buff is active, blue on insufficient resources."
	L["Tracks the charge and the debuff, highlight while the debuff is active, blue on insufficient resources."] = "Tracks the charge and the debuff, highlight while the debuff is active, blue on insufficient resources."
	L["Tracks the charge and the duration of spell, highlight while the spell is active, blue on insufficient resources."] = "Tracks the charge and the duration of spell, highlight while the spell is active, blue on insufficient resources."
	L["Unknown Item"] = "Unknown Item"
	L["Unknown Spell"] = "Unknown Spell"
	L["Warrior cooldown"] = "Warrior cooldown"


-- Make missing translations available
setmetatable(WeakAuras.L, {__index = function(self, key)
  self[key] = (key or "")
  return key
end})
