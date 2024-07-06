
#> smart_ore_generation:v1.5.0/load/resolve
#
# @within	#smart_ore_generation:resolve
#

# If correct version, load the datapack
execute if score #smart_ore_generation.major load.status matches 1 if score #smart_ore_generation.minor load.status matches 5 if score #smart_ore_generation.patch load.status matches 0 run function smart_ore_generation:v1.5.0/load/main

