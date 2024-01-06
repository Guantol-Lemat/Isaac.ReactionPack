local function BaseAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/" .. name .. ".anm2");
end

local function LegacyAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/" .. name .. ".anm2");
end

local function PogAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/pog/" .. name .. ".anm2");
end

local costumeDefault = {["Apply"] = {LegacyAnm("isaacpog")}, ["Remove"] = nil}

local costumes = {
    [PlayerType.PLAYER_ISAAC] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_MAGDALENE] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_CAIN] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_JUDAS] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_BLUEBABY] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_EVE] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_SAMSON] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_LAZARUS] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_EDEN] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_THELOST] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_LAZARUS2] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_BLACKJUDAS] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_LILITH] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_KEEPER] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_APOLLYON] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_THEFORGOTTEN] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_THESOUL] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_BETHANY] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_JACOB] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_ESAU] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_ISAAC_B] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_MAGDALENE_B] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_JUDAS_B] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_EVE_B] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_LAZARUS_B] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_EDEN_B] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_THELOST_B] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_APOLLYON_B] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_THEFORGOTTEN_B] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_BETHANY_B] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_THESOUL_B] = {["Apply"] = {PogAnm("isaacpog")}},
    [PlayerType.PLAYER_AZAZEL] = {["Apply"] = {PogAnm("azazelpog")}},
    [PlayerType.PLAYER_CAIN_B] = {["Apply"] = {PogAnm("painpog")}},
    [PlayerType.PLAYER_BLUEBABY_B] = {["Apply"] = {PogAnm("bluebabypogb")}, ["Remove"] = {BaseAnm("character_b05_bluebaby")}},
    [PlayerType.PLAYER_SAMSON_B] = {["Apply"] = {PogAnm("samsonpogb")}, ["Remove"] = {BaseAnm("character_b07_samson")}},
    [PlayerType.PLAYER_AZAZEL_B] = {["Apply"] = {PogAnm("azazelpogb")}},
    [PlayerType.PLAYER_LILITH_B] = {["Apply"] = {PogAnm("lilithpogb")}},
    [PlayerType.PLAYER_KEEPER_B] = {["Apply"] = {PogAnm("keeperpogb")}, ["Remove"] = {BaseAnm("character_b13_keeper")}},
    [PlayerType.PLAYER_JACOB_B] = {["Apply"] = {PogAnm("jacobpogb")}, ["Remove"] = {BaseAnm("character_b17_jacob")}},
    [PlayerType.PLAYER_LAZARUS2_B] = {["Apply"] = {PogAnm("lazarus2pogb")}, ["Remove"] = {BaseAnm("character_b09_lazarus2")}},
    [PlayerType.PLAYER_JACOB2_B] = {["Apply"] = {PogAnm("jacob2pogb")}, ["Remove"] = {BaseAnm("character_b17_jacob2")}}
}

ReactionPack.AddPogCostumePack(costumes, "Pog", costumeDefault)