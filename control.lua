
local spill = require "spill"

script.on_event(defines.events.on_entity_died, spill.on_entity_died)
script.on_event(defines.events.on_pre_player_died, spill.on_player_died)
script.on_event(defines.events.on_post_entity_died, spill.on_post_entity_died)
