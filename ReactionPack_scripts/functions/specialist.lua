local function ApplySpecialistMusic()
    local player = Game():GetPlayer(1)
    local music = Isaac.GetMusicIdByName(Epic.SpecialistMusic[player:GetPlayerType()])

    Isaac.DebugString(music)

    if not music then
        music = Isaac.GetMusicIdByName(Epic.SpecialistMusic[PlayerType.PLAYER_ISAAC])
    end

    if MusicManager():GetCurrentMusicID() ~= music then
        MusicManager():Play(music, 1);
    end
    MusicManager():UpdateVolume()
end

function Epic:RemoveSpecialistMusic()
     Game():GetRoom():PlayMusic()
end

local function ApplySpecialistCostume()
    for playerNum = 0, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum)
		local applyCostume = Epic.SpecialistCostumes[player:GetPlayerType()]

        if applyCostume then
            player:AddNullCostume(applyCostume)
            ReactionPack.AppliedCostumes[playerNum] = applyCostume
        else
            player:AddNullCostume(Epic.SpecialistCostumes[PlayerType.PLAYER_ISAAC])
            ReactionPack.AppliedCostumes[playerNum] = Epic.SpecialistCostumes[PlayerType.PLAYER_ISAAC]
        end
    end
end

local function RemoveSpecialistCostume()
    for playerNum = 0, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum)
		local removeCostume = ReactionPack.AppliedCostumes[playerNum]

        if removeCostume then
            player:TryRemoveNullCostume(removeCostume)
        else
            player:TryRemoveNullCostume(Epic.SpecialistCostumes[PlayerType.PLAYER_ISAAC])
        end
    end
end

function Epic:ApplySpecialist()
    ApplySpecialistCostume()
    ApplySpecialistMusic()
end

function Epic:RemoveSpecialist()
    RemoveSpecialistCostume()
    Epic:RemoveSpecialistMusic()
end