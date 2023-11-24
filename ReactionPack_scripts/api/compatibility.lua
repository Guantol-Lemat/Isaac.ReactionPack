local log = require("ReactionPack_scripts.functions.log")

local function GetWarningString(FunctionName)
    return "[WARNING for " .. FunctionName " ] : this feature is not yet implement, hence nothing is going to happen"
end

Trauma = {Integrity = true}

function Trauma:AddUghCostume(key,playerType,ughCostumeId,removeCostumeId,active)
    local costumes = {[playerType] = {}}
    if ughCostumeId then
        costumes[playerType].Apply = {ughCostumeId}
    end
    if removeCostumeId then
        costumes[playerType].Remove = {removeCostumeId}
    end
    ReactionPack:EditTraumaCostumePack(costumes, "Traumatized", false)
end

Ughlite = {Integrity = true}

function Ughlite:AddUghCostume(key,playerType,ughCostumeId,removeCostumeId,active)
    local costumes = {[playerType] = {}}
    if ughCostumeId then
        costumes[playerType].Apply = {ughCostumeId}
    end
    if removeCostumeId then
        costumes[playerType].Remove = {removeCostumeId}
    end
    ReactionPack:EditUghCostumePack(costumes, "Ugh", false)
end

Poglite = {Integrity = true}

function Poglite:AddPogCostume(key,playerType,pogCostumeId,removeCostumeId,active)
    local costumes = {[playerType] = {}}
    if pogCostumeId then
        costumes[playerType].Apply = {pogCostumeId}
    end
    if removeCostumeId then
        costumes[playerType].Remove = {removeCostumeId}
    end
    ReactionPack:EditPogCostumePack(costumes, "Pog", false)
end

SpecialistModAPI = {Integrity = true}

function SpecialistModAPI:AddDanceCostume(playerType --[[PlayerType]] , costumeID --[[int]] , override --[[boolean]] )
    local costumes = {[playerType] = {}}
    if costumeID then
        costumes[playerType].Apply = {costumeID}
    end
    ReactionPack:EditDanceCostumePack(costumes, "Specialist", override)
end
function SpecialistModAPI:RemoveDanceCostume(playerType --[[PlayerType]] )
    local costumes = {[playerType] = nil}
    ReactionPack:EditDanceCostumePack(costumes, "Specialist", true)
end

function SpecialistModAPI:AddItemCostume(collectibleType --[[CollectibleType]] , costumeID --[[int]] , override --[[boolean]] )
    local warningString = GetWarningString("SpecialistModAPI:AddItemCostume")
    log.print(warningString)
end
function SpecialistModAPI:RemoveItemCostume(collectibleType --[[CollectibleType]] )
    local warningString = GetWarningString("SpecialistModAPI:RemoveItemCostume")
    log.print(warningString)
end