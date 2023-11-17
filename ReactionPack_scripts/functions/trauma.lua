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
    for playerNum = 0, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum)
		local applyCostume = Trauma.TraumaCostumes[player:GetPlayerType()]["Apply"]
		local removeCostume = Trauma.TraumaCostumes[player:GetPlayerType()]["Remove"]

        if applyCostume then
            player:AddNullCostume(applyCostume)
            ReactionPack.AppliedCostumes[playerNum] = applyCostume
        else
            player:AddNullCostume(Trauma.TraumaCostumes[PlayerType.PLAYER_ISAAC]["Apply"])
            ReactionPack.AppliedCostumes[playerNum] = Trauma.TraumaCostumes[PlayerType.PLAYER_ISAAC]["Apply"]
        end

        if removeCostume then
            player:TryRemoveNullCostume(removeCostume)
        end
    end
end

local function RemoveTraumaCostume()
    for playerNum = 0, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum)
		local applyCostume = Trauma.TraumaCostumes[player:GetPlayerType()]["Remove"]
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