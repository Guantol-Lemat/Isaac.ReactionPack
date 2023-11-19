local function ApplyTraumaMusic()
    local player = Game():GetPlayer(1)
    local music = Isaac.GetMusicIdByName(Trauma.TraumaMusic[player:GetPlayerType()])

    Isaac.DebugString(music)

    if not music then
        music = Isaac.GetMusicIdByName(Trauma.TraumaMusic[PlayerType.PLAYER_ISAAC])
    end

    if MusicManager():GetCurrentMusicID() ~= music then
        MusicManager():Play(music, 1);
    end
    MusicManager():UpdateVolume()
end

function Trauma:RemoveTraumaMusic()
     Game():GetRoom():PlayMusic()
end

local function ApplyTraumaCostume()
    local costumeSet = ReactionPack.Settings.Trauma.CostumeSet
    local packName = ReactionPack.CostumeSets[costumeSet].IDs[ReactionPack.Settings.Trauma.CostumePack]
    for playerNum = 0, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum)
        local playerType = player:GetPlayerType()
        local applyCostume = nil
        local removeCostume = nil
--		local applyCostume = Trauma.TraumaCostumes[player:GetPlayerType()]["Apply"]
--		local removeCostume = Trauma.TraumaCostumes[player:GetPlayerType()]["Remove"]
        if ReactionPack.CostumeSets[costumeSet][packName][playerType] == nil then
            applyCostume = ReactionPack.CostumeSets[costumeSet][packName].Default.Apply
            removeCostume = ReactionPack.CostumeSets[costumeSet][packName].Default.Remove
        else
            applyCostume = ReactionPack.CostumeSets[costumeSet][packName][playerType].Apply or ReactionPack.CostumeSets[costumeSet][packName].Default.Apply
            removeCostume = ReactionPack.CostumeSets[costumeSet][packName][playerType].Remove or ReactionPack.CostumeSets[costumeSet][packName].Default.Remove
        end

        if applyCostume then
            player:AddNullCostume(applyCostume)
            ReactionPack.AppliedCostumes[playerNum] = applyCostume
        end
        if removeCostume then
            player:TryRemoveNullCostume(removeCostume)
        end
    end
end

local function RemoveTraumaCostume()
    local costumeSet = ReactionPack.Settings.Trauma.CostumeSet
    local packName = ReactionPack.Settings.Trauma.CostumePack
    for playerNum = 0, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum)
--		local applyCostume = Trauma.TraumaCostumes[player:GetPlayerType()]["Remove"]
		local removeCostume = ReactionPack.AppliedCostumes[playerNum]

        if applyCostume then
            player:AddNullCostume(applyCostume)
        end
        if removeCostume then
            player:TryRemoveNullCostume(removeCostume)
        end
    end
end

function Trauma:ApplyTrauma()
    ApplyTraumaCostume()
    if ReactionPack.Settings.Trauma.EnableMusic then
        ApplyTraumaMusic()
    end
end

function Trauma:RemoveTrauma()
    RemoveTraumaCostume()
    Trauma:RemoveTraumaMusic()
end