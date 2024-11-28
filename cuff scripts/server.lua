-- Check if a player has an item in their inventory
local function hasItem(source, item)
    local player = exports.ox_inventory:GetPlayer(source)
    if player then
        return player.getInventoryItem(item).count > 0
    end
    return false
end

-- Event: Check if the player has the required item to cuff/uncuff
RegisterNetEvent("cuff:checkItem", function(item, cb)
    local source = source
    if hasItem(source, item) then
        cb(true)
    else
        cb(false)
    end
end)
