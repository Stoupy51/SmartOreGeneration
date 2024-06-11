
# Checking for the world bottom
scoreboard players set _OVERWORLD_BOTTOM smart_ore_generation.data 2
execute in minecraft:overworld positioned 0 1 0 run function smart_ore_generation:v1.4.0/configuration/world_bottom

# Fix world bottom if not found
execute if score _OVERWORLD_BOTTOM smart_ore_generation.data matches ..-100000 run scoreboard players set _OVERWORLD_BOTTOM smart_ore_generation.data 0

