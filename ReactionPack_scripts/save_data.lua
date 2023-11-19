local json = require("json")

--------
--LOAD--
--------

if ReactionPack:HasData() then
    local loadedData = json.decode(ReactionPack:LoadData())

	ReactionPack.Settings.ReactInBattle = loadedData.ReactInBattle == nil and true or loadedData.ReactInBattle
    ReactionPack.Settings.BlindBypass = loadedData.BlindBypass or false
    ReactionPack.Settings.Reaction_Glitched = loadedData.Reaction_Glitched or ReactionPack.FunctionList.Nothing.Id
    ReactionPack.Settings.Reaction_0 = loadedData.Reaction_0 or ReactionPack.FunctionList.Trauma.Id
    ReactionPack.Settings.Reaction_1 = loadedData.Reaction_1 or ReactionPack.FunctionList.Ugh.Id
    ReactionPack.Settings.Reaction_2 = loadedData.Reaction_2 or ReactionPack.FunctionList.Disappoint.Id
    ReactionPack.Settings.Reaction_3 = loadedData.Reaction_3 or ReactionPack.FunctionList.Pog.Id
    ReactionPack.Settings.Reaction_4 = loadedData.Reaction_4 or ReactionPack.FunctionList.Dance.Id
    ReactionPack.Settings.Trauma.EnableMusic = loadedData.Trauma.EnableMusic == nil and true or loadedData.Trauma.EnableMusic
    ReactionPack.Settings.Specialist.EnableMusic = loadedData.Specialist.EnableMusic == nil and true or loadedData.Specialist.EnableMusic
end

--------
--SAVE--
--------

local function SaveSettings()
    ReactionPack:SaveData(json.encode(ReactionPack.Settings))
end

ReactionPack:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, SaveSettings)