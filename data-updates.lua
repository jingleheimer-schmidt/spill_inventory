
for _, simulation in pairs(data.raw["utility-constants"]["default"].main_menu_simulations) do
    if simulation then
        if simulation.mods then
            table.insert(simulation.mods, "spill_inventory")
        else
            simulation.mods = { "spill_inventory" }
        end
    end
end
