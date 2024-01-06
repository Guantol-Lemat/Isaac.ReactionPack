local function BaseAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/" .. name .. ".anm2");
end

local function LetsGoAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/let's go/" .. name .. ".anm2");
end

local costumeDefault = {["Apply"] = {LetsGoAnm("isaacpog")}, ["Remove"] = nil}

local costumes = {
    [PlayerType.PLAYER_AZAZEL] = {["Apply"] = {LetsGoAnm("azazelpog")}},
    [PlayerType.PLAYER_CAIN_B] = {["Apply"] = {LetsGoAnm("painpog")}},
    [PlayerType.PLAYER_BLUEBABY_B] = {["Apply"] = {LetsGoAnm("bluebabypogb")}, ["Remove"] = {BaseAnm("character_b05_bluebaby")}},
    [PlayerType.PLAYER_SAMSON_B] = {["Apply"] = {LetsGoAnm("samsonpogb")}, ["Remove"] = {BaseAnm("character_b07_samson")}},
    [PlayerType.PLAYER_AZAZEL_B] = {["Apply"] = {LetsGoAnm("azazelpogb")}},
    [PlayerType.PLAYER_LILITH_B] = {["Apply"] = {LetsGoAnm("lilithpogb")}},
    [PlayerType.PLAYER_KEEPER_B] = {["Apply"] = {LetsGoAnm("keeperpogb")}, ["Remove"] = {BaseAnm("character_b13_keeper")}},
    [PlayerType.PLAYER_JACOB_B] = {["Apply"] = {LetsGoAnm("jacobpogb")}, ["Remove"] = {BaseAnm("character_b17_jacob")}},
    [PlayerType.PLAYER_LAZARUS2_B] = {["Apply"] = {LetsGoAnm("lazarus2pogb")}, ["Remove"] = {BaseAnm("character_b09_lazarus2")}},
    [PlayerType.PLAYER_JACOB2_B] = {["Apply"] = {LetsGoAnm("jacob2pogb")}, ["Remove"] = {BaseAnm("character_b17_jacob2")}}
}

ReactionPack.AddPogCostumePack(costumes, "Let's ####### Go!!!", costumeDefault)