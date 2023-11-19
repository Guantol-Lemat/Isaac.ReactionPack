ReactionPack = RegisterMod("Reactions Port Pack", 1)

Trauma = ReactionPack
Ughlite = ReactionPack
Disappoint = ReactionPack
Poglite = ReactionPack
Epic = ReactionPack

ReactionPack.ModVersion = "1.0.0"

require("ReactionPack_scripts/enum")

local gameStarted = false

ReactionPack.previous_collectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
local players = {}
ReactionPack.AppliedCostumes = {}
local ReactionMusicIsPlaying = false

ReactionPack.Sets = {
    Nothing = 0,
    Trauma = 1,
    Ugh = 2,
    Neutral = 3,
    Pog = 4,
    Dance = 5
}

ReactionPack.IdToSetName = {
    [ReactionPack.Sets.Nothing] = "Disabled",
    [ReactionPack.Sets.Trauma] = "Trauma",
    [ReactionPack.Sets.Ugh] = "Ugh",
    [ReactionPack.Sets.Neutral] = "Neutral",
    [ReactionPack.Sets.Pog] = "Pog",
    [ReactionPack.Sets.Dance] = "Dance",
}

ReactionPack.CostumeSets = {
    [ReactionPack.Sets.Nothing] = {IDs = {"Disabled"}},
    [ReactionPack.Sets.Trauma] = {IDs ={}, Default = {}},
    [ReactionPack.Sets.Ugh] = {IDs ={}, Default = {}},
    [ReactionPack.Sets.Neutral] = {IDs ={}, Default = {}},
    [ReactionPack.Sets.Pog] = {IDs ={}, Default = {}},
    [ReactionPack.Sets.Dance] = {IDs ={}, Default = {}}
}
ReactionPack.MusicSets = {
    [ReactionPack.Sets.Nothing] = {IDs = {"Disabled"}},
    [ReactionPack.Sets.Trauma] = {IDs ={}, Default = {}},
    [ReactionPack.Sets.Ugh] = {IDs ={}, Default = {}},
    [ReactionPack.Sets.Neutral] = {IDs ={}, Default = {}},
    [ReactionPack.Sets.Pog] = {IDs ={}, Default = {}},
    [ReactionPack.Sets.Dance] = {IDs ={}, Default = {}}
}

local blindBypassToVisibility = {
    [false] = ReactionAPI.Context.Visibility.VISIBLE,
    [true] = ReactionAPI.Context.Visibility.ABSOLUTE
}

local function AddPack(Entries, PackName, Default, Set, SetType)
    if ReactionPack[SetType][Set][PackName] ~= nil then
        local errorString = "[ERROR in AddPack]: Pack Already Exists"
        Isaac.ConsoleOutput(errorString)
        Isaac.DebugString(errorString)
        return
    end
    ReactionPack[SetType][Set][PackName] = Entries
    table.insert(ReactionPack[SetType][Set].IDs, PackName)
    ReactionPack[SetType][Set][PackName].Default = Default
end

local function EditPack(Entries, PackName, Overwrite, Set, SetType)
    if ReactionPack[SetType][Set][PackName] == nil then
        local errorString = "[ERROR in EditPack]: Pack Does Not Exist"
        Isaac.ConsoleOutput(errorString)
        Isaac.DebugString(errorString)
        return
    end
    Overwrite = Overwrite or false
    for playerID, entries in pairs(Entries) do
        if ReactionPack[SetType][Set][PackName][playerID] ~= nil or Overwrite then
            ReactionPack[SetType][Set][PackName][playerID] = entries
        end
    end
end

function Trauma:AddTraumaCostumePack(Costumes, PackName, Default)
    AddPack(Costumes, PackName, Default, ReactionPack.Sets.Trauma, "CostumeSets")
end

function Trauma:EditTraumaCostumePack(Costumes, PackName, Overwrite)
    EditPack(Costumes, PackName, Overwrite, ReactionPack.Sets.Trauma, "CostumeSets")
end

function Ughlite:AddUghCostumePack(Costumes, PackName, Default)
    AddPack(Costumes, PackName, Default, ReactionPack.Sets.Ugh, "CostumeSets")
end

function Ughlite:EditUghCostumePack(Costumes, PackName, Overwrite)
    EditPack(Costumes, PackName, Overwrite, ReactionPack.Sets.Ugh, "CostumeSets")
end

function Disappoint:AddNeutralCostumePack(Costumes, PackName, Default)
    AddPack(Costumes, PackName, Default, ReactionPack.Sets.Neutral, "CostumeSets")
end

function Disappoint:EditNeutralCostumePack(Costumes, PackName, Overwrite)
    EditPack(Costumes, PackName, Overwrite, ReactionPack.Sets.Neutral, "CostumeSets")
end

function Poglite:AddPogCostumePack(Costumes, PackName, Default)
    AddPack(Costumes, PackName, Default, ReactionPack.Sets.Pog, "CostumeSets")
end

function Poglite:EditPogCostumePack(Costumes, PackName, Overwrite)
    EditPack(Costumes, PackName, Overwrite, ReactionPack.Sets.Pog, "CostumeSets")
end

function Epic:AddDanceCostumePack(Costumes, PackName, Default)
    AddPack(Costumes, PackName, Default, ReactionPack.Sets.Dance, "CostumeSets")
end

function Epic:EditDanceCostumePack(Costumes, PackName, Overwrite)
    EditPack(Costumes, PackName, Overwrite, ReactionPack.Sets.Dance, "CostumeSets")
end

function Trauma:AddTraumaMusicPack(Tracks, PackName, Default)
    AddPack(Tracks, PackName, Default, ReactionPack.Sets.Trauma, "MusicSets")
end

function Trauma:EditTraumaMusicPack(Tracks, PackName, Overwrite)
    EditPack(Tracks, PackName, Overwrite, ReactionPack.Sets.Trauma, "MusicSets")
end

function Ughlite:AddUghMusicPack(Tracks, PackName, Default)
    AddPack(Tracks, PackName, Default, ReactionPack.Sets.Ugh, "MusicSets")
end

function Ughlite:EditUghMusicPack(Tracks, PackName, Overwrite)
    EditPack(Tracks, PackName, Overwrite, ReactionPack.Sets.Ugh, "MusicSets")
end

function Disappoint:AddNeutralMusicPack(Tracks, PackName, Default)
    AddPack(Tracks, PackName, Default, ReactionPack.Sets.Neutral, "MusicSets")
end

function Disappoint:EditNeutralMusicPack(Tracks, PackName, Overwrite)
    EditPack(Tracks, PackName, Overwrite, ReactionPack.Sets.Neutral, "MusicSets")
end

function Poglite:AddPogMusicPack(Tracks, PackName, Default)
    AddPack(Tracks, PackName, Default, ReactionPack.Sets.Pog, "MusicSets")
end

function Poglite:EditPogMusicPack(Tracks, PackName, Overwrite)
    EditPack(Tracks, PackName, Overwrite, ReactionPack.Sets.Pog, "MusicSets")
end

function Epic:AddDanceMusicPack(Tracks, PackName, Default)
    AddPack(Tracks, PackName, Default, ReactionPack.Sets.Dance, "MusicSets")
end

function Epic:EditDanceMusicPack(Tracks, PackName, Overwrite)
    EditPack(Tracks, PackName, Overwrite, ReactionPack.Sets.Dance, "MusicSets")
end

require("ReactionPack_scripts.tables.traumatized_costumes")
require("ReactionPack_scripts.tables.traumatized_music")
require("ReactionPack_scripts.tables.ugh_costumes")
require("ReactionPack_scripts.tables.disappointed_costumes")
require("ReactionPack_scripts.tables.pog_costumes")
require("ReactionPack_scripts.tables.specialist_costumes")
require("ReactionPack_scripts.tables.specialist_music")

function ReactionPack:DoNothing()
end

require("ReactionPack_scripts.tables.settings")

---------------------
--BASE APPLY/REMOVE--
---------------------

local function ApplyCostume(SetName)
    local costumeSet = ReactionPack.Settings[SetName].CostumeSet
    local packName = ReactionPack.CostumeSets[costumeSet].IDs[ReactionPack.Settings[SetName].CostumePack]
    for playerNum = 0, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum)
        local playerType = player:GetPlayerType()
        local applyCostume = nil
        local removeCostume = nil
        if ReactionPack.CostumeSets[costumeSet][packName][playerType] == nil then
            applyCostume = ReactionPack.CostumeSets[costumeSet][packName].Default.Apply
            removeCostume = ReactionPack.CostumeSets[costumeSet][packName].Default.Remove
        else
            applyCostume = ReactionPack.CostumeSets[costumeSet][packName][playerType].Apply or ReactionPack.CostumeSets[costumeSet][packName].Default.Apply
            removeCostume = ReactionPack.CostumeSets[costumeSet][packName][playerType].Remove or ReactionPack.CostumeSets[costumeSet][packName].Default.Remove
        end

        if applyCostume then
            player:AddNullCostume(applyCostume)
            ReactionPack.AppliedCostumes[playerNum] = applyCostume
        end
        if removeCostume then
            player:TryRemoveNullCostume(removeCostume)
        end
    end
end

local function RemoveCostume(SetName)
    local costumeSet = ReactionPack.Settings[SetName].CostumeSet
    local packName = ReactionPack.CostumeSets[costumeSet].IDs[ReactionPack.Settings[SetName].CostumePack]
    for playerNum = 0, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum)
        local playerType = player:GetPlayerType()
        local applyCostume = nil
        if ReactionPack.CostumeSets[costumeSet][packName][playerType] == nil then
            applyCostume = ReactionPack.CostumeSets[costumeSet][packName].Default.Remove
        else
            applyCostume = ReactionPack.CostumeSets[costumeSet][packName][playerType].Remove or ReactionPack.CostumeSets[costumeSet][packName].Default.Remove
        end
		local removeCostume = ReactionPack.AppliedCostumes[playerNum]

        if applyCostume then
            player:AddNullCostume(applyCostume)
        end
        if removeCostume then
            player:TryRemoveNullCostume(removeCostume)
        end
    end
end

local function ApplyMusic(SetName)
    local musicSet = ReactionPack.Settings[SetName].MusicSet
    local packName = ReactionPack.MusicSets[musicSet].IDs[ReactionPack.Settings[SetName].MusicPack]
    local player = Game():GetPlayer(1)
    local playerType = player:GetPlayerType()

    local musicName = ReactionPack.MusicSets[musicSet][packName][playerType] or ReactionPack.MusicSets[musicSet][packName].Default
    local music = Isaac.GetMusicIdByName(musicName)

    if MusicManager():GetCurrentMusicID() ~= music then
        MusicManager():Play(music, 1);
    end
    MusicManager():UpdateVolume()
    ReactionMusicIsPlaying = true
end

local function RemoveMusic()
    Game():GetRoom():PlayMusic()
    ReactionMusicIsPlaying = false
end

local function ApplySet(SetName)
    if ReactionPack.Settings[SetName].CostumeSet ~= ReactionPack.Sets.Nothing then
        ApplyCostume(SetName)
    end
    if ReactionPack.Settings[SetName].MusicSet ~= ReactionPack.Sets.Nothing then
        ApplyMusic(SetName)
    end
end

local function RemoveSet(SetName)
    if ReactionPack.Settings[SetName].CostumeSet ~= ReactionPack.Sets.Nothing then
        RemoveCostume(SetName)
    end
    if ReactionMusicIsPlaying then
        RemoveMusic()
    end
end

--------------------
--SET APPLY/REMOVE--
--------------------

function Trauma.ApplyTrauma()
    ApplySet("Trauma")
end

function Trauma.RemoveTrauma()
    RemoveSet("Trauma")
end

function Ughlite.ApplyUgh()
    ApplySet("Ugh")
end

function Ughlite.RemoveUgh()
    RemoveSet("Ugh")
end

function Disappoint.ApplyNeutral()
    ApplySet("Neutral")
end

function Disappoint.RemoveNeutral()
    RemoveSet("Neutral")
end

function Poglite.ApplyPog()
    ApplySet("Pog")
end

function Poglite.RemovePog()
    RemoveSet("Pog")
end

function Epic.ApplyDance()
    ApplySet("Dance")
end

function Epic.RemoveDance()
    RemoveSet("Dance")
end

require("ReactionPack_scripts.tables.function_list")
require("ReactionPack_scripts.tables.default_settings")

local function IsInBattle()
    return Isaac.CountBosses() > 0 or Isaac.CountEnemies() > 0
end

local function UpdateReaction()
    if not gameStarted then
        return
    end
    local collectibleQuality
    if not ReactionPack.Settings.ReactInBattle and IsInBattle() then
        collectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
    else
        local visibility = blindBypassToVisibility[ReactionPack.Settings.BlindBypass]
        collectibleQuality = ReactionAPI.Interface.cGetBestQuality(visibility)
    end
    local qualityChanged = collectibleQuality ~= ReactionPack.previous_collectibleQuality
    local playerChanged = false

    for playerNum = 0, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum)
        local playerType = player:GetPlayerType()
        if playerType ~= players[playerNum] then
            playerChanged = true
        end
        players[playerNum] = playerType
    end

    if qualityChanged or playerChanged then
        ReactionPack.RemoveFunctions[ReactionPack.previous_collectibleQuality]()
        ReactionPack.ApplyFunctions[collectibleQuality]()
    end
    ReactionPack.previous_collectibleQuality = collectibleQuality
end

ReactionPack:AddCallback(ModCallbacks.MC_POST_UPDATE, UpdateReaction)

local function OnGameStart()
    gameStarted = true
    require("ReactionPack_scripts.modcompat.modconfig")
    ReactionPack:RemoveCallback(ModCallbacks.MC_POST_GAME_STARTED, OnGameStart)
end

ReactionPack:AddPriorityCallback(ModCallbacks.MC_POST_GAME_STARTED, CallbackPriority.LATE, OnGameStart) 
