--[[
    BtWQuestsCharacters handles storing information about the users characters like completed quests and reputation
    The data is saved as a list in BtWQuests_Characters
]]

local function ArrayContains(a, item)
    for i=1,#a do
        if a[i] == item then
            return true
        end
    end
    
    return false
end

local BtWQuestsCharactersMap = {} -- Map from name-realm to Character Mixin

BtWQuestsCharactersCharacterMixin = {}
function BtWQuestsCharactersCharacterMixin:IsPartySync()
    return false
end
function BtWQuestsCharactersCharacterMixin:IsPlayer()
    return false
end
function BtWQuestsCharactersCharacterMixin:GetFullName()
    return self.t.name, self.t.realm
end
function BtWQuestsCharactersCharacterMixin:GetName()
    return self.t.name
end
function BtWQuestsCharactersCharacterMixin:GetDisplayName()
    local name, realm = self:GetFullName();
    return string.format("%s-%s", name, realm);
end
function BtWQuestsCharactersCharacterMixin:GetRealm()
    return self.t.realm
end
function BtWQuestsCharactersCharacterMixin:GetFaction()
    return self.t.faction
end
function BtWQuestsCharactersCharacterMixin:GetRace()
    return self.t.race
end
function BtWQuestsCharactersCharacterMixin:GetClass()
    return self.t.class
end
function BtWQuestsCharactersCharacterMixin:GetClassString()
    return BTWQUESTS_CLASS_STRINGS[self.t.class]
end
function BtWQuestsCharactersCharacterMixin:GetLevel()
    return self.t.level
end
function BtWQuestsCharactersCharacterMixin:GetSex()
    return self.t.sex
end


function BtWQuestsCharactersCharacterMixin:IsFaction(faction)
    return self:GetFaction() == faction
end

function BtWQuestsCharactersCharacterMixin:IsRace(race)
    return self:GetRace() == race
end
function BtWQuestsCharactersCharacterMixin:InRaces(races)
    return ArrayContains(races, self:GetRace())
end

function BtWQuestsCharactersCharacterMixin:IsClass(class)
    return self:GetClass() == class
end
function BtWQuestsCharactersCharacterMixin:InClasses(classes)
    return ArrayContains(classes, self:GetClass())
end

function BtWQuestsCharactersCharacterMixin:AtleastLevel(level)
    return self:GetLevel() >= level
end

function BtWQuestsCharactersCharacterMixin:AtmostLevel(level)
    return self:GetLevel() <= level
end

-- @TODO Should probably just get character related info
function BtWQuestsCharactersCharacterMixin:GetFactionInfoByID(factionID)
    local name
    local factionName, _, standing, barMin, barMax, value = GetFactionInfoByID(factionID)

    if self.t.reputations then
        local data = self.t.reputations[factionID];
        if data ~= nil then
            if data[1] ~= nil then
                standing, barMin, barMax, value, name = unpack(data);
            else
                standing, barMin, barMax, value, name = data.standing, data.barMin, data.barMax, data.value, data.name;
            end
        else
            standing, barMin, barMax, value = 0, 0, 1, 0
        end
    end

    if factionName == nil and name ~= nil then
        factionName = name
    end

    return factionName, standing, barMin, barMax, value
end

function BtWQuestsCharactersCharacterMixin:HasProfession(profession)
    return self.t.professions[profession] and true or false
end

function BtWQuestsCharactersCharacterMixin:GetSkillInfo(skillID)
    local level, maxLevel = 0, 0;

    if self.t.skills then
        local data = self.t.skills[skillID];
        if data ~= nil then
            if data[1] ~= nil then
                level, maxLevel = unpack(data);
            else
                level, maxLevel = data.level, data.maxLevel;
            end
        end
    end

    return level, maxLevel;
end

function BtWQuestsCharactersCharacterMixin:IsQuestActive(id)
    return self.t.questsActive[id] and true or false
end
function BtWQuestsCharactersCharacterMixin:IsQuestCompleted(id)
    return self.t.questsCompleted[id] and true or false
end

function BtWQuestsCharactersCharacterMixin:IsChainActive(id)
    return BtWQuestsDatabase:IsChainActive(id, self)
end
function BtWQuestsCharactersCharacterMixin:IsChainCompleted(id)
    return BtWQuestsDatabase:IsChainCompleted(id, self)
end

function BtWQuestsCharactersCharacterMixin:IsCategoryActive(id)
    return BtWQuestsDatabase:IsCategoryActive(id, self)
end
function BtWQuestsCharactersCharacterMixin:IsCategoryCompleted(id)
    return BtWQuestsDatabase:IsCategoryCompleted(id, self)
end

function BtWQuestsCharactersCharacterMixin:ToggleCategoryIgnored(id)
    if self.t.ignoredCategories == nil then
        self.t.ignoredCategories = {}
    end

    if self.t.ignoredCategories[id] then
        self.t.ignoredCategories[id] = nil
    else
        self.t.ignoredCategories[id] = true
    end
end
function BtWQuestsCharactersCharacterMixin:SetCategoryIgnored(id, ignore)
    if ignore == false then
        ignore = nil
    end

    if self.t.ignoredCategories == nil then
        self.t.ignoredCategories = {}
    end

    self.t.ignoredCategories[id] = ignore
end
function BtWQuestsCharactersCharacterMixin:IsCategoryIgnored(id)
    return self.t.ignoredCategories and self.t.ignoredCategories[id]
end

function BtWQuestsCharactersCharacterMixin:ToggleChainIgnored(id)
    if self.t.ignoredChains == nil then
        self.t.ignoredChains = {}
    end

    if self.t.ignoredChains[id] then
        self.t.ignoredChains[id] = nil
    else
        self.t.ignoredChains[id] = true
    end
end
function BtWQuestsCharactersCharacterMixin:SetChainIgnored(id, ignore)
    if ignore == false then
        ignore = nil
    end

    if self.t.ignoredChains == nil then
        self.t.ignoredChains = {}
    end

    self.t.ignoredChains[id] = ignore
end
function BtWQuestsCharactersCharacterMixin:IsChainIgnored(id)
    return self.t.ignoredChains and self.t.ignoredChains[id]
end
function BtWQuestsCharactersCharacterMixin:IsChainActive(id)
    return BtWQuestsDatabase:IsChainActive(id, self)
end
function BtWQuestsCharactersCharacterMixin:IsChainCompleted(id)
    return BtWQuestsDatabase:IsChainCompleted(id, self)
end

function BtWQuestsCharactersCharacterMixin:IsCategoryActive(id)
    return BtWQuestsDatabase:IsCategoryActive(id, self)
end
function BtWQuestsCharactersCharacterMixin:IsCategoryCompleted(id)
    return BtWQuestsDatabase:IsCategoryCompleted(id, self)
end

function BtWQuestsCharactersCharacterMixin:ToggleCategoryIgnored(id)
    if self.t.ignoredCategories == nil then
        self.t.ignoredCategories = {}
    end

    if self.t.ignoredCategories[id] then
        self.t.ignoredCategories[id] = nil
    else
        self.t.ignoredCategories[id] = true
    end
end
function BtWQuestsCharactersCharacterMixin:SetCategoryIgnored(id, ignore)
    if ignore == false then
        ignore = nil
    end

    if self.t.ignoredCategories == nil then
        self.t.ignoredCategories = {}
    end

    self.t.ignoredCategories[id] = ignore and true or nil
end
function BtWQuestsCharactersCharacterMixin:IsCategoryIgnored(id)
    return self.t.ignoredCategories and self.t.ignoredCategories[id]
end

function BtWQuestsCharactersCharacterMixin:ToggleChainIgnored(id)
    if self.t.ignoredChains == nil then
        self.t.ignoredChains = {}
    end

    if self.t.ignoredChains[id] then
        self.t.ignoredChains[id] = nil
    else
        self.t.ignoredChains[id] = true
    end
end
function BtWQuestsCharactersCharacterMixin:SetChainIgnored(id, ignore)
    if ignore == false then
        ignore = nil
    end

    if self.t.ignoredChains == nil then
        self.t.ignoredChains = {}
    end

    self.t.ignoredChains[id] = ignore and true or nil
end
function BtWQuestsCharactersCharacterMixin:IsChainIgnored(id)
    return self.t.ignoredChains and self.t.ignoredChains[id]
end


function BtWQuestsCharactersCharacterMixin:GetHeartOfAzerothLevel()
    return self.t.heartOfAzerothLevel or 0
end
function BtWQuestsCharactersCharacterMixin:HeartOfAzerothAtleastLevel(level)
    return self:GetHeartOfAzerothLevel() >= level
end
function BtWQuestsCharactersCharacterMixin:HeartOfAzerothAtmostLevel(level)
    return self:GetHeartOfAzerothLevel() <= level
end
function BtWQuestsCharactersCharacterMixin:GetFriendshipReputation(factionID)
    local id, rep, maxRep, name, text, texture, reaction, threshold, nextThreshold;
    
    if self.t.friendships then
        local data = self.t.friendships[factionID];
        if data ~= nil then
            if data[1] ~= nil then
                id, rep, maxRep, name, text, texture, reaction, threshold, nextThreshold = unpack(data);
            else
                id, rep, maxRep, name, text, texture, reaction, threshold, nextThreshold = data.id, data.rep, data.maxRep, data.name, data.text, data.texture, data.reaction, data.threshold, data.nextThreshold;
            end
        end
    end

    return id, rep, maxRep, name, text, texture, reaction, threshold, nextThreshold;


    -- local _, _, _, name, _, _, _, _ = GetFriendshipReputation(factionID)
    -- return unpack((self.t.friendships or {})[factionID] or {})
end

function BtWQuestsCharactersCharacterMixin:GetAchievementInfo(achievementID)
    local id, name, points, completed, month, day, year, description,
    flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = GetAchievementInfo(achievementID);
    
    if self.t.achievements then
        local data = self.t.achievements[achievementID];
        if data ~= nil then
            id = id or achievementID;

            if data[1] ~= nil then
                id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = unpack(data);
            else
                name, points, completed, rewardText, wasEarnedByMe = data.name, data.points, data.completed, data.rewardText, data.wasEarnedByMe;
            end
        end
    end

    return id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy;

    -- local achievement = (self.t.achievements or {})[achievementID]
    -- if achievement then
    --     return unpack(achievement)
    -- end

    -- return GetAchievementInfo(achievementId)
end
function BtWQuestsCharactersCharacterMixin:GetAchievementCriteriaInfo(achievementID, criteriaIndex)
    local criteriaString, criteriaType, completed, quantity, reqQuantity,
    charName, flags, assetID, quantityString, criteriaID, eligible = GetAchievementCriteriaInfo(achievementID, criteriaIndex);
    
    if self.t.achievements then
        local data = self.t.achievements[achievementID];
        if data ~= nil then
            id = id or achievementID;

            if data[1] ~= nil then
                data = data[15];
            else
                data = data.criterias;
            end

            data = data[criteriaIndex];
            if data then
                if data[1] ~= nil then
                    criteriaString, criteriaType, completed, quantity, reqQuantity,
                    charName, flags, assetID, quantityString, criteriaID, eligible = unpack(data);
                else
                    criteriaString, completed, criteriaID = data.criteriaString, data.completed, data.criteriaID;
                end
            end
        end
    end

    return criteriaString, criteriaType, completed, quantity, reqQuantity,
    charName, flags, assetID, quantityString, criteriaID, eligible;

    -- local achievement = (self.t.achievements or {})[achievementId];
    -- if achievement then
    --     local criteria = achievement.criterias[criteriaIndex]
    --     return unpack(criteria or {})
    -- end

    -- return GetAchievementCriteriaInfo(achievementId, criteriaIndex)
end
function BtWQuestsCharactersCharacterMixin:GetAchievementCriteriaInfoByID(achievementID, criteriaID)
    local criteriaString, criteriaType, completed, quantity, reqQuantity,
    charName, flags, assetID, quantityString, criteriaID, eligible = GetAchievementCriteriaInfoByID(achievementID, criteriaID);
    
    if self.t.achievements then
        local data = self.t.achievements[achievementID];
        if data ~= nil then
            id = id or achievementID;

            if data[1] ~= nil then
                data = data[15];
            else
                data = data.criteria;
            end

            for _,data in pairs(data) do
                if data and data.criteriaID == criteriaID then
                    if data[1] ~= nil then
                        criteriaString, criteriaType, completed, quantity, reqQuantity,
                        charName, flags, assetID, quantityString, criteriaID, eligible = unpack(data);
                    else
                        criteriaString, completed, criteriaID = data.criteriaString, data.completed, data.criteriaID;
                    end

                    break;
                end
            end
        end
    end

    return criteriaString, criteriaType, completed, quantity, reqQuantity,
    charName, flags, assetID, quantityString, criteriaID, eligible;
end

function BtWQuestsCharactersCharacterMixin:GetXPModifier()
    return self.t.xpModifier or 0;
end
function BtWQuestsCharactersCharacterMixin:IsWarModeDesired()
    return self.t.warMode or false;
end
function BtWQuestsCharactersCharacterMixin:GetWarModeRewardBonus()
    -- Only one faction can get an increase war mode bonus, if we arent the players faction
    -- and the player has over the default warmode bonus then we have the default
    if self:IsFaction(select(2, UnitFactionGroup("player"))) then
        return C_PvP.GetWarModeRewardBonus()
    else
        if C_PvP.GetWarModeRewardBonus() ~= C_PvP.GetWarModeRewardBonusDefault() then
            return C_PvP.GetWarModeRewardBonusDefault();
        else
            return self.t.warModeBonus or C_PvP.GetWarModeRewardBonusDefault();
        end
    end
end

function BtWQuestsCharactersCharacterMixin:GetNumQuestLeaderBoards(questID)
    local questID = tonumber(questID);
    local quest = self.t.questsActive[questID];
    if type(quest) == "table" then
        return #quest;
    else
        return GetNumQuestLeaderBoards(questID);
    end
end
function BtWQuestsCharactersCharacterMixin:GetQuestLogLeaderBoard(index, questID)
    local questID = tonumber(questID);
    local quest = self.t.questsActive[questID];
    if type(quest) == "table" and quest[index] then
        return unpack(quest[index]);
    else
        local name, type = GetQuestLogLeaderBoard(index, questID);
        return name, type, false;
    end
end


BtWQuestsCharactersPlayerMixin = Mixin({}, BtWQuestsCharactersCharacterMixin)
function BtWQuestsCharactersPlayerMixin:IsPlayer()
    return true
end
function BtWQuestsCharactersPlayerMixin:GetFullName()
    return UnitName("player"), GetRealmName()
end
function BtWQuestsCharactersPlayerMixin:GetName()
    return UnitName("player")
end
function BtWQuestsCharactersPlayerMixin:GetRealm()
    return GetRealmName()
end
function BtWQuestsCharactersPlayerMixin:GetFaction()
    return UnitFactionGroup("player")
end
function BtWQuestsCharactersPlayerMixin:GetRace()
    return select(2, UnitRace("player"))
end
function BtWQuestsCharactersPlayerMixin:GetClass()
    return select(3, UnitClass("player"))
end
function BtWQuestsCharactersPlayerMixin:GetClassString()
    return select(2, UnitClass("player"))
end
function BtWQuestsCharactersPlayerMixin:GetLevel()
    return UnitLevel("player")
end
function BtWQuestsCharactersPlayerMixin:GetSex()
    return UnitSex("player")
end

function BtWQuestsCharactersPlayerMixin:GetSkillInfo(skillID)
    local _, level, maxLevel = C_TradeSkillUI.GetTradeSkillLineInfoByID(skillID)
    return level, maxLevel
end

function BtWQuestsCharactersPlayerMixin:GetFactionInfoByID(faction)
    local factionName, _, standing, barMin, barMax, value = GetFactionInfoByID(faction)

    return factionName, standing, barMin, barMax, value
end
function BtWQuestsCharactersPlayerMixin:IsQuestActive(questID)
    return GetQuestLogIndexByID(questID) > 0
end
function BtWQuestsCharactersPlayerMixin:IsQuestCompleted(questID)
    if C_QuestSession.HasJoined() then
        return BtWQuestsCharactersCharacterMixin.IsQuestCompleted(self, questID)
    else
        return IsQuestFlaggedCompleted(questID)
    end
end


function BtWQuestsCharactersPlayerMixin:GetHeartOfAzerothLevel()
    if C_AzeriteItem.HasActiveAzeriteItem() then
        local itemLocation = C_AzeriteItem.FindActiveAzeriteItem();
        if itemLocation then
            return C_AzeriteItem.GetPowerLevel(itemLocation)
        end
    end

    return BtWQuestsCharactersCharacterMixin.GetHeartOfAzerothLevel(self)
end
function BtWQuestsCharactersPlayerMixin:GetFriendshipReputation(factionId)
    return GetFriendshipReputation(factionId)
end
function BtWQuestsCharactersPlayerMixin:GetAchievementInfo(achievementId)
    return GetAchievementInfo(achievementId)
end
function BtWQuestsCharactersPlayerMixin:GetAchievementCriteriaInfo(achievementId, criteriaIndex)
    return GetAchievementCriteriaInfo(achievementId, criteriaIndex)
end
function BtWQuestsCharactersPlayerMixin:GetAchievementCriteriaInfoByID(achievementId, criteriaId)
    return GetAchievementCriteriaInfoByID(achievementId, criteriaId)
end

local xpTooltip = CreateFrame("GameTooltip", "BtWQuestsCharactersXPTooltip", UIParent, "GameTooltipTemplate");
local itemXPBySlot = {
    [INVSLOT_HEAD]     = 0.1,
    [INVSLOT_SHOULDER] = 0.1,
    [INVSLOT_CHEST]    = 0.1,
    [INVSLOT_LEGS]     = 0.1,
    [INVSLOT_FINGER1]  = 0.05,
    [INVSLOT_FINGER2]  = 0.05,
    [INVSLOT_BACK]     = 0.05,
};
local itemXpCache = {};
local gemXpByID = {
    [153714] = 0.05,
};
xpTooltip:SetScript("OnTooltipSetItem", function (self)
    local itemName, itemLink = self:GetItem();

    for i=1,15 do
        local text = _G[self:GetName().."TextLeft"..i];
        if text and text:IsShown() then
            local text = text:GetText();
            local percent = string.match(text, "^Equip: Experience gained is increased by ([%d]+)%%.$");
            if not percent then
                percent = string.match(text, "^Equip: Experience gained from killing monsters and completing quests increased by ([%d]+)%%.$");
            end

            if percent then
                itemXpCache[itemLink] = tonumber(percent) * 0.01;
                break
            end
        end
    end
end)
function PlayerXPModifier()
    local modifier = 0;
    for inventorySlotId=INVSLOT_HEAD,INVSLOT_TABARD do
        local itemLink = GetInventoryItemLink("player", inventorySlotId);
        if itemLink then
            for index=1,3 do
                local _, gemLink = GetItemGem(itemLink, index);
                if gemLink then
                    local itemID = GetItemInfoInstant(gemLink);
                    if gemXpByID[itemID] then
                        modifier = modifier + gemXpByID[itemID];
                    end
                end
            end

            if not itemXpCache[itemLink] then
                itemXpCache[itemLink] = 0;

                local itemID = GetItemInfoInstant(itemLink);
                local heirloomMaxLevel = select(10, C_Heirloom.GetHeirloomInfo(itemID));
                if heirloomMaxLevel ~= nil and heirloomMaxLevel > UnitLevel("player") then
                    itemXpCache[itemLink] = itemXPBySlot[inventorySlotId] or 0; -- Just guess quickly
                end
                if heirloomMaxLevel == nil or heirloomMaxLevel > UnitLevel("player") then
                    xpTooltip:SetHyperlink(itemLink);
                end
            end

            modifier = modifier + itemXpCache[itemLink];
        end
    end

    return modifier;
end
function BtWQuestsCharactersPlayerMixin:GetXPModifier()
    return PlayerXPModifier();
end
function BtWQuestsCharactersPlayerMixin:IsWarModeDesired()
    return C_PvP.IsWarModeDesired();
end
function BtWQuestsCharactersPlayerMixin:GetWarModeRewardBonus()
    return C_PvP.GetWarModeRewardBonus();
end

function BtWQuestsCharactersPlayerMixin:GetNumQuestLeaderBoards(questID)
    local index = GetQuestLogIndexByID(questID);
    return GetNumQuestLeaderBoards(index);
end
function BtWQuestsCharactersPlayerMixin:GetQuestLogLeaderBoard(objective, questID)
    local index = GetQuestLogIndexByID(questID);
    return GetQuestLogLeaderBoard(objective, index);
end

BtWQuestsCharactersPartySyncMixin = Mixin({}, BtWQuestsCharactersPlayerMixin)
function BtWQuestsCharactersPartySyncMixin:IsPartySync()
    return true
end
function BtWQuestsCharactersPartySyncMixin:GetName()
    return BtWQuests.L["Party Sync"];
end
function BtWQuestsCharactersPartySyncMixin:GetFullName()
    return "", "partysync"
end
function BtWQuestsCharactersPartySyncMixin:GetDisplayName()
    return self:GetName();
end
function BtWQuestsCharactersPartySyncMixin:GetLevel()
    return UnitEffectiveLevel("player");
end
function BtWQuestsCharactersPartySyncMixin:IsQuestActive(questID)
    return not C_QuestLog.IsQuestDisabledForSession(questID) and GetQuestLogIndexByID(questID) > 0
end
function BtWQuestsCharactersPartySyncMixin:IsQuestCompleted(questID)
    return IsQuestFlaggedCompleted(questID)
end

BtWQuestsCharacters = {}
local BtWQuests_CharactersMap = nil
local function BtWQuestsCharactersUpdateMap()
    if BtWQuests_Characters == nil then
        BtWQuests_Characters = {}
    end

    BtWQuests_CharactersMap = {}
    for i=#BtWQuests_Characters,1,-1 do
        local character = BtWQuests_Characters[i]
        -- Remove any character missing a name or realm, this is to fix an issue caused by setting these values only on logout
        if not character.name or not character.realm then
            BtWQuests_Characters[i] = nil
        else
            local key = character.name .. "-" .. character.realm
            BtWQuests_CharactersMap[key] = character
        end
    end

    table.sort(BtWQuests_Characters, function(a, b)
        return (a.name .. "-" .. a.realm) < (b.name .. "-" .. b.realm)
    end)
end

local function BtWQuestsCharactersNextPairs(self, prev)
    local key = next(BtWQuests_CharactersMap, prev)
    return key, self:GetCharacter(key)
end
function BtWQuestsCharacters:pairs()
    if BtWQuests_CharactersMap == nil then
        BtWQuestsCharactersUpdateMap()
    end

    return BtWQuestsCharactersNextPairs, self, nil
end

local function BtWQuestsCharactersNextIPairs(self, prev)
    local index, value = next(BtWQuests_Characters, prev)
    if index == nil or value == nil then
        return nil
    end
    local key = value.name .. "-" .. value.realm
    return index, key, self:GetCharacter(key)
end
function BtWQuestsCharacters:ipairs()
    return BtWQuestsCharactersNextIPairs, self, nil
end

function BtWQuestsCharacters:HasCharacter(name, realm)
    local key
    if realm == nil then
        key = name
    else
        key = name .. "-" .. realm
    end

    if BtWQuests_CharactersMap == nil then
        BtWQuestsCharactersUpdateMap()
    end

    return BtWQuests_CharactersMap[key] ~= nil
end
function BtWQuestsCharacters:GetCharacter(name, realm)
    local key
    if realm == nil then
        key = name
    else
        key = name .. "-" .. realm
    end

    if BtWQuests_CharactersMap == nil then
        BtWQuestsCharactersUpdateMap()
    end

    if BtWQuestsCharactersMap[key] == nil then
        local playerName = UnitName("player")
        local playerRealm = GetRealmName()
        local playerKey = playerName .. "-" .. playerRealm

        if key == "-partysync" then
            BtWQuestsCharactersMap[key] = BtWQuests_CreatePartySync(BtWQuests_CharactersMap[playerKey])
        elseif playerKey == key then
            BtWQuestsCharactersMap[key] = BtWQuests_CreatePlayer(BtWQuests_CharactersMap[key])
        elseif BtWQuests_CharactersMap[key] ~= nil then
            BtWQuestsCharactersMap[key] = BtWQuests_CreateCharacter(BtWQuests_CharactersMap[key])
        end
    end

    return BtWQuestsCharactersMap[key]
end
function BtWQuestsCharacters:RemoveCharacter(name, realm)
    local key
    if realm == nil then
        key = name
    else
        key = name .. "-" .. realm
    end

    for i=1,#BtWQuests_Characters do
        if BtWQuests_CharactersMap[key] == BtWQuests_Characters[i] then
            table.remove(BtWQuests_Characters, i)
            BtWQuests_CharactersMap[key] = nil
            BtWQuestsCharactersMap[key] = nil
        end
    end
end
function BtWQuestsCharacters:GetPlayer()
    if C_QuestSession.HasJoined() then
        return self:GetCharacter("-partysync")
    else
        return self:GetCharacter(UnitName("player"), GetRealmName())
    end
end

local temp = {};
local function GetQuestsActive(tbl)
    local tbl = tbl or {};

    wipe(tbl);
    local numEntries = GetNumQuestLogEntries()
    for i=1,numEntries do
        local questID = select(8, GetQuestLogTitle(i));
        if questID ~= nil and questID ~= 0 then
            tbl[questID] = {};

            for objective=1,GetNumQuestLeaderBoards(i) do
                tbl[questID][objective] = {GetQuestLogLeaderBoard(objective, i)};
            end
        end
    end
    
    return tbl;
end
local function GetFactions(tbl)
    local tbl = tbl or {};

    for id,data in pairs(tbl) do
        temp[id] = data;
    end

    wipe(tbl);
    local numEntries = GetNumFactions();
    for i=1,numEntries do
        local name, _, standing, barMin, barMax, barValue, _, _, _, _, _, _, _, factionID = GetFactionInfo(i);
        if factionID ~= nil then
            local data = temp[factionID] or {};
            if data[1] ~= nil then
                wipe(data);
            end

            data.name = name;

            data.standing = standing;

            data.barMin = barMin;
            data.barMax = barMax;
            data.barValue = barValue;
            
            tbl[factionID] = data;
        end
    end

    wipe(temp);
    return tbl;
end
local function GetKnownProfessions(tbl, ...)
    local tbl = tbl or {};

    wipe(tbl);
    for i=1,select('#', ...) do
        local index = select(i,...);
        if index ~= nil then
            local id = select(7, GetProfessionInfo(index));
            tbl[id] = true;
        end
    end

    return tbl;
end
local function GetAchievementCriterias(tbl, achievementID)
    local tbl = tbl or {};

    wipe(tbl);
    local numEntries = GetAchievementNumCriteria(achievementID);
    for i=1,numEntries do
        local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID, eligible = GetAchievementCriteriaInfo(achievementID, i);
        if criteriaString ~= nil then
            local data = tbl[i] or {};

            data.criteriaString = criteriaString;
            data.completed = completed;
            data.criteriaID = criteriaID;
            
            tbl[i] = data;
        end
    end

    return tbl;
end
local function GetAchievements(tbl, achievements)
    local tbl = tbl or {};

    for id,data in pairs(tbl) do
        temp[id] = data;
    end

    wipe(tbl);
    for achievementID in pairs(achievements) do
        local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = GetAchievementInfo(achievementID);
        if id ~= nil then
            local data = temp[achievementID] or {};
            if data[1] ~= nil then
                wipe(data);
            end

            data.name = name;
            data.points = points;
            data.completed = completed;
            data.rewardText = rewardText;
            data.wasEarnedByMe = wasEarnedByMe;
            
            data.criterias = GetAchievementCriterias(data.criterias, achievementID);
            
            tbl[achievementID] = data;
        end
    end

    wipe(temp);
    return tbl;
end
local function GetFriendships(tbl, friendships)
    local tbl = tbl or {};

    for id,data in pairs(tbl) do
        temp[id] = data;
    end

    wipe(tbl);
    for factionID in pairs(friendships) do
        local id, rep, maxRep, name, text, texture, reaction, threshold, nextThreshold = GetFriendshipReputation(factionID);
        if id ~= nil then
            local data = temp[factionID] or {};
            if data[1] ~= nil then
                wipe(data);
            end

            data.name = name;
            data.rep = rep;
            data.maxRep = maxRep;
            data.text = text;
            data.texture = texture;
            data.reaction = reaction;
            data.threshold = threshold;
            data.nextThreshold = nextThreshold;
            
            tbl[factionID] = data;
        end
    end

    wipe(temp);
    return tbl;
end
local function GetSkills(tbl)
    local tbl = tbl or {};

    for id,data in pairs(tbl) do
        temp[id] = data;
    end

    wipe(tbl);
    local skillIDs = C_TradeSkillUI.GetAllProfessionTradeSkillLines()
    for _,skillID in ipairs(skillIDs) do
        local _, level, maxLevel = C_TradeSkillUI.GetTradeSkillLineInfoByID(skillID)
        if level ~= 0 then
            local data = temp[skillID] or {};
            if data[1] ~= nil then
                wipe(data);
            end

            data.level = level;
            data.maxLevel = maxLevel;
            
            tbl[skillID] = data;
        end
    end

    wipe(temp);
    return tbl;
end
function BtWQuestsCharacters:OnEvent(event, ...)
    local name = UnitName("player");
    local realm = GetRealmName();
    if not name or not realm then
        return;
    end

    if BtWQuests_CharactersMap == nil then
        BtWQuestsCharactersUpdateMap()
    end

    local key = name .. "-" .. realm
    if BtWQuests_CharactersMap[key] == nil then
        BtWQuests_CharactersMap[key] = {}
        table.insert(BtWQuests_Characters, BtWQuests_CharactersMap[key])
    end

    local character = BtWQuests_CharactersMap[key]
    character.name = name;
    character.realm = realm;

    -- Some of these dont work during logout or even leaving world so they update with different events
    if event == "ACHIEVEMENT_EARNED" or event == "PLAYER_ENTERING_WORLD" then
        character.achievements = GetAchievements(character.achievements, self.achievements or {});
    end
    if event == "TRADE_SKILL_LIST_UPDATE" or event == "PLAYER_ENTERING_WORLD" then
        character.skills = GetSkills(character.skills);
        character.professions = GetKnownProfessions(character.professions, GetProfessions());
    end
    if event == "QUEST_ACCEPTED" or event == "QUEST_COMPLETE" or event == "QUEST_REMOVED" or event == "QUEST_TURNED_IN" or event == "PLAYER_ENTERING_WORLD" then
        character.questsActive = GetQuestsActive(character.questsActive);
        character.questsCompleted = GetQuestsCompleted(character.questsCompleted);
    end
    if event == "WAR_MODE_STATUS_UPDATE" or event == "PLAYER_FLAGS_CHANGED" or event == "PLAYER_ENTERING_WORLD" then
        character.warMode = C_PvP.IsWarModeDesired();
        character.warModeBonus = C_PvP.GetWarModeRewardBonus();
    end
    if event == "PLAYER_EQUIPMENT_CHANGED" or event == "PLAYER_ENTERING_WORLD" then
        character.xpModifier = PlayerXPModifier();
    end
    if event == "PLAYER_LOGOUT" then
        character.faction = UnitFactionGroup("player");
        character.sex = UnitSex("player");
        character.class = select(3, UnitClass("player"));
        character.race = select(2, UnitRace("player"));
        character.level = UnitLevel("player");
        
        character.reputations = GetFactions(character.reputations);
        character.friendships = GetFriendships(character.friendships, self.friendships or {});

        if C_AzeriteItem.HasActiveAzeriteItem() then
            local itemLocation = C_AzeriteItem.FindActiveAzeriteItem();
            if itemLocation then
                character.heartOfAzerothLevel = C_AzeriteItem.GetPowerLevel(itemLocation)
            end
        end

        character.ignoredChains = character.ignoredChains or (BtWQuests_Settings and BtWQuests_Settings.ignoredChains or {});
        character.ignoredCategories = character.ignoredCategories or (BtWQuests_Settings and BtWQuests_Settings.ignoredCategories or {});
    end
end

function BtWQuestsCharacters:AddFriendshipReputation(factionId)
    if self.friendships == nil then
        self.friendships = {}
    end
    self.friendships[factionId] = true;
end
function BtWQuestsCharacters:AddAchievement(achievementId)
    if self.achievements == nil then
        self.achievements = {}
    end
    self.achievements[achievementId] = true;
end

function BtWQuests_CreatePlayer(data)
    return Mixin({t = data}, BtWQuestsCharactersPlayerMixin)
end

function BtWQuests_CreatePartySync(data)
    return Mixin({t = data}, BtWQuestsCharactersPartySyncMixin)
end

function BtWQuests_CreateCharacter(data)
    return Mixin({t = data}, BtWQuestsCharactersCharacterMixin)
end

local eventHandler = CreateFrame("Frame")
eventHandler:RegisterEvent("PLAYER_ENTERING_WORLD");
eventHandler:RegisterEvent("ACHIEVEMENT_EARNED");
eventHandler:RegisterEvent("TRADE_SKILL_LIST_UPDATE");
eventHandler:RegisterEvent("QUEST_ACCEPTED");
eventHandler:RegisterEvent("QUEST_COMPLETE");
eventHandler:RegisterEvent("QUEST_REMOVED");
eventHandler:RegisterEvent("QUEST_TURNED_IN");
eventHandler:RegisterEvent("WAR_MODE_STATUS_UPDATE");
eventHandler:RegisterEvent("PLAYER_LOGIN");
eventHandler:RegisterEvent("PLAYER_FLAGS_CHANGED");
eventHandler:RegisterEvent("PLAYER_EQUIPMENT_CHANGED");
eventHandler:RegisterEvent("PLAYER_LEAVING_WORLD");
eventHandler:RegisterEvent("PLAYER_LOGOUT");
eventHandler:SetScript("OnEvent", function (self, event, ...)
    BtWQuestsCharacters:OnEvent(event, ...)
end)

BtWQuests.Characters = BtWQuestsCharacters;