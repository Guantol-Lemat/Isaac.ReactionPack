local function BaseAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/" .. name .. ".anm2");
end

local function TraumaAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/traumatized/" .. name .. ".anm2");
end

local costumeDefault = {["Apply"] = {TraumaAnm("isaactrauma")}, ["Remove"] = nil}

local costumes = {
    [PlayerType.PLAYER_CAIN] = {["Apply"] = {TraumaAnm("caintrauma")}},
    [PlayerType.PLAYER_AZAZEL] = {["Apply"] = {TraumaAnm("azazeltrauma")}},
    [PlayerType.PLAYER_CAIN_B] = {["Apply"] = {TraumaAnm("paintrauma")}},
    [PlayerType.PLAYER_BLUEBABY_B] = {["Apply"] = {TraumaAnm("bluebabytraumab")}, ["Remove"] = {BaseAnm("character_b05_bluebaby")}},
    [PlayerType.PLAYER_SAMSON_B] = {["Apply"] = {TraumaAnm("samsontraumab")}, ["Remove"] = {BaseAnm("character_b07_samson")}},
    [PlayerType.PLAYER_AZAZEL_B] = {["Apply"] = {TraumaAnm("azazeltraumab")}},
    [PlayerType.PLAYER_LILITH_B] = {["Apply"] = {TraumaAnm("lilithtraumab")}},
    [PlayerType.PLAYER_KEEPER_B] = {["Apply"] = {TraumaAnm("keepertraumab")}, ["Remove"] = {BaseAnm("character_b13_keeper")}},
    [PlayerType.PLAYER_JACOB_B] = {["Apply"] = {TraumaAnm("jacobtraumab")}, ["Remove"] = {BaseAnm("character_b17_jacob")}},
    [PlayerType.PLAYER_LAZARUS2_B] = {["Apply"] = {TraumaAnm("lazarus2traumab")}, ["Remove"] = {BaseAnm("character_b09_lazarus2")}},
    [PlayerType.PLAYER_JACOB2_B] = {["Apply"] = {TraumaAnm("jacob2traumab")}, ["Remove"] = {BaseAnm("character_b17_jacob2")}}
}

local musicDefault = {"burningmemory"}

local music = {
    [PlayerType.PLAYER_CAIN_B] = {"happyburningmemory"}
}

local soundDefault = {'TASMScream'}

ReactionPack.AddTraumaCostumePack(costumes, "Traumatized", costumeDefault)

ReactionPack.AddTraumaMusicPack(music, "Traumatized", musicDefault)

ReactionPack.AddTraumaSoundPack({}, "TASM Scream", soundDefault)