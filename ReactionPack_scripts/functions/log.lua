local module = {}

local function Print(String)
    Isaac.ConsoleOutput(String .. "\n")
    Isaac.DebugString(String)
end

local function ConsolePrint(String)
    Isaac.ConsoleOutput(String .. "\n")
end

local function Diagnostic(Diagnose, String)
    if ReactionPack.Diagnostics[Diagnose] then
        Print("[DIAGNOSTICS ReactionPack]: " .. String)
    end
end

module.print = Print
module.console = ConsolePrint
module.diagnostic = Diagnostic

return module