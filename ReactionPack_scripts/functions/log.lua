local module = {}

local function Print(String)
    Isaac.ConsoleOutput(String .. "\n")
    Isaac.DebugString(String)
end

local function ConsolePrint(String)
    Isaac.ConsoleOutput(String .. "\n")
end

module.print = Print
module.console = ConsolePrint

return module