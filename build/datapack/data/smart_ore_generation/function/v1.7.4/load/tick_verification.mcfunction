
#> smart_ore_generation:v1.7.4/load/tick_verification
#
# @within	#minecraft:tick
#

execute if score #smart_ore_generation.major load.status matches 1 if score #smart_ore_generation.minor load.status matches 7 if score #smart_ore_generation.patch load.status matches 4 run function smart_ore_generation:v1.7.4/tick

