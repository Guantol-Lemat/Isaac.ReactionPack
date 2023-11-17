if ModConfigMenu then
    ReactionPack.MCMStrings = {
        [true] = "True",
        [false] = "False",
        [ReactionPack.FunctionList.Nothing.Id] = "No Reaction",
        [ReactionPack.FunctionList.Trauma.Id] = "Traumatized",
        [ReactionPack.FunctionList.Ugh.Id] = "Ugh",
        [ReactionPack.FunctionList.Disappoint.Id] = "Disappointed",
        [ReactionPack.FunctionList.Pog.Id] = "Pog",
        [ReactionPack.FunctionList.Specialist.Id] = "Dance",
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

    --General: Reaction Choice

    ModConfigMenu.AddText(categoryName, "General", function() return "The Priority Order is:" end)
    ModConfigMenu.AddText(categoryName, "General", function() return "Glitched < Q 0 < Q 1 < Q 2 < Q 3 < Q 4" end)
    ModConfigMenu.AddSpace(categoryName, "General")


    ModConfigMenu.AddSetting(categoryName, "General",
    {
        Type = ModConfigMenu.OptionType.NUMBER,
        CurrentSetting = function()
            return ReactionPack.Settings.Reaction_0
        end,
        Minimum = ReactionPack.FunctionList.Nothing.Id,
        Maximum = ReactionPack.FunctionList.Specialist.Id,
        Display = function()
            local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Reaction_0]
            return "Quality 0 Reaction" .. ': ' .. choice
        end,
        OnChange = function(currentSetting)
            ReactionPack.Settings.Reaction_0 = currentSetting

            ReactionPack.RemoveFunctions[ReactionPack.previous_collectibleQuality]()
            ReactionPack.RemoveFunctions[ReactionAPI.QualityStatus.QUALITY_0] = ReactionPack.FunctionList[ReactionPack.NumberToFunctionList[currentSetting]].Remove

            ReactionPack.ApplyFunctions[ReactionAPI.QualityStatus.QUALITY_0] = ReactionPack.FunctionList[ReactionPack.NumberToFunctionList[currentSetting]].Apply
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
        Minimum = ReactionPack.FunctionList.Nothing.Id,
        Maximum = ReactionPack.FunctionList.Specialist.Id,
        Display = function()
            local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Reaction_1]
            return "Quality 1 Reaction" .. ': ' .. choice
        end,
        OnChange = function(currentSetting)
            ReactionPack.Settings.Reaction_1 = currentSetting

            ReactionPack.RemoveFunctions[ReactionPack.previous_collectibleQuality]()
            ReactionPack.RemoveFunctions[ReactionAPI.QualityStatus.QUALITY_1] = ReactionPack.FunctionList[ReactionPack.NumberToFunctionList[currentSetting]].Remove

            ReactionPack.ApplyFunctions[ReactionAPI.QualityStatus.QUALITY_1] = ReactionPack.FunctionList[ReactionPack.NumberToFunctionList[currentSetting]].Apply
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
        Minimum = ReactionPack.FunctionList.Nothing.Id,
        Maximum = ReactionPack.FunctionList.Specialist.Id,
        Display = function()
            local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Reaction_2]
            return "Quality 2 Reaction" .. ': ' .. choice
        end,
        OnChange = function(currentSetting)
            ReactionPack.Settings.Reaction_2 = currentSetting

            ReactionPack.RemoveFunctions[ReactionPack.previous_collectibleQuality]()
            ReactionPack.RemoveFunctions[ReactionAPI.QualityStatus.QUALITY_2] = ReactionPack.FunctionList[ReactionPack.NumberToFunctionList[currentSetting]].Remove

            ReactionPack.ApplyFunctions[ReactionAPI.QualityStatus.QUALITY_2] = ReactionPack.FunctionList[ReactionPack.NumberToFunctionList[currentSetting]].Apply
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
        Minimum = ReactionPack.FunctionList.Nothing.Id,
        Maximum = ReactionPack.FunctionList.Specialist.Id,
        Display = function()
            local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Reaction_3]
            return "Quality 3 Reaction" .. ': ' .. choice
        end,
        OnChange = function(currentSetting)
            ReactionPack.Settings.Reaction_3 = currentSetting

            ReactionPack.RemoveFunctions[ReactionPack.previous_collectibleQuality]()
            ReactionPack.RemoveFunctions[ReactionAPI.QualityStatus.QUALITY_3] = ReactionPack.FunctionList[ReactionPack.NumberToFunctionList[currentSetting]].Remove

            ReactionPack.ApplyFunctions[ReactionAPI.QualityStatus.QUALITY_3] = ReactionPack.FunctionList[ReactionPack.NumberToFunctionList[currentSetting]].Apply
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
        Minimum = ReactionPack.FunctionList.Nothing.Id,
        Maximum = ReactionPack.FunctionList.Specialist.Id,
        Display = function()
            local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Reaction_4]
            return "Quality 4 Reaction" .. ': ' .. choice
        end,
        OnChange = function(currentSetting)
            ReactionPack.Settings.Reaction_4 = currentSetting

            ReactionPack.RemoveFunctions[ReactionPack.previous_collectibleQuality]()
            ReactionPack.RemoveFunctions[ReactionAPI.QualityStatus.QUALITY_4] = ReactionPack.FunctionList[ReactionPack.NumberToFunctionList[currentSetting]].Remove

            Isaac.DebugString("Current Setting:" .. currentSetting)
            Isaac.DebugString("Current String:" .. ReactionPack.NumberToFunctionList[currentSetting])

            ReactionPack.ApplyFunctions[ReactionAPI.QualityStatus.QUALITY_4] = ReactionPack.FunctionList[ReactionPack.NumberToFunctionList[currentSetting]].Apply
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
        Minimum = ReactionPack.FunctionList.Nothing.Id,
        Maximum = ReactionPack.FunctionList.Specialist.Id,
        Display = function()
            local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Reaction_Glitched]
            return "Glitched Reaction" .. ': ' .. choice
        end,
        OnChange = function(currentSetting)
            ReactionPack.Settings.Reaction_Glitched = currentSetting

            ReactionPack.RemoveFunctions[ReactionPack.previous_collectibleQuality]()
            ReactionPack.RemoveFunctions[ReactionAPI.QualityStatus.GLITCHED] = ReactionPack.FunctionList[ReactionPack.NumberToFunctionList[currentSetting]].Remove

            ReactionPack.ApplyFunctions[ReactionAPI.QualityStatus.GLITCHED] = ReactionPack.FunctionList[ReactionPack.NumberToFunctionList[currentSetting]].Apply
            ReactionPack.previous_collectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
        end,
        Info = {"Change the Reaction Isaac has when encountering Glitched Items"}
    })

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

    ModConfigMenu.AddSpace(categoryName, "General")

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
            ReactionPack.Settings.ReactInBattle = currentSetting
        end,
        Info = {"If True, Isaac will react to Items even when there are enemies in the room"}
    })

    -- Trauma

    ModConfigMenu.AddText(categoryName, "Trauma", function() return "Change Settings for the Traumatized Reaction" end)
    ModConfigMenu.AddSpace(categoryName, "Trauma")
    ModConfigMenu.AddSetting(categoryName, "Trauma",
    {
        Type = ModConfigMenu.OptionType.BOOLEAN,
        CurrentSetting = function ()
            return ReactionPack.Settings.Trauma.EnableMusic
        end,
        Display = function ()
            local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Trauma.EnableMusic]
            return "EnableMusic" .. ': ' .. choice
        end,
        OnChange = function(currentSetting)
            ReactionPack.Settings.Trauma.EnableMusic = currentSetting
            if not currentSetting then
                Trauma:RemoveTraumaMusic()
            end
        end,
        Info = {"If True, Music will play during the Traumatized Reaction"}
    })

    --Specialist

    ModConfigMenu.AddText(categoryName, "Dance", function() return "Change Settings for the Specialist Reaction" end)
    ModConfigMenu.AddSpace(categoryName, "Dance")
    ModConfigMenu.AddSetting(categoryName, "Dance",
    {
        Type = ModConfigMenu.OptionType.BOOLEAN,
        CurrentSetting = function ()
            return ReactionPack.Settings.Specialist.EnableMusic
        end,
        Display = function ()
            local choice = ReactionPack.MCMStrings[ReactionPack.Settings.Specialist.EnableMusic]
            return "EnableMusic" .. ': ' .. choice
        end,
        OnChange = function(currentSetting)
            ReactionPack.Settings.Specialist.EnableMusic = currentSetting
            if not currentSetting then
                Epic:RemoveSpecialistMusic()
            end
        end,
        Info = {"If True, Music will play during the Specialist Reaction"}
    })
end