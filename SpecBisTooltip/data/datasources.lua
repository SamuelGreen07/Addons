-- By D4KiR
local _, SpecBisTooltip = ...
function SpecBisTooltip:GetSource(sourceId)
    if sourceId == nil then return "", "" end
    if sourceId == "npc;sold=213278" then return "catalyst", "catalyst" end
    local s = SpecBisTooltip:GetTranslationMap()
    if s == nil then return "", "" end
    local sourceStr = s[sourceId]
    --if sourceId == "npc;sold=213285" then return "catalyst", SpecBisTooltip:Trans("catalyst") end
    if sourceStr then
        local st = string.find(sourceId, "=")
        if st ~= nil then
            local sourceTyp = string.sub(sourceId, 1, st - 1)

            return sourceTyp, sourceStr
        else
            print("FAILED TO FIND", sourceId)
        end
    end
end

local lang = GetLocale()
if SpecBisTooltip.TranslationenUS then
    SpecBisTooltip:TranslationenUS()
    if lang == "deDE" then
        SpecBisTooltip:TranslationdeDE()
    elseif lang == "esES" then
        SpecBisTooltip:TranslationesES()
    elseif lang == "frFR" then
        SpecBisTooltip:TranslationfrFR()
    elseif lang == "itIT" then
        SpecBisTooltip:TranslationitIT()
    elseif lang == "koKR" then
        SpecBisTooltip:TranslationkoKR()
    elseif lang == "ptBR" then
        SpecBisTooltip:TranslationptBR()
    elseif lang == "ruRU" then
        SpecBisTooltip:TranslationruRU()
    elseif lang == "zhCN" then
        SpecBisTooltip:TranslationzhCN()
    elseif lang == "zhTW" then
        SpecBisTooltip:TranslationzhTW()
    end
else
    print("[SpecBisTooltip] Missing TRANSLATIONS")
end
