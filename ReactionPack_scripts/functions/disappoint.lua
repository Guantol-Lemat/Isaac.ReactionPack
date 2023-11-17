local function ApplyDisappointCostume()
    for playerNum = 0, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum)
		local applyCostume = Disappoint.DisappointCostumes[player:GetPlayerType()]["Apply"]
		local removeCostume = Disappoint.DisappointCostumes[player:GetPlayerType()]["Remove"]

        if applyCostume then
            player:AddNullCostume(applyCostume)
            ReactionPack.AppliedCostumes[playerNum] = applyCostume
        else
            player:AddNullCostume(Disappoint.DisappointCostumes[PlayerType.PLAYER_ISAAC]["Apply"])
            ReactionPack.AppliedCostumes[playerNum] = Disappoint.DisappointCostumes[PlayerType.PLAYER_ISAAC]["Apply"]
        end

        if removeCostume then
            player:TryRemoveNullCostume(removeCostume)
        end
    end
end

local function RemoveDisappointCostume()
    for playerNum = 0, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum)
		local applyCostume = Disappoint.DisappointCostumes[player:GetPlayerType()]["Remove"]
		local removeCostume = ReactionPack.AppliedCostumes[playerNum]

        if applyCostume then
            player:AddNullCostume(applyCostume)
        end

        if removeCostume then
            player:TryRemoveNullCostume(removeCostume)
        else
            player:TryRemoveNullCostume(Disappoint.DisappointCostumes[PlayerType.PLAYER_ISAAC]["Apply"])
        end
    end
end

function Disappoint:ApplyDisappoint()
    ApplyDisappointCostume()
end

function Disappoint:RemoveDisappoint()
    RemoveDisappointCostume()
end