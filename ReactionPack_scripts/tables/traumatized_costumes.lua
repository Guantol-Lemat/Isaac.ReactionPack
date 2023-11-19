function ReactionPack:AddTraumaPack(Costumes, PackName, Default)
    if ReactionPack.CostumeSets[ReactionPack.Sets.Trauma][PackName] ~= nil then
        local errorString = "[ERROR in AddTraumaPack]: Pack Already Exists"
        Isaac.ConsoleOutput(errorString)
        Isaac.DebugString(errorString)
        return
    end
    ReactionPack.CostumeSets[ReactionPack.Sets.Trauma][PackName] = Costumes
    table.insert(ReactionPack.CostumeSets[ReactionPack.Sets.Trauma].IDs, PackName)
    ReactionPack.CostumeSets[ReactionPack.Sets.Trauma][PackName].Default = Default
end

function ReactionPack:EditTraumaPack(Costumes, PackName, Overwrite)
    if ReactionPack.CostumeSets[ReactionPack.Sets.Trauma][PackName] == nil then
        local errorString = "[ERROR in EditTraumaPack]: Pack Does Not Exist"
        Isaac.ConsoleOutput(errorString)
        Isaac.DebugString(errorString)
        return
    end
    Overwrite = Overwrite or false
    for playerID, costumes in pairs(Costumes) do
        if ReactionPack.CostumeSets[ReactionPack.Sets.Trauma][PackName][playerID] ~= nil or Overwrite then
            ReactionPack.CostumeSets[ReactionPack.Sets.Trauma][PackName][playerID] = costumes
        end
    end
end

local function BaseAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/" .. name .. ".anm2");
end

local function TraumaAnm(name)
    return Isaac.GetCostumeIdByPath("gfx/characters/traumatized/" .. name .. ".anm2");
end

Trauma.Default = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil}

Trauma.Costumes = {
    [PlayerType.PLAYER_CAIN] = {["Apply"] = TraumaAnm("caintrauma")},
    [PlayerType.PLAYER_AZAZEL] = {["Apply"] = TraumaAnm("azazeltrauma")},
    [PlayerType.PLAYER_CAIN_B] = {["Apply"] = TraumaAnm("paintrauma")},
    [PlayerType.PLAYER_BLUEBABY_B] = {["Apply"] = TraumaAnm("bluebabytraumab"), ["Remove"] = BaseAnm("character_b05_bluebaby")},
    [PlayerType.PLAYER_SAMSON_B] = {["Apply"] = TraumaAnm("samsontraumab"), ["Remove"] = BaseAnm("character_b07_samson")},
    [PlayerType.PLAYER_AZAZEL_B] = {["Apply"] = TraumaAnm("azazeltraumab")},
    [PlayerType.PLAYER_LILITH_B] = {["Apply"] = TraumaAnm("lilithtraumab")},
    [PlayerType.PLAYER_KEEPER_B] = {["Apply"] = TraumaAnm("keepertraumab"), ["Remove"] = BaseAnm("character_b13_keeper")},
    [PlayerType.PLAYER_JACOB_B] = {["Apply"] = TraumaAnm("jacobtraumab"), ["Remove"] = BaseAnm("character_b17_jacob")},
    [PlayerType.PLAYER_LAZARUS2_B] = {["Apply"] = TraumaAnm("lazarus2traumab"), ["Remove"] = BaseAnm("character_b09_lazarus2")},
    [PlayerType.PLAYER_JACOB2_B] = {["Apply"] = TraumaAnm("jacob2traumab"), ["Remove"] = BaseAnm("character_b17_jacob2")}
}

Trauma.TraumaCostumes = {
    [PlayerType.PLAYER_ISAAC] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_MAGDALENE] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_CAIN] = {["Apply"] = TraumaAnm("caintrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_JUDAS] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_BLACKJUDAS] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_BLUEBABY] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_EVE] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_SAMSON] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_AZAZEL] = {["Apply"] = TraumaAnm("azazeltrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_LAZARUS] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_LAZARUS2] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_EDEN] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_THELOST] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_LILITH] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_KEEPER] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_APOLLYON] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_THEFORGOTTEN] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_THESOUL] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_BETHANY] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_JACOB] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_ESAU] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},

    [PlayerType.PLAYER_ISAAC_B] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_MAGDALENE_B] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_CAIN_B] = {["Apply"] = TraumaAnm("paintrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_JUDAS_B] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_BLUEBABY_B] = {["Apply"] = TraumaAnm("bluebabytraumab"), ["Remove"] = BaseAnm("character_b05_bluebaby")},
    [PlayerType.PLAYER_EVE_B] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_SAMSON_B] = {["Apply"] = TraumaAnm("samsontraumab"), ["Remove"] = BaseAnm("character_b07_samson")},
    [PlayerType.PLAYER_AZAZEL_B] = {["Apply"] = TraumaAnm("azazeltraumab"), ["Remove"] = nil},
    [PlayerType.PLAYER_LAZARUS_B] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_EDEN_B] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_THELOST_B] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_LILITH_B] = {["Apply"] = TraumaAnm("lilithtraumab"), ["Remove"] = nil},
    [PlayerType.PLAYER_KEEPER_B] = {["Apply"] = TraumaAnm("keepertraumab"), ["Remove"] = BaseAnm("character_b13_keeper")},
    [PlayerType.PLAYER_APOLLYON_B] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_THEFORGOTTEN_B] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_BETHANY_B] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil},
    [PlayerType.PLAYER_JACOB_B] = {["Apply"] = TraumaAnm("jacobtraumab"), ["Remove"] = BaseAnm("character_b17_jacob")},
    [PlayerType.PLAYER_LAZARUS2_B] = {["Apply"] = TraumaAnm("lazarus2traumab"), ["Remove"] = BaseAnm("character_b09_lazarus2")},
    [PlayerType.PLAYER_JACOB2_B] = {["Apply"] = TraumaAnm("jacob2traumab"), ["Remove"] = BaseAnm("character_b17_jacob2")},
    [PlayerType.PLAYER_THESOUL_B] = {["Apply"] = TraumaAnm("isaactrauma"), ["Remove"] = nil}
}

Trauma:AddTraumaCostumePack(Trauma.Costumes, "Trauma", Trauma.Default)