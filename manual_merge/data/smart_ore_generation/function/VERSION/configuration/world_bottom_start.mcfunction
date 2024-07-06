
# Checking for the world bottom
scoreboard players set _OVERWORLD_BOTTOM NAMESPACE.data 2
execute in minecraft:overworld positioned 0 1 0 run function NAMESPACE:VERSION/configuration/world_bottom

# Fix world bottom if not found
execute if score _OVERWORLD_BOTTOM NAMESPACE.data matches ..-100000 run scoreboard players set _OVERWORLD_BOTTOM NAMESPACE.data 0

