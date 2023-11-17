ReactionPack.ApplyFunctions = {
    [ReactionAPI.QualityStatus.NO_ITEMS] = ReactionPack.DoNothing, 
    [ReactionAPI.QualityStatus.GLITCHED] = ReactionPack.DoNothing,
    [ReactionAPI.QualityStatus.QUALITY_0] = Trauma.ApplyTrauma,
    [ReactionAPI.QualityStatus.QUALITY_1] = Ughlite.ApplyUgh,
    [ReactionAPI.QualityStatus.QUALITY_2] = Disappoint.ApplyDisappoint,
    [ReactionAPI.QualityStatus.QUALITY_3] = Poglite.ApplyPog,
    [ReactionAPI.QualityStatus.QUALITY_4] = Epic.ApplySpecialist
}

ReactionPack.RemoveFunctions = {
    [ReactionAPI.QualityStatus.NO_ITEMS] = ReactionPack.DoNothing, 
    [ReactionAPI.QualityStatus.GLITCHED] = ReactionPack.DoNothing,
    [ReactionAPI.QualityStatus.QUALITY_0] = Trauma.RemoveTrauma,
    [ReactionAPI.QualityStatus.QUALITY_1] = Ughlite.RemoveUgh,
    [ReactionAPI.QualityStatus.QUALITY_2] = Disappoint.RemoveDisappoint,
    [ReactionAPI.QualityStatus.QUALITY_3] = Poglite.RemovePog,
    [ReactionAPI.QualityStatus.QUALITY_4] = Epic.RemoveSpecialist
}

ReactionPack.Settings = {
    ModVersion = ReactionPack.ModVersion,
	ReactInBattle = true,
    BlindBypass = false,
    Reaction_Glitched = ReactionPack.FunctionList.Nothing.Id,
    Reaction_0 = ReactionPack.FunctionList.Trauma.Id,
    Reaction_1 = ReactionPack.FunctionList.Ugh.Id,
    Reaction_2 = ReactionPack.FunctionList.Disappoint.Id,
    Reaction_3 = ReactionPack.FunctionList.Pog.Id,
    Reaction_4 = ReactionPack.FunctionList.Specialist.Id,
    Trauma = {EnableMusic = true},
    Specialist = {EnableMusic = true}
}