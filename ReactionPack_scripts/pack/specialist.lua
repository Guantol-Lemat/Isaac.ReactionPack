local function EpicAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/specialist/" .. name .. ".anm2");
end

local costumeDefault = {["Apply"] = {EpicAnm("specialist_isaac")}, ["Remove"] = nil}

local costumes = {
    [PlayerType.PLAYER_MAGDALENE] = {["Apply"] = {EpicAnm("specialist_magdalene")}},
    [PlayerType.PLAYER_CAIN] = {["Apply"] = {EpicAnm("specialist_cain")}},
    [PlayerType.PLAYER_JUDAS] = {["Apply"] = {EpicAnm("specialist_judas")}},
    [PlayerType.PLAYER_BLACKJUDAS] = {["Apply"] = {EpicAnm("specialist_dark_judas")}},
    [PlayerType.PLAYER_BLUEBABY] = {["Apply"] = {EpicAnm("specialist_xxx")}},
    [PlayerType.PLAYER_EVE] = {["Apply"] = {EpicAnm("specialist_eve")}},
    [PlayerType.PLAYER_SAMSON] = {["Apply"] = {EpicAnm("specialist_samson")}},
    [PlayerType.PLAYER_AZAZEL] = {["Apply"] = {EpicAnm("specialist_azazer")}},
    [PlayerType.PLAYER_LAZARUS] = {["Apply"] = {EpicAnm("specialist_lazarus")}},
    [PlayerType.PLAYER_LAZARUS2] = {["Apply"] = {EpicAnm("specialist_lazarus2")}},
    [PlayerType.PLAYER_EDEN] = {["Apply"] = {EpicAnm("specialist_eden")}},
    [PlayerType.PLAYER_THELOST] = {["Apply"] = {EpicAnm("specialist_lost")}},
    [PlayerType.PLAYER_LILITH] = {["Apply"] = {EpicAnm("specialist_lilith")}},
    [PlayerType.PLAYER_KEEPER] = {["Apply"] = {EpicAnm("specialist_keeper")}},
    [PlayerType.PLAYER_APOLLYON] = {["Apply"] = {EpicAnm("specialist_apollyon")}},
    [PlayerType.PLAYER_BETHANY] = {["Apply"] = {EpicAnm("specialist_bethany")}},
    [PlayerType.PLAYER_JACOB] = {["Apply"] = {EpicAnm("specialist_jacob")}},
    [PlayerType.PLAYER_ESAU] = {["Apply"] = {EpicAnm("specialist_esau")}},

    [PlayerType.PLAYER_MAGDALENE_B] = {["Apply"] = {EpicAnm("specialist_magdalene")}},
    [PlayerType.PLAYER_CAIN_B] = {["Apply"] = {EpicAnm("specialist_t_cain")}},
    [PlayerType.PLAYER_JUDAS_B] = {["Apply"] = {EpicAnm("specialist_dark_judas")}},
    [PlayerType.PLAYER_BLUEBABY_B] = {["Apply"] = {EpicAnm("specialist_xxx")}},
    [PlayerType.PLAYER_EVE_B] = {["Apply"] = {EpicAnm("specialist_eve")}},
    [PlayerType.PLAYER_SAMSON_B] = {["Apply"] = {EpicAnm("specialist_samson")}},
    [PlayerType.PLAYER_AZAZEL_B] = {["Apply"] = {EpicAnm("specialist_azazer")}},
    [PlayerType.PLAYER_LAZARUS_B] = {["Apply"] = {EpicAnm("specialist_lazarus")}},
    [PlayerType.PLAYER_EDEN_B] = {["Apply"] = {EpicAnm("specialist_eden")}},
    [PlayerType.PLAYER_THELOST_B] = {["Apply"] = {EpicAnm("specialist_lost")}},
    [PlayerType.PLAYER_LILITH_B] = {["Apply"] = {EpicAnm("specialist_lilith")}},
    [PlayerType.PLAYER_KEEPER_B] = {["Apply"] = {EpicAnm("specialist_keeper")}},
    [PlayerType.PLAYER_APOLLYON_B] = {["Apply"] = {EpicAnm("specialist_apollyon")}},
    [PlayerType.PLAYER_THEFORGOTTEN_B] = {["Apply"] = {EpicAnm("specialist_forgor_bone")}},
    [PlayerType.PLAYER_BETHANY_B] = {["Apply"] = {EpicAnm("specialist_bethany")}},
    [PlayerType.PLAYER_JACOB_B] = {["Apply"] = {EpicAnm("specialist_jacob")}},
    [PlayerType.PLAYER_LAZARUS2_B] = {["Apply"] = {EpicAnm("specialist_lazarus2")}},
    [PlayerType.PLAYER_JACOB2_B] = {["Apply"] = {EpicAnm("specialist_lost")}},
    [PlayerType.PLAYER_THESOUL_B] = {["Apply"] = {EpicAnm("specialist_forgor_soul")}}
}

local musicDefault = {"specialist"}

local music = {
    [PlayerType.PLAYER_CAIN_B] = {"paincialist"}
}


ReactionPack:AddTraumaCostumePack(costumes, "Specialist", costumeDefault)
ReactionPack:AddDanceCostumePack(costumes, "Specialist", costumeDefault)

ReactionPack:AddDanceMusicPack(music, "Specialist", musicDefault)