local tableToWatch = {
    ["Blocking"] = false,
    ["MyStuff"] = {
        ["IsAttacking"] = true,
        ["myInventory"] = {},
        ["data"] = {
            ["isBusy"] = false,
        }
    }
}

local gethooked = {}

local function watch(indices, callback)
    local currentTable = tableToWatch
    local lastIndex = table.remove(indices, #indices) -- // Must get last

    for _, index in indices do
        currentTable[index] = currentTable[index] or {}
        currentTable = currentTable[index] -- Reference
    end

    if gethooked[lastIndex] == nil then
        gethooked[lastIndex] = function()
            callback(currentTable[lastIndex])
        end
    end
end

local function set(indices, value)
    local currentTable = tableToWatch
    local lastIndex = table.remove(indices, #indices)

    for _, index in indices do
        currentTable[index] = currentTable[index] or {}
        currentTable = currentTable[index]
    end

    if currentTable[lastIndex] == value then return end

    currentTable[lastIndex] = value

    if gethooked[lastIndex] ~= nil then
        gethooked[lastIndex](value)
    end
end
