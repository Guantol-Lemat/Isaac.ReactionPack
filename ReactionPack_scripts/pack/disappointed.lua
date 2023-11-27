local function BaseAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/" .. name .. ".anm2");
end

local function DisappointAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/disappointed/" .. name .. ".anm2");
end

local costumeDefault = {["Apply"] = {DisappointAnm("Disappointed_Animation")}, ["Remove"] = nil}

local costumes = {
    [PlayerType.PLAYER_AZAZEL] = {["Apply"] = {DisappointAnm("Disappointed_Animation_Azazel")}},
    [PlayerType.PLAYER_BLUEBABY_B] = {["Apply"] = {DisappointAnm("Disappointed_Animation_BlueBabyB")}, ["Remove"] = {BaseAnm("character_b05_bluebaby")}},
    [PlayerType.PLAYER_AZAZEL_B] = {["Apply"] = {DisappointAnm("Disappointed_Animation_AzazelB")}},
    [PlayerType.PLAYER_LILITH_B] = {["Apply"] = {DisappointAnm("Disappointed_Animation_LilithB")}},
    [PlayerType.PLAYER_KEEPER_B] = {["Apply"] = {DisappointAnm("Disappointed_Animation_KeeperB")}, ["Remove"] = {BaseAnm("character_b13_keeper")}},
    [PlayerType.PLAYER_LAZARUS2_B] = {["Apply"] = {DisappointAnm("Disappointed_Animation_LazarusB2")}, ["Remove"] = {BaseAnm("character_b09_lazarus2")}}
}

ReactionPack.AddNeutralCostumePack(costumes, "Disappointed", costumeDefault)