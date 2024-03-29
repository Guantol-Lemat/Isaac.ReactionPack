ReactionPack = RegisterMod("Reactions Port Pack", 1)

local removeInitMenuAndPatches = false

local log = require("reactionpack_scripts.functions.log")

ReactionPack.ModVersion = "1.1.1"
ReactionPack.Enabled = true --Check this to see if ReactionPack is actually enabled or not
ReactionPack.Diagnostics = {
    SAVE = false
}

if ReactionAPI then

    -------------
    --VARIABLES--
    -------------

    require("reactionpack_scripts.enum")
    require("reactionpack_scripts.conversion")

    ReactionPack.gameStarted = false
    local firstStart = true
    local exitingGame = false
    local onRoomChange = false

    ReactionPack.previous_collectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
    ReactionPack.previous_newCollectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
    local players = {}
    ReactionPack.AppliedCostumes = {}
    local ReactionMusicIsPlaying = false
    local PlayedCustomSound = -1

    for _, setType in pairs(ReactionPack.SetTypes) do
        ReactionPack[setType] = {
            [ReactionPack.Sets.Disabled] = {IDs = {"Disabled"}},
            [ReactionPack.Sets.Trauma] = {IDs ={}, Default = {}},
            [ReactionPack.Sets.Ugh] = {IDs ={}, Default = {}},
            [ReactionPack.Sets.Neutral] = {IDs ={}, Default = {}},
            [ReactionPack.Sets.Pog] = {IDs ={}, Default = {}},
            [ReactionPack.Sets.Dance] = {IDs ={}, Default = {}}
        }
    end

    local blindBypassToVisibility = {
        [false] = ReactionAPI.Visibility.VISIBLE,
        [true] = ReactionAPI.Visibility.ABSOLUTE
    }

    local QualityStatusToIsolation = {
        [ReactionAPI.QualityStatus.GLITCHED] = "Isolation_Glitched",
        [ReactionAPI.QualityStatus.QUALITY_0] = "Isolation_0",
        [ReactionAPI.QualityStatus.QUALITY_1] = "Isolation_1",
        [ReactionAPI.QualityStatus.QUALITY_2] = "Isolation_2",
        [ReactionAPI.QualityStatus.QUALITY_3] = "Isolation_3",
        [ReactionAPI.QualityStatus.QUALITY_4] = "Isolation_4",
    }

    local function IsInBattle()
        return Isaac.CountBosses() > 0 or Isaac.CountEnemies() > 0
    end

    local function IsDeathCertificateDimension()
        return Game():GetLevel():GetCurrentRoomDesc().Data.Name == 'Death Certificate'
    end

    -----------------------
    --BASE PACK FUNCTIONS--
    -----------------------

    local function IsCostumeWellFormatted(CostumeEntry)
        return (CostumeEntry.Apply == nil or type(CostumeEntry.Apply) == "table") and (CostumeEntry.Remove == nil or type(CostumeEntry.Remove) == "table")
    end

    local function AddPack(Entries, PackName, Default, Set, SetType)
        if ReactionPack[SetType][Set][PackName] ~= nil then
            log.print("[ERROR in AddPack]: Pack Already Exists")
            return
        end
        if type(Default) ~= "table" then
            log.print("[ERROR in AddPack " .. SetType .. "]: Default " .. string.gsub(SetType, "Sets", "") .. " in Pack [" .. PackName .. "] are not formatted as a table, as such the Pack has not been added")
            return
        end
        if SetType == ReactionPack.SetTypes.Costume and not IsCostumeWellFormatted(Default) then
            log.print("[ERROR in AddPack " .. SetType .. "]: Default " .. string.gsub(SetType, "Sets", "") .. " in Pack [" .. PackName .. "] is not well formatted, as such the Pack has not been added")
            return
        end
        ReactionPack[SetType][Set][PackName] = {}
        for playerID, entries in pairs(Entries) do

            if type(entries) ~= "table" then
                log.print("[ERROR in AddPack " .. SetType .. "]: " .. string.gsub(SetType, "Set", "") .. " for characterID [" .. playerID .. "] in Pack [" .. PackName .. "] are not formatted as a table, as such they have been ignored")
                goto continue
            end
            if SetType == ReactionPack.SetTypes.Costume and not IsCostumeWellFormatted(entries) then
                log.print("[ERROR in AddPack " .. SetType .. "]: " .. string.gsub(SetType, "Set", "") .. " for characterID [" .. playerID .. "] in Pack [" .. PackName .. "] are not well formatted, as such the Pack has not been added")
                goto continue
            end
            ReactionPack[SetType][Set][PackName][playerID] = entries
            ::continue::
        end
        table.insert(ReactionPack[SetType][Set].IDs, PackName)
        ReactionPack[SetType][Set][PackName].Default = Default
    end

    local function EditPack(Entries, PackName, Overwrite, Set, SetType)
        if ReactionPack[SetType][Set][PackName] == nil then
            log.print("[ERROR in EditPack]: Pack Does Not Exist")
            return
        end
        Overwrite = Overwrite or false
        for playerID, entries in pairs(Entries) do
            if ReactionPack[SetType][Set][PackName][playerID] == nil or Overwrite then
                if type(entries) ~= "table" then
                    log.print("[ERROR in EditPack " .. SetType .. "]: " .. string.gsub(SetType, "Set", "") .. " for characterID [" .. playerID .. "] are not formatted as a table, as such they have been ignored")
                    goto continue
                end
                if SetType == ReactionPack.SetTypes.Costume and not IsCostumeWellFormatted(entries) then
                    log.print("[ERROR in AddPack " .. SetType .. "]: " .. string.gsub(SetType, "Set", "") .. " for characterID [" .. playerID .. "] in Pack [" .. PackName .. "] are not well formatted, as such the Pack has not been added")
                    goto continue
                end
                ReactionPack[SetType][Set][PackName][playerID] = entries
            end
            ::continue::
        end
    end

    -------
    --API--
    -------

    function ReactionPack.AddTraumaCostumePack(Costumes, PackName, Default)
        AddPack(Costumes, PackName, Default, ReactionPack.Sets.Trauma, "CostumeSets")
    end

    function ReactionPack.EditTraumaCostumePack(Costumes, PackName, Overwrite)
        EditPack(Costumes, PackName, Overwrite, ReactionPack.Sets.Trauma, "CostumeSets")
    end

    function ReactionPack.AddUghCostumePack(Costumes, PackName, Default)
        AddPack(Costumes, PackName, Default, ReactionPack.Sets.Ugh, "CostumeSets")
    end

    function ReactionPack.EditUghCostumePack(Costumes, PackName, Overwrite)
        EditPack(Costumes, PackName, Overwrite, ReactionPack.Sets.Ugh, "CostumeSets")
    end

    function ReactionPack.AddNeutralCostumePack(Costumes, PackName, Default)
        AddPack(Costumes, PackName, Default, ReactionPack.Sets.Neutral, "CostumeSets")
    end

    function ReactionPack.EditNeutralCostumePack(Costumes, PackName, Overwrite)
        EditPack(Costumes, PackName, Overwrite, ReactionPack.Sets.Neutral, "CostumeSets")
    end

    function ReactionPack.AddPogCostumePack(Costumes, PackName, Default)
        AddPack(Costumes, PackName, Default, ReactionPack.Sets.Pog, "CostumeSets")
    end

    function ReactionPack.EditPogCostumePack(Costumes, PackName, Overwrite)
        EditPack(Costumes, PackName, Overwrite, ReactionPack.Sets.Pog, "CostumeSets")
    end

    function ReactionPack.AddDanceCostumePack(Costumes, PackName, Default)
        AddPack(Costumes, PackName, Default, ReactionPack.Sets.Dance, "CostumeSets")
    end

    function ReactionPack.EditDanceCostumePack(Costumes, PackName, Overwrite)
        EditPack(Costumes, PackName, Overwrite, ReactionPack.Sets.Dance, "CostumeSets")
    end

    function ReactionPack.AddTraumaMusicPack(Tracks, PackName, Default)
        AddPack(Tracks, PackName, Default, ReactionPack.Sets.Trauma, "MusicSets")
    end

    function ReactionPack.EditTraumaMusicPack(Tracks, PackName, Overwrite)
        EditPack(Tracks, PackName, Overwrite, ReactionPack.Sets.Trauma, "MusicSets")
    end

    function ReactionPack.AddUghMusicPack(Tracks, PackName, Default)
        AddPack(Tracks, PackName, Default, ReactionPack.Sets.Ugh, "MusicSets")
    end

    function ReactionPack.EditUghMusicPack(Tracks, PackName, Overwrite)
        EditPack(Tracks, PackName, Overwrite, ReactionPack.Sets.Ugh, "MusicSets")
    end

    function ReactionPack.AddNeutralMusicPack(Tracks, PackName, Default)
        AddPack(Tracks, PackName, Default, ReactionPack.Sets.Neutral, "MusicSets")
    end

    function ReactionPack.EditNeutralMusicPack(Tracks, PackName, Overwrite)
        EditPack(Tracks, PackName, Overwrite, ReactionPack.Sets.Neutral, "MusicSets")
    end

    function ReactionPack.AddPogMusicPack(Tracks, PackName, Default)
        AddPack(Tracks, PackName, Default, ReactionPack.Sets.Pog, "MusicSets")
    end

    function ReactionPack.EditPogMusicPack(Tracks, PackName, Overwrite)
        EditPack(Tracks, PackName, Overwrite, ReactionPack.Sets.Pog, "MusicSets")
    end

    function ReactionPack.AddDanceMusicPack(Tracks, PackName, Default)
        AddPack(Tracks, PackName, Default, ReactionPack.Sets.Dance, "MusicSets")
    end

    function ReactionPack.EditDanceMusicPack(Tracks, PackName, Overwrite)
        EditPack(Tracks, PackName, Overwrite, ReactionPack.Sets.Dance, "MusicSets")
    end

    function ReactionPack.AddTraumaSoundPack(Sounds, PackName, Default)
        AddPack(Sounds, PackName, Default, ReactionPack.Sets.Trauma, "SoundSets")
    end

    function ReactionPack.EditTraumaSoundPack(Sounds, PackName, Overwrite)
        EditPack(Sounds, PackName, Overwrite, ReactionPack.Sets.Trauma, "SoundSets")
    end

    function ReactionPack.AddUghSoundPack(Sounds, PackName, Default)
        AddPack(Sounds, PackName, Default, ReactionPack.Sets.Ugh, "SoundSets")
    end

    function ReactionPack.EditUghSoundPack(Sounds, PackName, Overwrite)
        EditPack(Sounds, PackName, Overwrite, ReactionPack.Sets.Ugh, "SoundSets")
    end

    function ReactionPack.AddNeutralSoundPack(Sounds, PackName, Default)
        AddPack(Sounds, PackName, Default, ReactionPack.Sets.Neutral, "SoundSets")
    end

    function ReactionPack.EditNeutralSoundPack(Sounds, PackName, Overwrite)
        EditPack(Sounds, PackName, Overwrite, ReactionPack.Sets.Neutral, "SoundSets")
    end

    function ReactionPack.AddPogSoundPack(Sounds, PackName, Default)
        AddPack(Sounds, PackName, Default, ReactionPack.Sets.Pog, "SoundSets")
    end

    function ReactionPack.EditPogSoundPack(Sounds, PackName, Overwrite)
        EditPack(Sounds, PackName, Overwrite, ReactionPack.Sets.Pog, "SoundSets")
    end

    function ReactionPack.AddDanceSoundPack(Sounds, PackName, Default)
        AddPack(Sounds, PackName, Default, ReactionPack.Sets.Dance, "SoundSets")
    end

    function ReactionPack.EditDanceSoundPack(Sounds, PackName, Overwrite)
        EditPack(Sounds, PackName, Overwrite, ReactionPack.Sets.Dance, "SoundSets")
    end

    ---------------
    --INSERT PACK--
    ---------------

    require("reactionpack_scripts.pack.traumatized")
    require("reactionpack_scripts.pack.ugh")
    require("reactionpack_scripts.pack.disappointed")
    require("reactionpack_scripts.pack.pog")
    require("reactionpack_scripts.pack.let's_go")
    require("reactionpack_scripts.pack.specialist")
    require("reactionpack_scripts.pack.mattman_screams")

    ------------
    --SETTINGS--
    ------------

    function ReactionPack:DoNothing()
    end

    ---------------------
    --BASE APPLY/REMOVE--
    ---------------------

    local function ApplyCostume(SetName)
        local costumeSet = ReactionPack.Settings[SetName].CostumeSet
        local packName = ReactionPack.CostumeSets[costumeSet].IDs[ReactionPack.Settings[SetName].CostumePack]
        for playerNum = 0, Game():GetNumPlayers() do
            local player = Game():GetPlayer(playerNum)
            local playerType = player:GetPlayerType()
            local applyCostumes = nil
            local removeCostumes = nil
            if ReactionPack.CostumeSets[costumeSet][packName][playerType] == nil then
                applyCostumes = ReactionPack.CostumeSets[costumeSet][packName].Default.Apply
                removeCostumes = ReactionPack.CostumeSets[costumeSet][packName].Default.Remove
            else
                applyCostumes = ReactionPack.CostumeSets[costumeSet][packName][playerType].Apply or ReactionPack.CostumeSets[costumeSet][packName].Default.Apply
                removeCostumes = ReactionPack.CostumeSets[costumeSet][packName][playerType].Remove or ReactionPack.CostumeSets[costumeSet][packName].Default.Remove
            end
            if applyCostumes then
                ReactionPack.AppliedCostumes[playerNum] = {}
                for _, costume in ipairs(applyCostumes) do
                    if costume == -1 then costume = ReactionPack.CostumeSets[costumeSet][packName].Default.Apply[1] end
                    player:AddNullCostume(costume)
                    table.insert(ReactionPack.AppliedCostumes[playerNum], costume)
                end
            end
            if removeCostumes then
                for _, costume in ipairs(removeCostumes) do
                    player:TryRemoveNullCostume(costume)
                end
            end
        end
    end

    local function RemoveCostume(SetName)
        local costumeSet = ReactionPack.Settings[SetName].CostumeSet
        local packName = ReactionPack.CostumeSets[costumeSet].IDs[ReactionPack.Settings[SetName].CostumePack]
        for playerNum = 0, Game():GetNumPlayers() do
            local player = Game():GetPlayer(playerNum)
            local playerType = player:GetPlayerType()
            local applyCostumes = nil
            if ReactionPack.CostumeSets[costumeSet][packName][playerType] == nil then
                applyCostumes = ReactionPack.CostumeSets[costumeSet][packName].Default.Remove
            else
                applyCostumes = ReactionPack.CostumeSets[costumeSet][packName][playerType].Remove or ReactionPack.CostumeSets[costumeSet][packName].Default.Remove
            end
            local removeCostumes = ReactionPack.AppliedCostumes[playerNum]

            if applyCostumes then
                for _, costume in ipairs(applyCostumes) do
                    player:AddNullCostume(costume)
                end
            end
            if removeCostumes then
                for _, costume in ipairs(removeCostumes) do
                    player:TryRemoveNullCostume(costume)
                end
                ReactionPack.AppliedCostumes[playerNum] = {}
            end
        end
    end

    local function ApplyMusic(SetName)
        if SnakeEater and SnakeEater:IsPlaying() and SnakeEater.Settings.Force then
            return
        end
        local musicSet = ReactionPack.Settings[SetName].MusicSet
        local packName = ReactionPack.MusicSets[musicSet].IDs[ReactionPack.Settings[SetName].MusicPack]
        local player = Game():GetPlayer(1)
        local playerType = player:GetPlayerType()

        local musicList = ReactionPack.MusicSets[musicSet][packName][playerType] or ReactionPack.MusicSets[musicSet][packName].Default
        local randomMusic = math.random(1, #musicList)
        local musicName = musicList[randomMusic]
        local musicID = Isaac.GetMusicIdByName(musicName)

        if musicID == -1 then
            musicList = ReactionPack.MusicSets[musicSet][packName].Default
            randomMusic = math.random(1, #musicList)
            musicName = musicList[randomMusic]
            musicID = Isaac.GetMusicIdByName(musicName)
        end
        MusicManager():Crossfade(musicID)
        MusicManager():UpdateVolume() -- Shouldn't be necessary with Crossfade but given that otherwise it would lead to an Earrape I'd rather not risk it.
        ReactionMusicIsPlaying = true
    end

    local function RemoveMusic()
        if exitingGame or onRoomChange then
            ReactionMusicIsPlaying = false
            return
        end
        if SnakeEater and SnakeEater:IsPlaying() and SnakeEater.Settings.Force then
            ReactionMusicIsPlaying = false
            return
        end
        local currentRoomMusic = Music.MUSIC_NULL
        if SoundtrackSongList then
            currentRoomMusic = ReactionAPI.Utilities.GetSoundtrackMenuMusic()
        else
            currentRoomMusic = ReactionAPI.Utilities.GetCurrentRoomMusic(true)
        end
        if currentRoomMusic.SpecialScenario == ReactionAPI.Music.Scenario.NO_UNTRACKED_CASES then
            Game():GetRoom():PlayMusic()
            ReactionMusicIsPlaying = false
            return
        end
        MusicManager():Crossfade(currentRoomMusic.CurrentTrack)
        MusicManager():UpdateVolume() -- Shouldn't be necessary with Crossfade but given that otherwise it would lead to an Earrape I'd rather not risk it.
        if currentRoomMusic.Queue then
            for _, musicID in ipairs(currentRoomMusic.Queue) do
                MusicManager():Queue(musicID)
            end
        end
        ReactionMusicIsPlaying = false
    end

    local function PlaySound(soundSet, soundPack)
        local player = Game():GetPlayer(1)
        local playerType = player:GetPlayerType()

        local sounds = ReactionPack.SoundSets[soundSet][soundPack][playerType] or ReactionPack.SoundSets[soundSet][soundPack].Default

        local randomSound = math.random(1, #sounds)
        local soundName = sounds[randomSound]
        local soundId = Isaac.GetSoundIdByName(soundName)
        if soundId == -1 then
            return
        end
        if PlayedCustomSound ~= -1 then
            SFXManager():Stop(PlayedCustomSound)
        end
        SFXManager():Play(soundId)
        PlayedCustomSound = soundId
    end

    local qualityChanged = false -- Used to guarantee that music is not re-applied when "switching" characters like the Forgotten
    local playerChanged = false

    local function ApplySet(SetName)
        if ReactionPack.Settings[SetName].CostumeSet ~= ReactionPack.Sets.Disabled then
            ApplyCostume(SetName)
        end
        if ReactionPack.Settings[SetName].MusicSet ~= ReactionPack.Sets.Disabled and not playerChanged then
            ApplyMusic(SetName)
        end
    end

    local function RemoveSet(SetName)
        if ReactionPack.Settings[SetName].CostumeSet ~= ReactionPack.Sets.Disabled then
            RemoveCostume(SetName)
        end
        if ReactionMusicIsPlaying and not playerChanged then
            RemoveMusic()
        end
    end

    --------------------
    --SET APPLY/REMOVE--
    --------------------

    function ReactionPack.ApplyTrauma()
        ApplySet("Trauma")
    end

    function ReactionPack.RemoveTrauma()
        RemoveSet("Trauma")
    end

    function ReactionPack.ApplyUgh()
        ApplySet("Ugh")
    end

    function ReactionPack.RemoveUgh()
        RemoveSet("Ugh")
    end

    function ReactionPack.ApplyNeutral()
        ApplySet("Neutral")
    end

    function ReactionPack.RemoveNeutral()
        RemoveSet("Neutral")
    end

    function ReactionPack.ApplyPog()
        ApplySet("Pog")
    end

    function ReactionPack.RemovePog()
        RemoveSet("Pog")
    end

    function ReactionPack.ApplyDance()
        ApplySet("Dance")
    end

    function ReactionPack.RemoveDance()
        RemoveSet("Dance")
    end

    require("reactionpack_scripts.tables.function_list")
    require("reactionpack_scripts.tables.default_settings")
    require("reactionpack_scripts.save_data")

    -----------------------------
    --UPDATE REACTION FUNCTIONS--
    -----------------------------

    local bestQualityInRoom = ReactionAPI.QualityStatus.NO_ITEMS
    local threshold

    local function UpdateCostumeAndMusic()
        local visibility = blindBypassToVisibility[ReactionPack.Settings.BlindBypass]
        local filter = ReactionAPI.Filter.ALL
        local collectibleQuality = ReactionAPI.Interface.cGetBestQuality(visibility)

        if ReactionPack.Settings.ReactToCrane then
            collectibleQuality = math.max(collectibleQuality, ReactionAPI.Interface.slotGetBestQuality(ReactionAPI.SlotType.CRANE_GAME))
        end

        if ReactionPack.Settings.ReactToFlip and ReactionAPI.Utilities.AnyPlayerHasCollectible(CollectibleType.COLLECTIBLE_FLIP) then
            collectibleQuality = math.max(collectibleQuality, ReactionAPI.Interface.flipGetBestQuality(filter))
        end

        threshold = math.min(bestQualityInRoom, ReactionPack.Settings.WhineThreshold)

        if collectibleQuality < threshold then
            collectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
        end

        if collectibleQuality ~= ReactionAPI.QualityStatus.NO_ITEMS and ReactionPack.Settings[QualityStatusToIsolation[collectibleQuality]] then
            local qualityStatus = ReactionAPI.Interface.cGetQualityStatus(visibility, filter)
            if 2^(collectibleQuality + 1) < qualityStatus then
                collectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
            end
        end

        qualityChanged = collectibleQuality ~= ReactionPack.previous_collectibleQuality
        playerChanged = false

        for playerNum = 0, Game():GetNumPlayers() do
            local player = Game():GetPlayer(playerNum)
            local playerType = player:GetPlayerType()
            if playerType ~= players[playerNum] then
                playerChanged = true
            end
            players[playerNum] = playerType
        end

        if firstStart then
            playerChanged = false
            firstStart = false
        end

        if qualityChanged or playerChanged then
            ReactionPack.RemoveFunctions[ReactionPack.previous_collectibleQuality]()
            ReactionPack.ApplyFunctions[collectibleQuality]()
        end

        ReactionPack.previous_collectibleQuality = collectibleQuality
    end

    local function UpdateSound()
        local visibility = blindBypassToVisibility[ReactionPack.Settings.BlindBypass]
        local filter = ReactionAPI.Filter.NEW
        local newCollectibleQualityStatus = ReactionAPI.Interface.cGetQualityStatus(visibility, filter)

        if ReactionPack.Settings.ReactToCrane then
            newCollectibleQualityStatus = newCollectibleQualityStatus | ReactionAPI.Interface.slotGetQualityStatus(ReactionAPI.SlotType.CRANE_GAME, filter)
        end

        if ReactionPack.Settings.ReactToFlip and ReactionAPI.Utilities.AnyPlayerHasCollectible(CollectibleType.COLLECTIBLE_FLIP) then
            newCollectibleQualityStatus = newCollectibleQualityStatus | ReactionAPI.Interface.flipGetQualityStatus(filter)
        end

        local isCustomSoundNotPlaying = not (SFXManager():IsPlaying(PlayedCustomSound))
        local newCollectibleQuality = newCollectibleQualityStatus == 0 and ReactionAPI.QualityStatus.NO_ITEMS or math.floor(math.log(newCollectibleQualityStatus, 2)) - 1

        if newCollectibleQuality < threshold then
            newCollectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
        end

        if newCollectibleQuality ~= ReactionAPI.QualityStatus.NO_ITEMS and ReactionPack.Settings[QualityStatusToIsolation[newCollectibleQuality]] then
            if 2^(newCollectibleQuality + 1) < newCollectibleQualityStatus then
                newCollectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
            end
        end

        local isNewCollectibleQualityGreaterThanPrevious = ReactionPack.previous_newCollectibleQuality < newCollectibleQuality

        if (isCustomSoundNotPlaying or isNewCollectibleQualityGreaterThanPrevious) then
            ReactionPack.previous_newCollectibleQuality = newCollectibleQuality
            if newCollectibleQuality == ReactionAPI.QualityStatus.NO_ITEMS then
                return
            end
            local settingName = ReactionPack.QualityStatusToReactionSetting[newCollectibleQuality]
            local setId = ReactionPack.Settings[settingName]
            if setId == 0 then
                return
            end
            local setName = ReactionPack.IdToSetName[setId]
            local soundSet = ReactionPack.Settings[setName].SoundSet
            if soundSet == ReactionPack.Sets.Disabled then
                return
            end
            local packName = ReactionPack.SoundSets[soundSet].IDs[ReactionPack.Settings[setName].SoundPack]
            PlaySound(soundSet, packName)
        end
    end

    ----------------------
    --CALLBACK FUNCTIONS--
    ----------------------

    require("reactionpack_scripts.api.interface")
    require("reactionpack_scripts.api.compatibility")
    local ModMenu = require("reactionpack_scripts.modcompat.modconfig")
    local Epiphany = require("reactionpack_scripts.compatibility.epiphany")

    local function UpdateReaction()
        if not ReactionPack.gameStarted then
            return
        end
        if not ReactionPack.Settings.ReactInBattle and IsInBattle() then
            return
        end
        if not ReactionPack.Settings.DeathCertificateDimensionReaction and IsDeathCertificateDimension() then
            return
        end

        UpdateCostumeAndMusic()
        UpdateSound()
    end

    local function InitMenuAndPatches()
        if removeInitMenuAndPatches then
            return
        end
        ModMenu.InitModConfigMenu()
--        ModMenu.InitRandomizeMenu()
        Epiphany.PatchEpiphany()
        removeInitMenuAndPatches = true
--        ReactionPack:RemoveCallback(ModCallbacks.MC_POST_GAME_STARTED, InitMenuAndPatches)
    end

    local function OnCollectiblePickup(_, EntityPlayer)
        if EntityPlayer.QueuedItem.Item then
            if EntityPlayer.QueuedItem.Item:IsCollectible() then
                bestQualityInRoom = math.max(bestQualityInRoom, ReactionAPI.CollectibleQuality[EntityPlayer.QueuedItem.Item.ID])
            end
        end
    end

    local function Reset()
        ReactionPack.RemoveFunctions[ReactionPack.previous_collectibleQuality]()

        ReactionPack.previous_collectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
        ReactionPack.previous_newCollectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS

        bestQualityInRoom = ReactionAPI.QualityStatus.NO_ITEMS
    end

    local function ResetOnNewRoom()
        onRoomChange = true
        Reset()
        onRoomChange = false
    end

    local function ResetOnExit()
        exitingGame = true
        Reset()
        ReactionPack.gameStarted = false
        exitingGame = false
    end

    ReactionPack:AddCallback(ModCallbacks.MC_POST_UPDATE, UpdateReaction)
    ReactionPack:AddPriorityCallback(ModCallbacks.MC_POST_GAME_STARTED, CallbackPriority.LATE, InitMenuAndPatches)
    ReactionPack:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, OnCollectiblePickup)
    ReactionPack:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, Reset)
    ReactionPack:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, ResetOnNewRoom)
    ReactionPack:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, ResetOnExit)

    require("reactionpack_scripts.version_changelog")

else

    ------------------------
    --REACTION API MISSING--
    ------------------------

    ReactionPack.Enabled = false

    local game = Game()
    log.print("[ERROR in ReactionPack]: ReactionAPI is not enabled")
    -- Code from LuaDebug Reminder

    -- change this to true to render the text at the bottom of the screen
    local renderAtBottom = false

    -- you can change the text if you want, but you might need to change the font as well depending on the language used
    local text = 'ReactionAPI is not Enabled'
    local font = Font()
    font:Load('font/terminus8.fnt')

    local counter = 0
    local counterMax = 10 * 60 -- 10 seconds
    local yOffset = 8 -- from top or bottom
    local kcolor = KColor(1, 0, 0, 1) -- red

    local function getScreenSize()
        if REPENTANCE then
            return Vector(Isaac.GetScreenWidth(), Isaac.GetScreenHeight())
          end

        -- ab+ / based off of code from kilburn
        local room = game:GetRoom()
        local pos = room:WorldToScreenPosition(Vector(0,0)) - room:GetRenderScrollOffset() - game.ScreenShakeOffset

        local rx = pos.X + 60 * 26 / 40
        local ry = pos.Y + 140 * (26 / 40)

        return Vector(rx * 2 + 13 * 26, ry * 2 + 7 * 26)
    end

    local function onGameExit()
        counter = 0
    end

    -- 60 fps
    local function onRender()
        if counter < counterMax then
            local ss = getScreenSize()
            local x = (ss.X / 2) - (font:GetStringWidthUTF8(text) / 2)
            local y = renderAtBottom and ss.Y - font:GetLineHeight() - yOffset or yOffset
            kcolor.Alpha = (counterMax - counter) / counterMax
            font:DrawStringUTF8(text, x, y, kcolor, 0, true)

            if not game:IsPaused() then
                counter = counter + 1
            end
        end
    end

    ReactionPack:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, onGameExit)
    ReactionPack:AddCallback(ModCallbacks.MC_POST_RENDER, onRender)

end

