
local spill = require "spill"
local on_entity_died = spill.on_entity_died
local on_player_died = spill.on_player_died
local on_post_entity_died = spill.on_post_entity_died

script.on_event(defines.events.on_entity_died, on_entity_died)
script.on_event(defines.events.on_pre_player_died, on_player_died)
script.on_event(defines.events.on_post_entity_died, on_post_entity_died)
