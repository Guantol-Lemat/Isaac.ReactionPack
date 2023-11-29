local json = require("json")
local utility = require("reactionpack_scripts.functions.utility")
local deepcopy = utility.DeepCopy
local log = require("reactionpack_scripts.functions.log")

local integrity = require("reactionpack_scripts.functions.integrity_check")

ReactionPack.SavedSettings = {}

--------
--LOAD--
--------

local function SetToDefault()
    log.diagnostic("SAVE", "Setting to Default")
    ReactionPack.Settings = deepcopy(ReactionPack.DefaultSettings)
    ReactionPack.SavedSettings = deepcopy(ReactionPack.Settings)

    for _, setName in ipairs(ReactionPack.IdToSetName) do
        local defaultSetting = ReactionPack.DefaultSettings[setName]
        ReactionPack.SavedSettings[setName].CostumePack = ReactionPack.CostumeSets[defaultSetting.CostumeSet].IDs[defaultSetting.CostumePack]
        ReactionPack.SavedSettings[setName].MusicPack = ReactionPack.MusicSets[defaultSetting.MusicSet].IDs[defaultSetting.MusicPack]
        ReactionPack.SavedSettings[setName].SoundPack = ReactionPack.SoundSets[defaultSetting.SoundSet].IDs[defaultSetting.SoundPack]
    end
    log.diagnostic("SAVE", "Here are the Default Settings:\n" .. json.encode(ReactionPack.SavedSettings))
end

local function LoadData()
    log.diagnostic("SAVE", "Attempting Load")
    if ReactionPack:HasData() then
        log.diagnostic("SAVE", "savedata Has Been Found")
        local loadedData = json.decode(ReactionPack:LoadData())

        log.diagnostic("SAVE", "Data Loaded:\n" .. json.encode(loadedData))
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
        ReactionPack.SavedSettings.ModVersion = loadedData.ModVersion or ReactionPack.ModVersion

        for _, setName in ipairs(ReactionPack.IdToSetName) do
            ReactionPack.SavedSettings[setName].CostumePack = loadedData[setName].CostumePack or ""
            ReactionPack.SavedSettings[setName].MusicPack = loadedData[setName].MusicPack or ""
            ReactionPack.SavedSettings[setName].SoundPack = loadedData[setName].SoundPack or ""
        end
        log.diagnostic("SAVE", "savedata Has Been Loaded")
    else
        log.diagnostic("SAVE", "savedata Has NOT Been Found")
    end
end

local function OnGameStart()
    ReactionPack.gameStarted = true
    SetToDefault()
    LoadData()
    log.diagnostic("SAVE", "Data Before Integrity Check:\n" .. json.encode(ReactionPack.SavedSettings))
    integrity.CheckIntegrity()
    log.diagnostic("SAVE", "Data After Integrity Check:\n" .. json.encode(ReactionPack.SavedSettings))
end

ReactionPack:AddPriorityCallback(ModCallbacks.MC_POST_GAME_STARTED, CallbackPriority.LATE, OnGameStart)

--------
--SAVE--
--------

local function SaveSettings()
    log.diagnostic("SAVE", "Attempting Save (no data will actually be saved)")
    ReactionPack.SavedSettings = deepcopy(ReactionPack.Settings)
    ReactionPack.SavedSettings.ModVersion = ReactionPack.ModVersion

    for _, setName in ipairs(ReactionPack.IdToSetName) do
        local setRoot = ReactionPack.SavedSettings[setName]
        ReactionPack.SavedSettings[setName].CostumePack = ReactionPack.CostumeSets[setRoot.CostumeSet].IDs[setRoot.CostumePack]
        ReactionPack.SavedSettings[setName].MusicPack = ReactionPack.MusicSets[setRoot.MusicSet].IDs[setRoot.MusicPack]
        ReactionPack.SavedSettings[setName].SoundPack = ReactionPack.SoundSets[setRoot.SoundSet].IDs[setRoot.SoundPack]
    end
    log.diagnostic("SAVE", "This is the data the mod is attempting to save:\n" .. json.encode(ReactionPack.SavedSettings))
    if ReactionPack.Diagnostics.SAVE then
        return
    end
    ReactionPack:SaveData(json.encode(ReactionPack.SavedSettings))
end

ReactionPack:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, SaveSettings)