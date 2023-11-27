module = {}

function PatchEpiphany()

    local function EpicAnm(name)
        return Isaac.GetCostumeIdByPath("gfx/characters/specialist/" .. name .. ".anm2");
    end

    if Epiphany then
        local danceCostumesEpiphany = {
            [Epiphany.PlayerType["ISAAC"]] = {Apply = {EpicAnm("specialist_isaac")}},
            [Epiphany.PlayerType["MAGDALENE"]] = {Apply = {EpicAnm("specialist_magdalene")}},
            [Epiphany.PlayerType["CAIN"]] = {Apply = {EpicAnm("specialist_cain")}},
            [Epiphany.PlayerType["JUDAS"]] = {Apply = {EpicAnm("specialist_dark_judas")}},
            [Epiphany.PlayerType["JUDAS2"]] = {Apply = {EpicAnm("specialist_dark_judas")}},
            [Epiphany.PlayerType["JUDAS3"]] = {Apply = {EpicAnm("specialist_dark_judas")}},
            [Epiphany.PlayerType["SAMSON"]] = {Apply = {EpicAnm("specialist_samson")}},
            [Epiphany.PlayerType["EDEN"]] = {Apply = {EpicAnm("specialist_eden")}},
        }

        ReactionPack.Interface.EditDanceCostumePack(danceCostumesEpiphany, "Specialist", true)
    end
end

module.PatchEpiphany = PatchEpiphany

return module