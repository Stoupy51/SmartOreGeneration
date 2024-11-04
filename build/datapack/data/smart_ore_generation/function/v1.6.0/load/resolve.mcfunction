
#> smart_ore_generation:v1.6.0/load/resolve
#
# @within	#smart_ore_generation:resolve
#

# If correct version, load the datapack
execute if score #smart_ore_generation.major load.status matches 1 if score #smart_ore_generation.minor load.status matches 6 if score #smart_ore_generation.patch load.status matches 0 run function smart_ore_generation:v1.6.0/load/main

