local log = require("reactionpack_scripts.functions.log")
local module = {}

local function FindPackID(SetName, SetType, SearchedName, PackData)
    local SavedSetID = ReactionPack.SavedSettings[SetName][ReactionPack.SetTypeToPacks[SetType].Set]

    for packId, packName in ipairs(ReactionPack[SetType][SavedSetID].IDs) do
        if packName == SearchedName then
            return packId
        end
    end
    log.print("[ERROR in ReactionPack]: Confirmed Pack [" .. SearchedName .. "] could not be found")
    return ReactionPack.DefaultSettings[SetName][PackData.Pack]
end

local function SavedReactionExists(Reaction)
    local SavedFunctionID = ReactionPack.SavedSettings[Reaction]

    return ReactionPack.IdToSetName[SavedFunctionID] ~= nil
end

local function SavedSetExists(SetName, SetType)
    local SavedSetID = ReactionPack.SavedSettings[SetName][ReactionPack.SetTypeToPacks[SetType].Set]

    local SetExists = ReactionPack[SetType][SavedSetID] ~= nil
    local SetIsNotEmpty = #ReactionPack[SetType][SavedSetID].IDs > 0

    return SetExists and SetIsNotEmpty
end

local function SavedPackExists(SetName, SetType)
    local SavedSetID = ReactionPack.SavedSettings[SetName][ReactionPack.SetTypeToPacks[SetType].Set]
    local SavedPackName = ReactionPack.SavedSettings[SetName][ReactionPack.SetTypeToPacks[SetType].Pack]

    return ReactionPack[SetType][SavedSetID][SavedPackName] ~= nil
end

local function ResetReactionToDefault(Reaction)
    ReactionPack.Settings[Reaction] = ReactionPack.DefaultSettings[Reaction]
    ReactionPack.Settings[Reaction] = ReactionPack.DefaultSettings[Reaction]
end

local function ResetSetToDefault(SetName, PackData)
    ReactionPack.Settings[SetName][PackData.Set] = ReactionPack.DefaultSettings[SetName][PackData.Set]
    ReactionPack.SavedSettings[SetName][PackData.Set] = ReactionPack.DefaultSettings[SetName][PackData.Set]
end

local function ResetPackToDefault(SetName, SetType, PackData)
    local defaultPackName = ReactionPack.PackIDToName(ReactionPack.SavedSettings[SetName][PackData.Set], SetType, ReactionPack.DefaultSettings[SetName][PackData.Pack])
    ReactionPack.Settings[SetName][PackData.Pack] = ReactionPack.DefaultSettings[SetName][PackData.Pack]
    ReactionPack.SavedSettings[SetName][PackData.Pack] = defaultPackName
end

local function CheckReactionIntegrity()
    for _, reactionName in pairs(ReactionPack.Reactions) do
        if not SavedReactionExists(reactionName) then
            local errorString = "[WARNING for Reaction Port Pack]: Saved Reaction for [" .. string.gsub(reactionName, "_", "") .. "] missing, reverting to Default"
            log.print(errorString)
            ResetReactionToDefault(reactionName)
        end
    end
end

local function SetReactionFunctions()
    for qualityStatus, reaction in pairs(ReactionPack.Reactions) do
        local functionID = ReactionPack.Settings[reaction]
        ReactionPack.ApplyFunctions[qualityStatus] = ReactionPack.FunctionList[ReactionPack.IdToSetName[functionID]].Apply
        ReactionPack.RemoveFunctions[qualityStatus] = ReactionPack.FunctionList[ReactionPack.IdToSetName[functionID]].Remove
    end
end

local function CheckSetIntegrity()
    for _, setName in ipairs(ReactionPack.IdToSetName) do
        for _, setType in pairs(ReactionPack.SetTypes) do
            local packData = ReactionPack.SetTypeToPacks[setType]
            if ReactionPack.SavedSettings[setName][packData.Set] == ReactionPack.Sets.Disabled then
                goto continue
            end
            if not SavedSetExists(setName, setType) then
                local errorString = "[WARNING for Reaction Port Pack " .. setType .. "]: Set [" .. ReactionPack.IdToSetName[ReactionPack.SavedSettings[setName][packData.Set]] .. "] missing or empty, reverting to Default"
                log.print(errorString)
                ResetSetToDefault(setName, packData)
                ResetPackToDefault(setName, setType, packData)
                goto continue
            end
            if not SavedPackExists(setName, setType) then
                local errorString = "[WARNING for Reaction Port Pack " .. setType .. "]: Pack [" .. tostring(ReactionPack.SavedSettings[setName][packData.Pack]) .. "] from Set [" .. tostring(ReactionPack.IdToSetName[ReactionPack.SavedSettings[setName][packData.Set]]) .. "] is missing, reverting to Default"
                log.print(errorString)
                ResetPackToDefault(setName, setType, packData)
                goto continue
            end
            local savedPackName = ReactionPack.SavedSettings[setName][ReactionPack.SetTypeToPacks[setType].Pack]
            ReactionPack.Settings[setName][packData.Pack] = FindPackID(setName, setType, savedPackName, packData)
            ::continue::
        end
    end
end

local function Integrity_Check()
    CheckReactionIntegrity()
    SetReactionFunctions()
    CheckSetIntegrity()
end

module.CheckIntegrity = Integrity_Check

return module