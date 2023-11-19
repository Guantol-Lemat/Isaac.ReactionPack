local function BaseAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/" .. name .. ".anm2");
end

local function PogAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/pog/" .. name .. ".anm2");
end

Poglite.Default = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil}

Poglite.Costumes = {
    [PlayerType.PLAYER_AZAZEL] = {["Apply"] = PogAnm("azazelpog")},
    [PlayerType.PLAYER_CAIN_B] = {["Apply"] = PogAnm("painpog")},
    [PlayerType.PLAYER_BLUEBABY_B] = {["Apply"] = PogAnm("bluebabypogb"), ["Remove"] = BaseAnm("character_b05_bluebaby")},
    [PlayerType.PLAYER_SAMSON_B] = {["Apply"] = PogAnm("samsonpogb"), ["Remove"] = BaseAnm("character_b07_samson")},
    [PlayerType.PLAYER_AZAZEL_B] = {["Apply"] = PogAnm("azazelpogb")},
    [PlayerType.PLAYER_LILITH_B] = {["Apply"] = PogAnm("lilithpogb")},
    [PlayerType.PLAYER_KEEPER_B] = {["Apply"] = PogAnm("keeperpogb"), ["Remove"] = BaseAnm("character_b13_keeper")},
    [PlayerType.PLAYER_JACOB_B] = {["Apply"] = PogAnm("jacobpogb"), ["Remove"] = BaseAnm("character_b17_jacob")},
    [PlayerType.PLAYER_LAZARUS2_B] = {["Apply"] = PogAnm("lazarus2pogb"), ["Remove"] = BaseAnm("character_b09_lazarus2")},
    [PlayerType.PLAYER_JACOB2_B] = {["Apply"] = PogAnm("jacob2pogb"), ["Remove"] = BaseAnm("character_b17_jacob2")}
}

Poglite.PogCostumes = {
    [PlayerType.PLAYER_ISAAC] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_MAGDALENE] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_CAIN] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_JUDAS] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_BLACKJUDAS] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_BLUEBABY] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_EVE] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_SAMSON] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_AZAZEL] = {["Apply"] = PogAnm("azazelpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_LAZARUS] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_LAZARUS2] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_EDEN] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_THELOST] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_LILITH] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_KEEPER] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_APOLLYON] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_THEFORGOTTEN] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_THESOUL] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_BETHANY] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_JACOB] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_ESAU] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},

    [PlayerType.PLAYER_ISAAC_B] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_MAGDALENE_B] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_CAIN_B] = {["Apply"] = PogAnm("painpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_JUDAS_B] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_BLUEBABY_B] = {["Apply"] = PogAnm("bluebabypogb"), ["Remove"] = BaseAnm("character_b05_bluebaby")},
    [PlayerType.PLAYER_EVE_B] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_SAMSON_B] = {["Apply"] = PogAnm("samsonpogb"), ["Remove"] = BaseAnm("character_b07_samson")},
    [PlayerType.PLAYER_AZAZEL_B] = {["Apply"] = PogAnm("azazelpogb"), ["Remove"] = nil},
    [PlayerType.PLAYER_LAZARUS_B] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_EDEN_B] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_THELOST_B] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_LILITH_B] = {["Apply"] = PogAnm("lilithpogb"), ["Remove"] = nil},
    [PlayerType.PLAYER_KEEPER_B] = {["Apply"] = PogAnm("keeperpogb"), ["Remove"] = BaseAnm("character_b13_keeper")},
    [PlayerType.PLAYER_APOLLYON_B] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_THEFORGOTTEN_B] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_BETHANY_B] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil},
    [PlayerType.PLAYER_JACOB_B] = {["Apply"] = PogAnm("jacobpogb"), ["Remove"] = BaseAnm("character_b17_jacob")},
    [PlayerType.PLAYER_LAZARUS2_B] = {["Apply"] = PogAnm("lazarus2pogb"), ["Remove"] = BaseAnm("character_b09_lazarus2")},
    [PlayerType.PLAYER_JACOB2_B] = {["Apply"] = PogAnm("jacob2pogb"), ["Remove"] = BaseAnm("character_b17_jacob2")},
    [PlayerType.PLAYER_THESOUL_B] = {["Apply"] = PogAnm("isaacpog"), ["Remove"] = nil}
}

Trauma:AddTraumaCostumePack(Poglite.Costumes, "Pog", Poglite.Default)
Poglite:AddPogCostumePack(Poglite.Costumes, "Pog", Poglite.Default)