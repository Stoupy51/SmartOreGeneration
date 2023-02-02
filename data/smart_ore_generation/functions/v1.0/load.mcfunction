
#Objectives initialization
scoreboard objectives add smart_ore_generation.data dummy
scoreboard players set #10 smart_ore_generation.data 10

# Configuration initialization
execute unless score #configured smart_ore_generation.data matches 1 run function smart_ore_generation:v1.0/configuration/

#define storage smart_ore_generation:main

# Main loop
execute if score _IS_ENABLED smart_ore_generation.data matches 1 if score _DEBUG_LEVEL smart_ore_generation.data matches 1.. run say §6[Smart Ore Generation] §eLoaded
execute if score _IS_ENABLED smart_ore_generation.data matches 1 run schedule function smart_ore_generation:v1.0/loop 2s replace

