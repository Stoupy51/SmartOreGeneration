
# Checking for the world bottom (recursive function)
scoreboard players remove _OVERWORLD_BOTTOM smart_ore_generation.data 1
execute positioned 0 ~-1 0 if predicate smart_ore_generation:v1/overworld_bottom_check if score _OVERWORLD_BOTTOM smart_ore_generation.data matches -100000.. run function smart_ore_generation:v1.1/configuration/world_bottom

