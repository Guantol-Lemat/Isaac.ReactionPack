local function BaseAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/" .. name .. ".anm2");
end

local function PogAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/pog/" .. name .. ".anm2");
end

local costumeDefault = {["Apply"] = {PogAnm("isaacpog")}, ["Remove"] = nil}

local costumes = {
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