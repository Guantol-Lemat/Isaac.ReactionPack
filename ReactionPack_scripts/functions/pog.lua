local function ApplyPogCostume()
    for playerNum = 0, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum)
		local applyCostume = Poglite.PogCostumes[player:GetPlayerType()]["Apply"]
		local removeCostume = Poglite.PogCostumes[player:GetPlayerType()]["Remove"]

        if applyCostume then
            player:AddNullCostume(applyCostume)
            ReactionPack.AppliedCostumes[playerNum] = applyCostume
        else
            player:AddNullCostume(Poglite.PogCostumes[PlayerType.PLAYER_ISAAC]["Apply"])
            ReactionPack.AppliedCostumes[playerNum] = Poglite.PogCostumes[PlayerType.PLAYER_ISAAC]["Apply"]
        end

        if removeCostume then
            player:TryRemoveNullCostume(removeCostume)
        end
    end
end

local function RemovePogCostume()
    for playerNum = 0, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum)
		local applyCostume = Poglite.PogCostumes[player:GetPlayerType()]["Remove"]
		local removeCostume = ReactionPack.AppliedCostumes[playerNum]

        if applyCostume then
            player:AddNullCostume(applyCostume)
        end

        if removeCostume then
            player:TryRemoveNullCostume(removeCostume)
        else
            player:TryRemoveNullCostume(Poglite.PogCostumes[PlayerType.PLAYER_ISAAC]["Apply"])
        end
    end
end

function Poglite:ApplyPog()
    ApplyPogCostume()
end

function Poglite:RemovePog()
    RemovePogCostume()
end