local json = require("json")
local utility = require("reactionpack_scripts.functions.utility")
local deepcopy = utility.DeepCopy

local integrity = require("reactionpack_scripts.functions.integrity_check")

ReactionPack.SavedSettings = {}

--------
--LOAD--
--------

local function SetToDefault()
    ReactionPack.Settings = deepcopy(ReactionPack.DefaultSettings)
    ReactionPack.SavedSettings = deepcopy(ReactionPack.Settings)

    for _, setName in ipairs(ReactionPack.IdToSetName) do
        local defaultSetting = ReactionPack.DefaultSettings[setName]
        ReactionPack.SavedSettings[setName].CostumePack = ReactionPack.CostumeSets[defaultSetting.CostumeSet].IDs[defaultSetting.CostumePack]
        ReactionPack.SavedSettings[setName].MusicPack = ReactionPack.MusicSets[defaultSetting.MusicSet].IDs[defaultSetting.MusicPack]
        ReactionPack.SavedSettings[setName].SoundPack = ReactionPack.SoundSets[defaultSetting.SoundSet].IDs[defaultSetting.SoundPack]
    end
end

local function LoadData()
    if ReactionPack:HasData() then
        local loadedData = json.decode(ReactionPack:LoadData())

        ReactionPack.Settings.ReactInBattle = loadedData.ReactInBattle == nil and true or loadedData.ReactInBattle
        ReactionPack.Settings.BlindBypass = loadedData.BlindBypass or false

        ReactionPack.Settings.Reaction_Glitched = loadedData.Reaction_Glitched or ReactionPack.FunctionList.Disabled.Id
        ReactionPack.Settings.Reaction_0 = loadedData.Reaction_0 or ReactionPack.FunctionList.Trauma.Id
        ReactionPack.Settings.Reaction_1 = loadedData.Reaction_1 or ReactionPack.FunctionList.Ugh.Id
        ReactionPack.Settings.Reaction_2 = loadedData.Reaction_2 or ReactionPack.FunctionList.Disappoint.Id
        ReactionPack.Settings.Reaction_3 = loadedData.Reaction_3 or ReactionPack.FunctionList.Pog.Id
        ReactionPack.Settings.Reaction_4 = loadedData.Reaction_4 or ReactionPack.FunctionList.Dance.Id

        for _, setName in ipairs(ReactionPack.IdToSetName) do
            ReactionPack.Settings[setName].CostumeSet = loadedData[setName].CostumeSet or ReactionPack.Settings[setName].CostumeSet
            ReactionPack.Settings[setName].MusicSet = loadedData[setName].MusicSet or ReactionPack.Settings[setName].MusicSet
            ReactionPack.Settings[setName].SoundSet = loadedData[setName].SoundSet or ReactionPack.Settings[setName].SoundSet
        end

        ReactionPack.SavedSettings = deepcopy(ReactionPack.Settings)

        for _, setName in ipairs(ReactionPack.IdToSetName) do
            ReactionPack.SavedSettings[setName].CostumePack = loadedData[setName].CostumePack or ""
            ReactionPack.SavedSettings[setName].MusicPack = loadedData[setName].MusicPack or ""
            ReactionPack.SavedSettings[setName].SoundPack = loadedData[setName].SoundPack or ""
        end
    end
end

local function OnGameStart()
    ReactionPack.gameStarted = true
    SetToDefault()
    LoadData()
    integrity.CheckIntegrity()
end

ReactionPack:AddPriorityCallback(ModCallbacks.MC_POST_GAME_STARTED, CallbackPriority.LATE, OnGameStart)

--------
--SAVE--
--------

local function SaveSettings()
    ReactionPack.SavedSettings = deepcopy(ReactionPack.Settings)

    for _, setName in ipairs(ReactionPack.IdToSetName) do
        local setRoot = ReactionPack.SavedSettings[setName]
        ReactionPack.SavedSettings[setName].CostumePack = ReactionPack.CostumeSets[setRoot.CostumeSet].IDs[setRoot.CostumePack]
        ReactionPack.SavedSettings[setName].MusicPack = ReactionPack.MusicSets[setRoot.MusicSet].IDs[setRoot.MusicPack]
        ReactionPack.SavedSettings[setName].SoundPack = ReactionPack.SoundSets[setRoot.SoundSet].IDs[setRoot.SoundPack]
    end
    ReactionPack:SaveData(json.encode(ReactionPack.SavedSettings))
end

ReactionPack:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, SaveSettings)