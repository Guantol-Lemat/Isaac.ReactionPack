ReactionPack = RegisterMod("Reactions Port Pack", 1)

Trauma = ReactionPack
Ughlite = ReactionPack
Disappoint = ReactionPack
Poglite = ReactionPack
Epic = ReactionPack

ReactionPack.ModVersion = "1.0.0"

ReactionPack.previous_collectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
local players = {}
ReactionPack.AppliedCostumes = {}

require("ReactionPack_scripts.tables.traumatized_costumes")
require("ReactionPack_scripts.tables.traumatized_music")
require("ReactionPack_scripts.tables.ugh_costumes")
require("ReactionPack_scripts.tables.disappointed_costumes")
require("ReactionPack_scripts.tables.pog_costumes")
require("ReactionPack_scripts.tables.specialist_costumes")
require("ReactionPack_scripts.tables.specialist_music")

require("ReactionPack_scripts.functions.trauma")
require("ReactionPack_scripts.functions.ugh")
require("ReactionPack_scripts.functions.disappoint")
require("ReactionPack_scripts.functions.pog")
require("ReactionPack_scripts.functions.specialist")

function ReactionPack:DoNothing()
end

require("ReactionPack_scripts.tables.function_list")
require("ReactionPack_scripts.tables.default_settings")
require("ReactionPack_scripts.modcompat.modconfig")

local function IsInBattle()
    return Isaac.CountBosses() > 0 or Isaac.CountEnemies() > 0
end

local function UpdateReaction()
    local collectibleQuality
    if not ReactionPack.Settings.ReactInBattle and IsInBattle() then
        collectibleQuality = ReactionAPI.QualityStatus.NO_ITEMS
    else
        collectibleQuality = ReactionAPI:GetCollectibleQuality(ReactionPack.Settings.BlindBypass)
    end
    local changed = collectibleQuality ~= ReactionPack.previous_collectibleQuality
    local playerChanged = false

    for playerNum = 0, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum)
        local playerType = player:GetPlayerType()
        if playerType ~= players[playerNum] then
            playerChanged = true
        end
        players[playerNum] = playerType
    end

    if changed or playerChanged then
        ReactionPack.RemoveFunctions[ReactionPack.previous_collectibleQuality]()
        ReactionPack.ApplyFunctions[collectibleQuality]()
    end
    ReactionPack.previous_collectibleQuality = collectibleQuality
end

ReactionPack:AddCallback(ModCallbacks.MC_POST_UPDATE, UpdateReaction)

