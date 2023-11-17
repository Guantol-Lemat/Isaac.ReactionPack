ReactionPack.FunctionList = {
    Nothing = {Apply = ReactionPack.DoNothing, Remove = ReactionPack.DoNothing, Id = 0},
    Trauma = {Apply = Trauma.ApplyTrauma, Remove = Trauma.RemoveTrauma, Id = 1},
    Ugh = {Apply = Ughlite.ApplyUgh, Remove = Ughlite.RemoveUgh, Id = 2},
    Disappoint = {Apply = Disappoint.ApplyDisappoint, Remove = Disappoint.RemoveDisappoint, Id = 3},
    Pog = {Apply = Poglite.ApplyPog, Remove = Poglite.RemovePog, Id = 4},
    Specialist = {Apply = Epic.ApplySpecialist, Remove = Epic.RemoveSpecialist, Id = 5}
}

ReactionPack.NumberToFunctionList = {
    [ReactionPack.FunctionList.Nothing.Id] = "Nothing",
    [ReactionPack.FunctionList.Trauma.Id] = "Trauma",
    [ReactionPack.FunctionList.Ugh.Id] = "Ugh",
    [ReactionPack.FunctionList.Disappoint.Id] = "Disappoint",
    [ReactionPack.FunctionList.Pog.Id] = "Pog",
    [ReactionPack.FunctionList.Specialist.Id] = "Specialist",
}