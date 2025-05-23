
---@param inventory LuaInventory?
---@param surface LuaSurface
---@param position MapPosition
local function spill_inventory(inventory, surface, position)
    if not (inventory and inventory.valid) then return end
    surface.spill_inventory {
        inventory = inventory,
        position = position,
        allow_belts = false,
        enable_looted = true,
    }
end

---@param entity LuaEntity
local function spill_inventories(entity)
    local surface = entity.surface
    local position = entity.position
    for i = 1, 11 do
        local inventory = entity.get_inventory(i)
        spill_inventory(inventory, surface, position)
    end
end

---@param entity LuaEntity
local function spill_grid(entity)
    local grid = entity.grid
    if not (grid and grid.valid) then return end
    local grid_equipment = grid.equipment
    local surface = entity.surface
    local position = entity.position
    for _, equipment in pairs(grid_equipment) do
        local burner = equipment.burner
        if burner and burner.valid then
            spill_inventory(burner.burnt_result_inventory, surface, position)
            spill_inventory(burner.inventory, surface, position)
        end
        local take_result = equipment.prototype.take_result
        local name = take_result and take_result.name
        if name then
            ---@type ItemStackDefinition
            local item_stack = { name = name, count = 1, quality = equipment.quality.name }
            surface.spill_item_stack {
                stack = item_stack,
                position = position,
                allow_belts = false,
                enable_looted = true,
            }
        end
    end
    grid.clear()
end

---@param event EventData.on_entity_died
local function on_entity_died(event)
    local entity = event.entity
    if not entity.valid then return end
    spill_inventories(entity)
    spill_grid(entity)
end

---@param event EventData.on_player_died
local function on_player_died(event)
    local player = game.get_player(event.player_index)
    if not (player and player.valid) then return end
    local character = player.character
    if not (character and character.valid) then return end
    spill_inventories(character)
    spill_grid(character)
end

---@param event EventData.on_post_entity_died
local function on_post_entity_died(event)
    local corpses = event.corpses
    if not corpses then return end
    for _, corpse in pairs(corpses) do
        if corpse.valid then
            spill_inventories(corpse)
            spill_grid(corpse)
        end
    end
end

return {
    spill_inventory = spill_inventory,
    spill_inventories = spill_inventories,
    spill_grid = spill_grid,
    on_entity_died = on_entity_died,
    on_player_died = on_player_died,
    on_post_entity_died = on_post_entity_died,
}
