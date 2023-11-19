local default = ReactionPack.CostumePack.DEFAULT

ReactionPack.ApplyFunctions = {
    [ReactionAPI.QualityStatus.NO_ITEMS] = ReactionPack.DoNothing, 
    [ReactionAPI.QualityStatus.GLITCHED] = ReactionPack.DoNothing,
    [ReactionAPI.QualityStatus.QUALITY_0] = Trauma.ApplyTrauma,
    [ReactionAPI.QualityStatus.QUALITY_1] = Ughlite.ApplyUgh,
    [ReactionAPI.QualityStatus.QUALITY_2] = Disappoint.ApplyNeutral,
    [ReactionAPI.QualityStatus.QUALITY_3] = Poglite.ApplyPog,
    [ReactionAPI.QualityStatus.QUALITY_4] = Epic.ApplyDance
}

ReactionPack.RemoveFunctions = {
    [ReactionAPI.QualityStatus.NO_ITEMS] = ReactionPack.DoNothing, 
    [ReactionAPI.QualityStatus.GLITCHED] = ReactionPack.DoNothing,
    [ReactionAPI.QualityStatus.QUALITY_0] = Trauma.RemoveTrauma,
    [ReactionAPI.QualityStatus.QUALITY_1] = Ughlite.RemoveUgh,
    [ReactionAPI.QualityStatus.QUALITY_2] = Disappoint.RemoveNeutral,
    [ReactionAPI.QualityStatus.QUALITY_3] = Poglite.RemovePog,
    [ReactionAPI.QualityStatus.QUALITY_4] = Epic.RemoveDance
}

ReactionPack.Settings.Reaction_Glitched = ReactionPack.FunctionList.Nothing.Id
ReactionPack.Settings.Reaction_0 = ReactionPack.FunctionList.Trauma.Id
ReactionPack.Settings.Reaction_1 = ReactionPack.FunctionList.Ugh.Id
ReactionPack.Settings.Reaction_2 = ReactionPack.FunctionList.Neutral.Id
ReactionPack.Settings.Reaction_3 = ReactionPack.FunctionList.Pog.Id
ReactionPack.Settings.Reaction_4 = ReactionPack.FunctionList.Dance.Id

ReactionPack.Settings.Trauma = {CostumeSet = ReactionPack.Sets.Trauma, CostumePack = default, MusicSet = ReactionPack.Sets.Trauma, MusicPack = default}
ReactionPack.Settings.Ugh = {CostumeSet = ReactionPack.Sets.Ugh, CostumePack = default, MusicSet = ReactionPack.Sets.Nothing, MusicPack = default}
ReactionPack.Settings.Neutral = {CostumeSet = ReactionPack.Sets.Neutral, CostumePack = default, MusicSet = ReactionPack.Sets.Nothing, MusicPack = default}
ReactionPack.Settings.Pog = {CostumeSet = ReactionPack.Sets.Pog, CostumePack = default, MusicSet = ReactionPack.Sets.Nothing, MusicPack = default}
ReactionPack.Settings.Dance = {CostumeSet = ReactionPack.Sets.Dance, CostumePack = default, MusicSet = ReactionPack.Sets.Dance, MusicPack = default}
--    Trauma = {EnableMusic = true},
--    Specialist = {EnableMusic = true}