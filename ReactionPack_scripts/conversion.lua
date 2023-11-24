ReactionPack.IdToSetName = {
    [ReactionPack.Sets.Disabled] = "Disabled",
    [ReactionPack.Sets.Trauma] = "Trauma",
    [ReactionPack.Sets.Ugh] = "Ugh",
    [ReactionPack.Sets.Neutral] = "Neutral",
    [ReactionPack.Sets.Pog] = "Pog",
    [ReactionPack.Sets.Dance] = "Dance",
}

ReactionPack.SetTypeToPacks = {
    [ReactionPack.SetTypes.Costume] = {Set = "CostumeSet", Pack = "CostumePack"},
    [ReactionPack.SetTypes.Music] = {Set = "MusicSet", Pack = "MusicPack"},
    [ReactionPack.SetTypes.Sound] = {Set = "SoundSet", Pack = "SoundPack"}
}

ReactionPack.QualityStatusToReactionSetting = {
    [ReactionAPI.QualityStatus.GLITCHED] = "Reaction_Glitched",
    [ReactionAPI.QualityStatus.QUALITY_0] = "Reaction_0",
    [ReactionAPI.QualityStatus.QUALITY_1] = "Reaction_1",
    [ReactionAPI.QualityStatus.QUALITY_2] = "Reaction_2",
    [ReactionAPI.QualityStatus.QUALITY_3] = "Reaction_3",
    [ReactionAPI.QualityStatus.QUALITY_4] = "Reaction_4"
}

function ReactionPack.PackIDToName(SetID, SetType, PackID)
    return ReactionPack[SetType][SetID].IDs[PackID]
end