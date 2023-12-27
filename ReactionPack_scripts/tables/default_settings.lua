local defaultPack = ReactionPack.Pack.DEFAULT

ReactionPack.DefaultSettings = {}

ReactionPack.ApplyFunctions = {
    [ReactionAPI.QualityStatus.NO_ITEMS] = ReactionPack.DoNothing, 
    [ReactionAPI.QualityStatus.GLITCHED] = ReactionPack.DoNothing,
    [ReactionAPI.QualityStatus.QUALITY_0] = ReactionPack.ApplyTrauma,
    [ReactionAPI.QualityStatus.QUALITY_1] = ReactionPack.ApplyUgh,
    [ReactionAPI.QualityStatus.QUALITY_2] = ReactionPack.ApplyNeutral,
    [ReactionAPI.QualityStatus.QUALITY_3] = ReactionPack.ApplyPog,
    [ReactionAPI.QualityStatus.QUALITY_4] = ReactionPack.ApplyDance
}

ReactionPack.RemoveFunctions = {
    [ReactionAPI.QualityStatus.NO_ITEMS] = ReactionPack.DoNothing, 
    [ReactionAPI.QualityStatus.GLITCHED] = ReactionPack.DoNothing,
    [ReactionAPI.QualityStatus.QUALITY_0] = ReactionPack.RemoveTrauma,
    [ReactionAPI.QualityStatus.QUALITY_1] = ReactionPack.RemoveUgh,
    [ReactionAPI.QualityStatus.QUALITY_2] = ReactionPack.RemoveNeutral,
    [ReactionAPI.QualityStatus.QUALITY_3] = ReactionPack.RemovePog,
    [ReactionAPI.QualityStatus.QUALITY_4] = ReactionPack.RemoveDance
}

ReactionPack.DefaultSettings.ReactInBattle = true
ReactionPack.DefaultSettings.BlindBypass = false
ReactionPack.DefaultSettings.DeathCertificateDimensionReaction = true
ReactionPack.DefaultSettings.WhineThreshold = ReactionAPI.QualityStatus.NO_ITEMS

ReactionPack.DefaultSettings.Reaction_Glitched = ReactionPack.FunctionList.Disabled.Id
ReactionPack.DefaultSettings.Reaction_0 = ReactionPack.FunctionList.Trauma.Id
ReactionPack.DefaultSettings.Reaction_1 = ReactionPack.FunctionList.Ugh.Id
ReactionPack.DefaultSettings.Reaction_2 = ReactionPack.FunctionList.Neutral.Id
ReactionPack.DefaultSettings.Reaction_3 = ReactionPack.FunctionList.Pog.Id
ReactionPack.DefaultSettings.Reaction_4 = ReactionPack.FunctionList.Dance.Id

ReactionPack.DefaultSettings.Isolation_Glitched = false
ReactionPack.DefaultSettings.Isolation_0 = false
ReactionPack.DefaultSettings.Isolation_1 = false
ReactionPack.DefaultSettings.Isolation_2 = false
ReactionPack.DefaultSettings.Isolation_3 = false
ReactionPack.DefaultSettings.Isolation_4 = false

ReactionPack.DefaultSettings.Trauma = {CostumeSet = ReactionPack.Sets.Trauma, CostumePack = defaultPack, MusicSet = ReactionPack.Sets.Trauma, MusicPack = defaultPack, SoundSet = ReactionPack.Sets.Disabled, SoundPack = defaultPack}
ReactionPack.DefaultSettings.Ugh = {CostumeSet = ReactionPack.Sets.Ugh, CostumePack = defaultPack, MusicSet = ReactionPack.Sets.Disabled, MusicPack = defaultPack, SoundSet = ReactionPack.Sets.Ugh, SoundPack = defaultPack}
ReactionPack.DefaultSettings.Neutral = {CostumeSet = ReactionPack.Sets.Neutral, CostumePack = defaultPack, MusicSet = ReactionPack.Sets.Disabled, MusicPack = defaultPack, SoundSet = ReactionPack.Sets.Disabled, SoundPack = defaultPack}
ReactionPack.DefaultSettings.Pog = {CostumeSet = ReactionPack.Sets.Pog, CostumePack = defaultPack, MusicSet = ReactionPack.Sets.Disabled, MusicPack = defaultPack, SoundSet = ReactionPack.Sets.Disabled, SoundPack = defaultPack}
ReactionPack.DefaultSettings.Dance = {CostumeSet = ReactionPack.Sets.Dance, CostumePack = defaultPack, MusicSet = ReactionPack.Sets.Dance, MusicPack = defaultPack, SoundSet = ReactionPack.Sets.Disabled, SoundPack = defaultPack}