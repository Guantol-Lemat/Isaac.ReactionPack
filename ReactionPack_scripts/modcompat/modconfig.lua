local module = {}

function InitModConfigMenu()
    local loopLimit = 10
    local defaultSet = ReactionPack.Sets.Disabled
    local highestSet = ReactionPack.Sets.Dance
    local defaultPack = ReactionPack.Pack.DEFAULT

    local maxCTrauma = #ReactionPack.CostumeSets[ReactionPack.Sets.Trauma].IDs
    local maxCUgh = #ReactionPack.CostumeSets[ReactionPack.Sets.Ugh].IDs
    local maxCNeutral = #ReactionPack.CostumeSets[ReactionPack.Sets.Neutral].IDs
    local maxCPog = #ReactionPack.CostumeSets[ReactionPack.Sets.Pog].IDs
    local maxCDance = #ReactionPack.CostumeSets[ReactionPack.Sets.Dance].IDs
    local maxCPackID = math.max(maxCTrauma, maxCUgh, maxCNeutral, maxCPog, maxCDance)

    local maxMTrauma = #ReactionPack.MusicSets[ReactionPack.Sets.Trauma].IDs
    local maxMUgh = #ReactionPack.MusicSets[ReactionPack.Sets.Ugh].IDs
    local maxMNeutral = #ReactionPack.MusicSets[ReactionPack.Sets.Neutral].IDs
    local maxMPog = #ReactionPack.MusicSets[ReactionPack.Sets.Pog].IDs
    local maxMDance = #ReactionPack.MusicSets[ReactionPack.Sets.Dance].IDs
    local maxMPackID = math.max(maxMTrauma, maxMUgh, maxMNeutral, maxMPog, maxMDance)

    local maxSTrauma = #ReactionPack.SoundSets[ReactionPack.Sets.Trauma].IDs
    local maxSUgh = #ReactionPack.SoundSets[ReactionPack.Sets.Ugh].IDs
    local maxSNeutral = #ReactionPack.SoundSets[ReactionPack.Sets.Neutral].IDs
    local maxSPog = #ReactionPack.SoundSets[ReactionPack.Sets.Pog].IDs
    local maxSDance = #ReactionPack.SoundSets[ReactionPack.Sets.Dance].IDs
    local maxSPackID = math.max(maxSTrauma, maxSUgh, maxSNeutral, maxSPog, maxSDance)

    local function SkipOverEmptySets(CurrentSetting, ActualSetting, SetType)
        local direction
        if CurrentSetting == highestSet and ActualSetting == defaultSet then
            direction = -1
        else
            direction = CurrentSetting - ActualSetting
        end
        for _ = 1, loopLimit do
            if #ReactionPack[SetType][CurrentSetting].IDs ~= 0 then
                return CurrentSetting
            end
            if CurrentSetting == highestSet and direction > 0 then
                CurrentSetting = defaultSet
            else
                CurrentSetting = CurrentSetting + direction
            end
        end
        return defaultSet -- Should be impossible but just used to prevent infinite loops as a safety measure
    end

    local function Reset()
        ReactionPack.RemoveFunctions[ReactionPack.previous_collectibleQuality]()

        ReactionPack.previous_collectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
        ReactionPack.previous_newCollectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
    end

    if ModConfigMenu then
        ReactionPack.MCMStrings = {
            [true] = "True",
            [false] = "False",
            [ReactionPack.FunctionList.Disabled.Id] = "No Reaction",
            [ReactionPack.FunctionList.Trauma.Id] = "Traumatized",
            [ReactionPack.FunctionList.Ugh.Id] = "Ugh",
            [ReactionPack.FunctionList.Neutral.Id] = "Neutral",
            [ReactionPack.FunctionList.Pog.Id] = "Pog",
            [ReactionPack.FunctionList.Dance.Id] = "Dance",
            Qualities = {
                [ReactionAPI.QualityStatus.NO_ITEMS] = "Disabled",
                [ReactionAPI.QualityStatus.GLITCHED] = "Glitched",
                [ReactionAPI.QualityStatus.QUALITY_0] = "Quality 0",
                [ReactionAPI.QualityStatus.QUALITY_1] = "Quality 1",
                [ReactionAPI.QualityStatus.QUALITY_2] = "Quality 2",
                [ReactionAPI.QualityStatus.QUALITY_3] = "Quality 3",
                [ReactionAPI.QualityStatus.QUALITY_4] = "Quality 4"
            }
        }

        local categoryName = "Reaction Port Pack"

        --Info

        ModConfigMenu.AddText(categoryName, "Info", function() return "Reaction Port Pack" end)
        ModConfigMenu.AddSpace(categoryName, "Info")
        ModConfigMenu.AddText(categoryName, "Info", function() return "Version " .. ReactionPack.ModVersion end)
        ModConfigMenu.AddSpace(categoryName, "Info")
        ModConfigMenu.AddText(categoryName, "Info", function() return "by Guantol" end)

        --General

        ModConfigMenu.AddText(categoryName, "General", function() return "Change General Settings" end)

		--General: BlindBypass

        ModConfigMenu.AddSpace(categoryName, "General")

        ModConfigMenu.AddSetting(categoryName, "General",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function ()
                return ReactionPack.Settings.BlindBypass
            end,
            Display = function()
                local choice = ReactionPack.MCMStrings[ReactionPack.Settings.BlindBypass]
                return "BlindBypass" .. ': ' .. choice
            end,
            OnChange = function(currentSetting)
                ReactionPack.Settings.BlindBypass = currentSetting
            end,
            Info = {"If True, Isaac will react to Blind Items"}
        })

        --General: ReactInBattle

        ModConfigMenu.AddSetting(categoryName, "General",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function ()
                return ReactionPack.Settings.ReactInBattle
            end,
            Display = function()
                local choice = ReactionPack.MCMStrings[ReactionPack.Settings.ReactInBattle]
                return "React Whilst in Battle" .. ': ' .. choice
            end,
            OnChange = function(currentSetting)
                Reset()
                ReactionPack.Settings.ReactInBattle = currentSetting
            end,
            Info = {"If True, Isaac will react to Items even when there are enemies in the room"}
        })

        --General: DeathCertificateDimensionReaction

        ModConfigMenu.AddSetting(categoryName, "General",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function ()
                return ReactionPack.Settings.DeathCertificateDimensionReaction
            end,
            Display = function()
                local choice = ReactionPack.MCMStrings[ReactionPack.Settings.DeathCertificateDimensionReaction]
                return "React in Death Certificate Dimension" .. ': ' .. choice
            end,
            OnChange = function(currentSetting)
                Reset()
                ReactionPack.Settings.DeathCertificateDimensionReaction = currentSetting
            end,
            Info = {"If True, Isaac will react to Items when you are in the Death Certificate Dimension"}
        })

        --General: WhineThreshold

        ModConfigMenu.AddSetting(categoryName, "General",
        {
            Type = ModConfigMenu.OptionType.NUMBER,
            CurrentSetting = function()
                return ReactionPack.Settings.WhineThreshold
            end,
            Minimum = ReactionAPI.QualityStatus.NO_ITEMS,
            Maximum = ReactionAPI.QualityStatus.QUALITY_4,
            Display = function()
                local choice = ReactionPack.MCMStrings.Qualities[ReactionPack.Settings.WhineThreshold]
                return "Whine Threshold" .. ': ' .. choice
            end,
            OnChange = function(currentSetting)
                ReactionPack.Settings.WhineThreshold = currentSetting
            end,
            Info = {"When Isaac Picks Up an Item of a Certain Quality, he will not react (whine) to items of a lower Quality, unless it's above or equal to the Threshold"}
        })

        --General: Reaction Choice

        ModConfigMenu.AddSpace(categoryName, "General")
        ModConfigMenu.AddText(categoryName, "General", function() return "The Priority Order is:" end)
        ModConfigMenu.AddText(categoryName, "General", function() return "Glitched < Q 0 < Q 1 < Q 2 < Q 3 < Q 4" end)

        ModConfigMenu.AddSetting(categoryName, "General",
        {
            Type = ModConfigMenu.OptionType.NUMBER,
            CurrentSetting = function()
                return ReactionPack.Settings.Reaction_0
            end,
            Minimum = ReactionPack.FunctionList.Disabled.Id,
            Maximum = ReactionPack.FunctionList.Dance.Id,
            Display = function()
                local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Reaction_0]
                return "Quality 0 Reaction" .. ': ' .. choice
            end,
            OnChange = function(currentSetting)
                ReactionPack.Settings.Reaction_0 = currentSetting

                ReactionPack.RemoveFunctions[ReactionPack.previous_collectibleQuality]()
                ReactionPack.RemoveFunctions[ReactionAPI.QualityStatus.QUALITY_0] = ReactionPack.FunctionList[ReactionPack.IdToSetName[currentSetting]].Remove

                ReactionPack.ApplyFunctions[ReactionAPI.QualityStatus.QUALITY_0] = ReactionPack.FunctionList[ReactionPack.IdToSetName[currentSetting]].Apply
                ReactionPack.previous_collectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
            end,
            Info = {"Change the Reaction Isaac has when encountering Items of Quality 0"}
        })
        ModConfigMenu.AddSetting(categoryName, "General",
        {
            Type = ModConfigMenu.OptionType.NUMBER,
            CurrentSetting = function()
                return ReactionPack.Settings.Reaction_1
            end,
            Minimum = ReactionPack.FunctionList.Disabled.Id,
            Maximum = ReactionPack.FunctionList.Dance.Id,
            Display = function()
                local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Reaction_1]
                return "Quality 1 Reaction" .. ': ' .. choice
            end,
            OnChange = function(currentSetting)
                ReactionPack.Settings.Reaction_1 = currentSetting

                ReactionPack.RemoveFunctions[ReactionPack.previous_collectibleQuality]()
                ReactionPack.RemoveFunctions[ReactionAPI.QualityStatus.QUALITY_1] = ReactionPack.FunctionList[ReactionPack.IdToSetName[currentSetting]].Remove

                ReactionPack.ApplyFunctions[ReactionAPI.QualityStatus.QUALITY_1] = ReactionPack.FunctionList[ReactionPack.IdToSetName[currentSetting]].Apply
                ReactionPack.previous_collectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
            end,
            Info = {"Change the Reaction Isaac has when encountering Items of Quality 1"}
        })
        ModConfigMenu.AddSetting(categoryName, "General",
        {
            Type = ModConfigMenu.OptionType.NUMBER,
            CurrentSetting = function()
                return ReactionPack.Settings.Reaction_2
            end,
            Minimum = ReactionPack.FunctionList.Disabled.Id,
            Maximum = ReactionPack.FunctionList.Dance.Id,
            Display = function()
                local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Reaction_2]
                return "Quality 2 Reaction" .. ': ' .. choice
            end,
            OnChange = function(currentSetting)
                ReactionPack.Settings.Reaction_2 = currentSetting

                ReactionPack.RemoveFunctions[ReactionPack.previous_collectibleQuality]()
                ReactionPack.RemoveFunctions[ReactionAPI.QualityStatus.QUALITY_2] = ReactionPack.FunctionList[ReactionPack.IdToSetName[currentSetting]].Remove

                ReactionPack.ApplyFunctions[ReactionAPI.QualityStatus.QUALITY_2] = ReactionPack.FunctionList[ReactionPack.IdToSetName[currentSetting]].Apply
                ReactionPack.previous_collectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
            end,
            Info = {"Change the Reaction Isaac has when encountering Items of Quality 2"}
        })
        ModConfigMenu.AddSetting(categoryName, "General",
        {
            Type = ModConfigMenu.OptionType.NUMBER,
            CurrentSetting = function()
                return ReactionPack.Settings.Reaction_3
            end,
            Minimum = ReactionPack.FunctionList.Disabled.Id,
            Maximum = ReactionPack.FunctionList.Dance.Id,
            Display = function()
                local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Reaction_3]
                return "Quality 3 Reaction" .. ': ' .. choice
            end,
            OnChange = function(currentSetting)
                ReactionPack.Settings.Reaction_3 = currentSetting

                ReactionPack.RemoveFunctions[ReactionPack.previous_collectibleQuality]()
                ReactionPack.RemoveFunctions[ReactionAPI.QualityStatus.QUALITY_3] = ReactionPack.FunctionList[ReactionPack.IdToSetName[currentSetting]].Remove

                ReactionPack.ApplyFunctions[ReactionAPI.QualityStatus.QUALITY_3] = ReactionPack.FunctionList[ReactionPack.IdToSetName[currentSetting]].Apply
                ReactionPack.previous_collectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
            end,
            Info = {"Change the Reaction Isaac has when encountering Items of Quality 3"}
        })
        ModConfigMenu.AddSetting(categoryName, "General",
        {
            Type = ModConfigMenu.OptionType.NUMBER,
            CurrentSetting = function()
                return ReactionPack.Settings.Reaction_4
            end,
            Minimum = ReactionPack.FunctionList.Disabled.Id,
            Maximum = ReactionPack.FunctionList.Dance.Id,
            Display = function()
                local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Reaction_4]
                return "Quality 4 Reaction" .. ': ' .. choice
            end,
            OnChange = function(currentSetting)
                ReactionPack.Settings.Reaction_4 = currentSetting

                ReactionPack.RemoveFunctions[ReactionPack.previous_collectibleQuality]()
                ReactionPack.RemoveFunctions[ReactionAPI.QualityStatus.QUALITY_4] = ReactionPack.FunctionList[ReactionPack.IdToSetName[currentSetting]].Remove

                ReactionPack.ApplyFunctions[ReactionAPI.QualityStatus.QUALITY_4] = ReactionPack.FunctionList[ReactionPack.IdToSetName[currentSetting]].Apply
                ReactionPack.previous_collectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
            end,
            Info = {"Change the Reaction Isaac has when encountering Items of Quality 4"}
        })
        ModConfigMenu.AddSetting(categoryName, "General",
        {
            Type = ModConfigMenu.OptionType.NUMBER,
            CurrentSetting = function()
                return ReactionPack.Settings.Reaction_Glitched
            end,
            Minimum = ReactionPack.FunctionList.Disabled.Id,
            Maximum = ReactionPack.FunctionList.Dance.Id,
            Display = function()
                local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Reaction_Glitched]
                return "Glitched Reaction" .. ': ' .. choice
            end,
            OnChange = function(currentSetting)
                ReactionPack.Settings.Reaction_Glitched = currentSetting

                ReactionPack.RemoveFunctions[ReactionPack.previous_collectibleQuality]()
                ReactionPack.RemoveFunctions[ReactionAPI.QualityStatus.GLITCHED] = ReactionPack.FunctionList[ReactionPack.IdToSetName[currentSetting]].Remove

                ReactionPack.ApplyFunctions[ReactionAPI.QualityStatus.GLITCHED] = ReactionPack.FunctionList[ReactionPack.IdToSetName[currentSetting]].Apply
                ReactionPack.previous_collectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
            end,
            Info = {"Change the Reaction Isaac has when encountering Glitched Items"}
        })

        ModConfigMenu.AddSpace(categoryName, "Extra")

        ModConfigMenu.AddSetting(categoryName, "Extra",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ReactionPack.Settings.Isolation_0
            end,
            Display = function()
                local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Isolation_0]
                return "Isolate Quality 0 Reaction" .. ': ' .. choice
            end,
            OnChange = function(currentSetting)
                ReactionPack.Settings.Isolation_0 = currentSetting
            end,
            Info = {"If set to true then the Quality 0 reaction will only be shown if there are only Quality 0 items in the room, otherwise no reaction will be shown"}
        })
        ModConfigMenu.AddSetting(categoryName, "Extra",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ReactionPack.Settings.Isolation_1
            end,
            Display = function()
                local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Isolation_1]
                return "Isolate Quality 1 Reaction" .. ': ' .. choice
            end,
            OnChange = function(currentSetting)
                ReactionPack.Settings.Isolation_1 = currentSetting
            end,
            Info = {"If set to true then the Quality 1 reaction will only be shown if there are only Quality 1 items in the room, otherwise no reaction will be shown"}
        })
        ModConfigMenu.AddSetting(categoryName, "Extra",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ReactionPack.Settings.Isolation_2
            end,
            Display = function()
                local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Isolation_2]
                return "Isolate Quality 2 Reaction" .. ': ' .. choice
            end,
            OnChange = function(currentSetting)
                ReactionPack.Settings.Isolation_2 = currentSetting
            end,
            Info = {"If set to true then the Quality 2 reaction will only be shown if there are only Quality 2 items in the room, otherwise no reaction will be shown"}
        })
        ModConfigMenu.AddSetting(categoryName, "Extra",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ReactionPack.Settings.Isolation_3
            end,
            Display = function()
                local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Isolation_3]
                return "Isolate Quality 3 Reaction" .. ': ' .. choice
            end,
            OnChange = function(currentSetting)
                ReactionPack.Settings.Isolation_3 = currentSetting
            end,
            Info = {"If set to true then the Quality 3 reaction will only be shown if there are only Quality 3 items in the room, otherwise no reaction will be shown"}
        })
        ModConfigMenu.AddSetting(categoryName, "Extra",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ReactionPack.Settings.Isolation_4
            end,
            Display = function()
                local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Isolation_4]
                return "Isolate Quality 4 Reaction" .. ': ' .. choice
            end,
            OnChange = function(currentSetting)
                ReactionPack.Settings.Isolation_4 = currentSetting
            end,
            Info = {"If set to true then the Quality 4 reaction will only be shown if there are only Quality 4 items in the room, otherwise no reaction will be shown"}
        })
        ModConfigMenu.AddSetting(categoryName, "Extra",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ReactionPack.Settings.Isolation_Glitched
            end,
            Display = function()
                local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Isolation_Glitched]
                return "Isolate Glitched Reaction" .. ': ' .. choice
            end,
            OnChange = function(currentSetting)
                ReactionPack.Settings.Isolation_Glitched = currentSetting
            end,
            Info = {"If set to true then the Glitched reaction will only be shown if there are only Glitched items in the room, otherwise no reaction will be shown"}
        })

        --Individual Set Settings

        for set = ReactionPack.Sets.Trauma, ReactionPack.Sets.Dance do
            local setName = ReactionPack.IdToSetName[set]

            ModConfigMenu.AddText(categoryName, setName, function() return "Change Settings for the " .. setName .. " Reaction" end)

            ModConfigMenu.AddSpace(categoryName, setName)
            ModConfigMenu.AddSetting(categoryName, setName,
            {
                Type = ModConfigMenu.OptionType.NUMBER,
                CurrentSetting = function ()
                    return ReactionPack.Settings[setName].CostumeSet
                end,
                Minimum = defaultSet,
                Maximum = highestSet,
                Display = function ()
                    local choice = ReactionPack.IdToSetName[ReactionPack.Settings[setName].CostumeSet]
                    return "CostumeSet" .. ': ' .. choice
                end,
                OnChange = function(currentSetting)
                    Reset()

                    ReactionPack.Settings[setName].CostumeSet = SkipOverEmptySets(currentSetting, ReactionPack.Settings[setName].CostumeSet, "CostumeSets")
                    ReactionPack.Settings[setName].CostumePack = defaultPack
                end,
                Info = {"The Costume Set you wish to use for this reaction"}
            })
            ModConfigMenu.AddSetting(categoryName, setName,
            {
                Type = ModConfigMenu.OptionType.NUMBER,
                CurrentSetting = function ()
                    return ReactionPack.Settings[setName].CostumePack
                end,
                Minimum = defaultPack,
                Maximum = maxCPackID,
                Display = function ()
                    local choice = ReactionPack.CostumeSets[ReactionPack.Settings[setName].CostumeSet].IDs[ReactionPack.Settings[setName].CostumePack]
                    return "CostumePack" .. ': ' .. choice
                end,
                OnChange = function(currentSetting)
                    Reset()

                    if currentSetting > #ReactionPack.CostumeSets[ReactionPack.Settings[setName].CostumeSet].IDs then
                        currentSetting = defaultPack
                    end
                    ReactionPack.Settings[setName].CostumePack = currentSetting
                end,
                Info = {"The Costume Pack you wish to use for this reaction"}
            })

            ModConfigMenu.AddSpace(categoryName, setName)
            ModConfigMenu.AddSetting(categoryName, setName,
            {
                Type = ModConfigMenu.OptionType.NUMBER,
                CurrentSetting = function ()
                    return ReactionPack.Settings[setName].MusicSet
                end,
                Minimum = defaultSet,
                Maximum = highestSet,
                Display = function ()
                    local choice = ReactionPack.IdToSetName[ReactionPack.Settings[setName].MusicSet]
                    return "MusicSet" .. ': ' .. choice
                end,
                OnChange = function(currentSetting)
                    Reset()

                    ReactionPack.Settings[setName].MusicSet = SkipOverEmptySets(currentSetting, ReactionPack.Settings[setName].MusicSet, "MusicSets")
                    ReactionPack.Settings[setName].MusicPack = defaultPack
                end,
                Info = {"The Music Set you wish to use for this reaction"}
            })
            ModConfigMenu.AddSetting(categoryName, setName,
            {
                Type = ModConfigMenu.OptionType.NUMBER,
                CurrentSetting = function ()
                    return ReactionPack.Settings[setName].MusicPack
                end,
                Minimum = defaultPack,
                Maximum = maxMPackID,
                Display = function ()
                    local choice = ReactionPack.MusicSets[ReactionPack.Settings[setName].MusicSet].IDs[ReactionPack.Settings[setName].MusicPack]
                    return "MusicPack" .. ': ' .. choice
                end,
                OnChange = function(currentSetting)
                    Reset()

                    if currentSetting > #ReactionPack.MusicSets[ReactionPack.Settings[setName].MusicSet].IDs then
                        currentSetting = defaultPack
                    end
                    ReactionPack.Settings[setName].MusicPack = currentSetting
                end,
                Info = {"The Music Pack you wish to use for this reaction"}
            })

            ModConfigMenu.AddSpace(categoryName, setName)
            ModConfigMenu.AddSetting(categoryName, setName,
            {
                Type = ModConfigMenu.OptionType.NUMBER,
                CurrentSetting = function ()
                    return ReactionPack.Settings[setName].SoundSet
                end,
                Minimum = defaultSet,
                Maximum = highestSet,
                Display = function ()
                    local choice = ReactionPack.IdToSetName[ReactionPack.Settings[setName].SoundSet]
                    return "SoundSet" .. ': ' .. choice
                end,
                OnChange = function(currentSetting)
                    ReactionPack.Settings[setName].SoundSet = SkipOverEmptySets(currentSetting, ReactionPack.Settings[setName].SoundSet, "SoundSets")
                    ReactionPack.Settings[setName].SoundPack = defaultPack
                end,
                Info = {"The Sound Set you wish to use for this reaction"}
            })
            ModConfigMenu.AddSetting(categoryName, setName,
            {
                Type = ModConfigMenu.OptionType.NUMBER,
                CurrentSetting = function ()
                    return ReactionPack.Settings[setName].SoundPack
                end,
                Minimum = defaultPack,
                Maximum = maxSPackID,
                Display = function ()
                    local choice = ReactionPack.SoundSets[ReactionPack.Settings[setName].SoundSet].IDs[ReactionPack.Settings[setName].SoundPack]
                    return "SoundPack" .. ': ' .. choice
                end,
                OnChange = function(currentSetting)
                    if currentSetting > #ReactionPack.SoundSets[ReactionPack.Settings[setName].SoundSet].IDs then
                        currentSetting = defaultPack
                    end
                    ReactionPack.Settings[setName].SoundPack = currentSetting
                end,
                Info = {"The Sound Pack you wish to use for this reaction"}
            })
        end
    end
end

local function InitRandomizeMenu()
    local categoryName = "Reaction Randomize"

    for type, typeKey in pairs(ReactionPack.SetTypes) do
        ModConfigMenu.AddText(categoryName, "Test", function() return "[" .. type .. "]" end)
        for setID, setName in ipairs(ReactionPack.SetNames) do
            for _, packName in ipairs(ReactionPack[typeKey][setID].IDs) do
                ModConfigMenu.AddText(categoryName, "Test", function() return packName .. "[" .. setName .. "]" end)
            end
        end
    end
end

module.InitModConfigMenu = InitModConfigMenu
module.InitRandomizeMenu = InitRandomizeMenu

return module