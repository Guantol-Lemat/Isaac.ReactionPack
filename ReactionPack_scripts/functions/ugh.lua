local function ApplyUghCostume()
    for playerNum = 0, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum)
		local applyCostume = Ughlite.UghCostumes[player:GetPlayerType()]["Apply"]
		local removeCostume = Ughlite.UghCostumes[player:GetPlayerType()]["Remove"]

        if applyCostume then
            player:AddNullCostume(applyCostume)
            ReactionPack.AppliedCostumes[playerNum] = applyCostume
        else
            player:AddNullCostume(Ughlite.UghCostumes[PlayerType.PLAYER_ISAAC]["Apply"])
            ReactionPack.AppliedCostumes[playerNum] = Ughlite.UghCostumes[PlayerType.PLAYER_ISAAC]["Apply"]
        end

        if removeCostume then
            player:TryRemoveNullCostume(removeCostume)
        end
    end
end

local function RemoveUghCostume()
    for playerNum = 0, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum)
		local applyCostume = Ughlite.UghCostumes[player:GetPlayerType()]["Remove"]
		local removeCostume = ReactionPack.AppliedCostumes[playerNum]

        if applyCostume then
            player:AddNullCostume(applyCostume)
        end

        if removeCostume then
            player:TryRemoveNullCostume(removeCostume)
        end
    end
end

function Ughlite:ApplyUgh()
    ApplyUghCostume()
end

function Ughlite:RemoveUgh()
    RemoveUghCostume()
end