local function BaseAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/" .. name .. ".anm2");
end

local function DisappointAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/disappointed/" .. name .. ".anm2");
end

Disappoint.Default = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil}

Disappoint.Costumes = {
    [PlayerType.PLAYER_AZAZEL] = {["Apply"] = DisappointAnm("Disappointed_Animation_Azazel")},
    [PlayerType.PLAYER_BLUEBABY_B] = {["Apply"] = DisappointAnm("Disappointed_Animation_BlueBabyB"), ["Remove"] = BaseAnm("character_b05_bluebaby")},
    [PlayerType.PLAYER_AZAZEL_B] = {["Apply"] = DisappointAnm("Disappointed_Animation_AzazelB")},
    [PlayerType.PLAYER_LILITH_B] = {["Apply"] = DisappointAnm("Disappointed_Animation_LilithB")},
    [PlayerType.PLAYER_KEEPER_B] = {["Apply"] = DisappointAnm("Disappointed_Animation_KeeperB"), ["Remove"] = BaseAnm("character_b13_keeper")},
    [PlayerType.PLAYER_LAZARUS2_B] = {["Apply"] = DisappointAnm("Disappointed_Animation_LazarusB2"), ["Remove"] = BaseAnm("character_b09_lazarus2")}
}

Disappoint.DisappointCostumes = {
    [PlayerType.PLAYER_ISAAC] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_MAGDALENE] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_CAIN] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_JUDAS] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_BLACKJUDAS] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_BLUEBABY] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_EVE] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_SAMSON] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_AZAZEL] = {["Apply"] = DisappointAnm("Disappointed_Animation_Azazel"), ["Remove"] = nil},
    [PlayerType.PLAYER_LAZARUS] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_LAZARUS2] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_EDEN] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_THELOST] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_LILITH] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_KEEPER] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_APOLLYON] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_THEFORGOTTEN] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_THESOUL] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_BETHANY] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_JACOB] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_ESAU] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},

    [PlayerType.PLAYER_ISAAC_B] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_MAGDALENE_B] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_CAIN_B] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_JUDAS_B] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_BLUEBABY_B] = {["Apply"] = DisappointAnm("Disappointed_Animation_BlueBabyB"), ["Remove"] = BaseAnm("character_b05_bluebaby")},
    [PlayerType.PLAYER_EVE_B] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_SAMSON_B] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_AZAZEL_B] = {["Apply"] = DisappointAnm("Disappointed_Animation_AzazelB"), ["Remove"] = nil},
    [PlayerType.PLAYER_LAZARUS_B] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_EDEN_B] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_THELOST_B] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_LILITH_B] = {["Apply"] = DisappointAnm("Disappointed_Animation_LilithB"), ["Remove"] = nil},
    [PlayerType.PLAYER_KEEPER_B] = {["Apply"] = DisappointAnm("Disappointed_Animation_KeeperB"), ["Remove"] = BaseAnm("character_b13_keeper")},
    [PlayerType.PLAYER_APOLLYON_B] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_THEFORGOTTEN_B] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_BETHANY_B] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_JACOB_B] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_LAZARUS2_B] = {["Apply"] = DisappointAnm("Disappointed_Animation_LazarusB2"), ["Remove"] = BaseAnm("character_b09_lazarus2")},
    [PlayerType.PLAYER_JACOB2_B] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil},
    [PlayerType.PLAYER_THESOUL_B] = {["Apply"] = DisappointAnm("Disappointed_Animation"), ["Remove"] = nil}
}

Trauma:AddTraumaCostumePack(Disappoint.Costumes, "Disappointed", Disappoint.Default)
Disappoint:AddNeutralCostumePack(Disappoint.Costumes, "Disappointed", Disappoint.Default)