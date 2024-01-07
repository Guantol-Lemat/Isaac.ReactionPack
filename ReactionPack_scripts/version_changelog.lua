local errorMessage = {"Warning for Reaction Port Pack:", "Save File has been Locked",  "Changes made to settings during this session will be discarded"}
local news = "Reaction Port Pack News:"

local versions = {
    "1.0.0",
    "1.0.1",
    "1.0.2",
    "1.0.3",
    "1.0.4",
    "1.1.0",
    "1.1.1"
}

local changeLog = {
    ["1.0.1"] = {
        "Now Compatible with Soundtrack Menu",
        "Added Diagnostics for easier Debugging"
    },
    ["1.0.2"] = {
        "Tracks chosen in SoundTrack Menu will now be played correctly",
        "Fixed an Issue where the Stage Track would play, when it otherwise shouldn't"
    },
    ["1.0.3"] = {
        "Fixed an Issue that caused MC_PRE_GAME_EXIT callbacks from not being executed",
        "Fixed an Issue where the Ascent Music would not play in certain rooms",
        "Added compatibility with the \"Snake Eater on Ascent\" mod"
    },
    ["1.0.4"] = {
        "New Setting: Reaction Isolation",
        "New Setting: React in Death Certificate Dimension",
        "New Setting: Whine Prevention",
        "Added a Template within the files to simplify creation of packs"
    },
    ["1.1.0"] = {
        "Made the Mod Compatible with Legacy Pog and Ugh Mods",
        "New POG Costume Pack [Let's ####### Go!!!]",
        "New Trauma Sound Pack [TASM Scream]",
        "New Dance Sound Pack [Lazy Mattman Screams]",
    },
    ["1.1.1"] = {
        "Implemented a Save Lock to prevent a sudden Reset of the Settings",
    }
}

local removedDeleteMessages = false
local removedOnFirstRender = false

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

local function RenderStartupError()
    if counter < counterMax and not ReactionPack.gameStarted then
        local ss = getScreenSize()
        local ScreenCenter = (ss.X / 2)
        local alphaValue = (counterMax - counter) / counterMax
        red.Alpha = alphaValue
        yellow.Alpha = alphaValue

        for i, message in ipairs(errorMessage) do
            local color = i == 1 and yellow or red
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
    if removedOnFirstRender then
        return
    end
    if not ReactionPack.gameStarted then
        return
    end
    if ReactionPack.SavedSettings.ModVersion ~= ReactionPack.ModVersion then
        GetNewMessages()
        if #messageList > 0 then
            ReactionPack:AddPriorityCallback(ModCallbacks.MC_POST_RENDER, CallbackPriority.LATE, RenderMessages)
            LimitMessages()
            table.insert(messageList, 1, news)
        end
    end
    removedOnFirstRender = true
--    ReactionPack:RemoveCallback(ModCallbacks.MC_POST_RENDER, OnFirstRender)
end

local function DeleteMessages()
    counter = 0
    if removedDeleteMessages then
        return
    end
    if not removedOnFirstRender then
        return
    end
    messageList = nil
    ReactionPack:RemoveCallback(ModCallbacks.MC_POST_RENDER, OnFirstRender)
    ReactionPack:RemoveCallback(ModCallbacks.MC_POST_RENDER, RenderMessages)
    removedDeleteMessages = true
--    ReactionPack:RemoveCallback(ModCallbacks.MC_PRE_GAME_EXIT, DeleteMessages)
end

ReactionPack:AddCallback(ModCallbacks.MC_POST_RENDER, OnFirstRender)
ReactionPack:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, DeleteMessages)
ReactionPack:AddCallback(ModCallbacks.MC_POST_RENDER, RenderStartupError)
