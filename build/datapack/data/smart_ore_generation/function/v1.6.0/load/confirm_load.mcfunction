
#> smart_ore_generation:v1.6.0/load/confirm_load
#
# @within	smart_ore_generation:v1.6.0/load/secondary
#

tellraw @a[tag=convention.debug] {"text":"[Loaded Smart Ore Generation v1.6.0]","color":"green"}

scoreboard players set #smart_ore_generation.loaded load.status 1

# Objectives initialization
scoreboard objectives add smart_ore_generation.data dummy
scoreboard players set #10 smart_ore_generation.data 10
scoreboard players set #-1 smart_ore_generation.data -1

# Configuration initialization
execute unless score #configured smart_ore_generation.data matches 1 run function smart_ore_generation:v1.6.0/configuration/setup

# Forceload a region in overworld for a marker
execute in minecraft:overworld run forceload add 0 0
schedule function smart_ore_generation:v1.6.0/configuration/world_bottom_start 5s

