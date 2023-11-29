local news = "Reaction Port Pack News:"

local versions = {
    "1.0.0",
    "1.0.1"
}

local changeLog = {
    ["1.0.1"] = {
        "Now Compatible with Soundtrack Menu",
        "Added Diagnostics for easier Debugging"
    },
    ["1.1.0"] = {
        "New POG Costume Pack",
        "New Trauma Sound Pack",
        "New Dance Sound Pack",
        "Use the Settings to enable them"
    }
}

local renderAtBottom = false
local addMessages = false
local messageList = {}
local maxMessages = 7

local font = Font()
font:Load('font/terminus8.fnt')
local game = Game()

local counter = 0
local counterMax = 20 * 60 -- 20 seconds
local noAlphaCounter = 10 * 60 -- 10 seconds
local yOffset = 4 -- from top or bottom
local red = KColor(1, 0, 0, 1)
local yellow = KColor(1, 1, 0, 1)

local function getScreenSize()
    if REPENTANCE then
        return Vector(Isaac.GetScreenWidth(), Isaac.GetScreenHeight())
      end

    -- ab+ / based off of code from kilburn
    local room = game:GetRoom()
    local pos = room:WorldToScreenPosition(Vector(0,0)) - room:GetRenderScrollOffset() - game.ScreenShakeOffset

    local rx = pos.X + 60 * 26 / 40
    local ry = pos.Y + 140 * (26 / 40)

    return Vector(rx * 2 + 13 * 26, ry * 2 + 7 * 26)
end

local function AddVersionMessages(Version)
    if changeLog[Version] then
        for _, message in pairs(changeLog[Version]) do
            table.insert(messageList, message)
        end
    end
end

local function GetNewMessages()
    for _, version in ipairs(versions) do
        if addMessages then
            AddVersionMessages(version)
        else
            addMessages = ReactionPack.SavedSettings.ModVersion == version
        end
    end
end

local function LimitMessages()
    if #messageList > maxMessages then
        table.remove(messageList, 1)
        LimitMessages()
    end
    return
end

local function RenderMessages()
    if counter < counterMax then
        local ss = getScreenSize()
        local ScreenCenter = (ss.X / 2)
        local alphaValue = counter < (noAlphaCounter) and 1 or (((counterMax - noAlphaCounter) - (counter - noAlphaCounter)) / (counterMax - noAlphaCounter))
        red.Alpha = alphaValue
        yellow.Alpha = alphaValue

        for i, message in ipairs(messageList) do
            local color = i == 1 and red or yellow
            local x = (ScreenCenter) - (font:GetStringWidthUTF8(message) / 2)
            local y = yOffset + (font:GetLineHeight() * (i - 1))
            font:DrawStringUTF8(message, x, y, color, 0, true)
        end

        if not game:IsPaused() then
            counter = counter + 1
        end
    end
end

local function OnFirstRender()
    if ReactionPack.SavedSettings.ModVersion ~= ReactionPack.ModVersion then
        GetNewMessages()
        if #messageList > 0 then
            ReactionPack:AddPriorityCallback(ModCallbacks.MC_POST_RENDER, CallbackPriority.LATE, RenderMessages)
            LimitMessages()
            table.insert(messageList, 1, news)
        end
    end
    ReactionPack:RemoveCallback(ModCallbacks.MC_POST_RENDER, OnFirstRender)
end

local function DeleteMessages()
    counter = nil
    messageList = nil
    ReactionPack:RemoveCallback(ModCallbacks.MC_POST_RENDER, RenderMessages)
    ReactionPack:RemoveCallback(ModCallbacks.MC_PRE_GAME_EXIT, DeleteMessages)
end

ReactionPack:AddCallback(ModCallbacks.MC_POST_RENDER, OnFirstRender)
ReactionPack:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, DeleteMessages)