local defaultSet = ReactionPack.Sets.Disabled
local defaultPack = ReactionPack.Pack.DEFAULT
local defaultSetData = {CostumeSet = defaultSet, CostumePack = defaultPack, MusicSet = defaultSet, MusicPack = defaultPack, SoundSet = defaultSet, SoundPack = defaultPack}


ReactionPack.Settings = {
	ReactInBattle = true,
    BlindBypass = false,
    DeathCertificateDimensionReaction = true,
    WhineThreshold = ReactionAPI.QualityStatus.NO_ITEMS,
    Reaction_Glitched = defaultSet,
    Reaction_0 = defaultSet,
    Reaction_1 = defaultSet,
    Reaction_2 = defaultSet,
    Reaction_3 = defaultSet,
    Reaction_4 = defaultSet,
    Isolation_Glitched = false,
    Isolation_0 = false,
    Isolation_1 = false,
    Isolation_2 = false,
    Isolation_3 = false,
    Isolation_4 = false,
    Trauma = defaultSetData,
    Ugh = defaultSetData,
    Neutral = defaultSetData,
    Pog = defaultSetData,
    Dance = defaultSetData
}