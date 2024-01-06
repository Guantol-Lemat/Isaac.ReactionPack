local function BaseAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/" .. name .. ".anm2");
end

local function LegacyAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/" .. name .. ".anm2");
end

local function UghAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/ugh/" .. name .. ".anm2");
end

local costumeDefault = {["Apply"] = {LegacyAnm("isaacugh")}, ["Remove"] = nil}

local costumes = {
    [PlayerType.PLAYER_ISAAC] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_MAGDALENE] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_CAIN] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_JUDAS] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_BLUEBABY] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_EVE] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_SAMSON] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_LAZARUS] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_EDEN] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_LAZARUS2] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_BLACKJUDAS] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_LILITH] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_KEEPER] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_APOLLYON] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_THEFORGOTTEN] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_THESOUL] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_BETHANY] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_JACOB] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_ESAU] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_ISAAC_B] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_MAGDALENE_B] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_JUDAS_B] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_EVE_B] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_LAZARUS_B] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_EDEN_B] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_THELOST_B] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_APOLLYON_B] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_THEFORGOTTEN_B] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_BETHANY_B] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_THESOUL_B] = {["Apply"] = {UghAnm("isaacugh")}},
    [PlayerType.PLAYER_AZAZEL] = {["Apply"] = {UghAnm("azazelugh")}},
    [PlayerType.PLAYER_THELOST] = {["Apply"] = {UghAnm("thelostugh")}},
    [PlayerType.PLAYER_CAIN_B] = {["Apply"] = {UghAnm("painugh")}},
    [PlayerType.PLAYER_BLUEBABY_B] = {["Apply"] = {UghAnm("bluebabyughb")}, ["Remove"] = {BaseAnm("character_b05_bluebaby")}},
    [PlayerType.PLAYER_SAMSON_B] = {["Apply"] = {UghAnm("samsonughb")}, ["Remove"] = {BaseAnm("character_b07_samson")}},
    [PlayerType.PLAYER_AZAZEL_B] = {["Apply"] = {UghAnm("azazelughb")}},
    [PlayerType.PLAYER_LILITH_B] = {["Apply"] = {UghAnm("lilithughb")}},
    [PlayerType.PLAYER_KEEPER_B] = {["Apply"] = {UghAnm("keeperughb")}, ["Remove"] = {BaseAnm("character_b13_keeper")}},
    [PlayerType.PLAYER_JACOB_B] = {["Apply"] = {UghAnm("jacobughb")}, ["Remove"] = {BaseAnm("character_b17_jacob")}},
    [PlayerType.PLAYER_LAZARUS2_B] = {["Apply"] = {UghAnm("lazarus2ughb")}, ["Remove"] = {BaseAnm("character_b09_lazarus2")}},
    [PlayerType.PLAYER_JACOB2_B] = {["Apply"] = {UghAnm("jacob2ughb")}, ["Remove"] = {BaseAnm("character_b17_jacob2")}}
}

local soundDefault = {'TankmanUgh'}

ReactionPack.AddUghCostumePack(costumes, "Ugh", costumeDefault)

ReactionPack.AddUghSoundPack({}, "Tankman Ugh", soundDefault)