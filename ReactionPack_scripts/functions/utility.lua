local module = {}

local function DeepCopy(tab)
    if type(tab) ~= "table" then
        return tab
    end

    local final = setmetatable({}, getmetatable(tab))
    for i, v in pairs(tab) do
        final[DeepCopy(i)] = DeepCopy(v)
    end

    return final
end

module.DeepCopy = DeepCopy

return module