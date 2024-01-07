
-- local func_capture = require "__simhelper__.funccapture"
-- local spill = require "spill"
-- local on_entity_died = spill.on_entity_died
-- local on_player_died = spill.on_player_died
-- local on_post_entity_died = spill.on_post_entity_died

-- local function simulation_init()
--     script.on_event(defines.events.on_entity_died, on_entity_died)
--     script.on_event(defines.events.on_pre_player_died, on_player_died)
--     script.on_event(defines.events.on_post_entity_died, on_post_entity_died)
-- end

-- local existing_on_entity_died = script.get_event_handler(defines.events.on_entity_died)

-- for _, simulation in pairs(data.raw["utility-constants"]["default"].main_menu_simulations) do
--     if simulation then
--         if simulation.init then
--             local existing_init = assert(load(simulation.init))
--             simulation.init = func_capture.capture(function()
--                 existing_init()
--                 simulation_init()
--             end)
--         else
--             simulation.init = func_capture.capture(function()
--                 simulation_init()
--             end)
--         end
--     end
-- end
