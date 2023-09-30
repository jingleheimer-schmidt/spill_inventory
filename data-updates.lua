
local func_capture = require "__simhelper__.funccapture"
local spill = require "spill"
local on_entity_died = spill.on_entity_died
local on_player_died = spill.on_player_died
local on_post_entity_died = spill.on_post_entity_died

local function on_init()
    script.on_event(defines.events.on_entity_died, on_entity_died)
    script.on_event(defines.events.on_pre_player_died, on_player_died)
    script.on_event(defines.events.on_post_entity_died, on_post_entity_died)
end

local init_script = func_capture.capture(on_init)

for _, simulation in pairs(data.raw["utility-constants"]["default"].main_menu_simulations) do
    if simulation then
        if simulation.init then
            simulation.init = simulation.init .. init_script
        else
            simulation.init = init_script
        end
    end
end
