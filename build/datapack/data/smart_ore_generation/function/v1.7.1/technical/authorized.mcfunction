
#> smart_ore_generation:v1.7.1/technical/authorized
#
# @within	smart_ore_generation:v1.7.1/technical/player
#

## Correct position to the origin of the region

# Correct position to the origin of the region
execute store result score #pos_x smart_ore_generation.data run data get entity @s Pos[0]
execute store result score #pos_z smart_ore_generation.data run data get entity @s Pos[2]
scoreboard players operation #pos_x smart_ore_generation.data /= _REGION_SIZE smart_ore_generation.data
scoreboard players operation #pos_z smart_ore_generation.data /= _REGION_SIZE smart_ore_generation.data
scoreboard players operation #pos_x smart_ore_generation.data *= _REGION_SIZE smart_ore_generation.data
scoreboard players operation #pos_z smart_ore_generation.data *= _REGION_SIZE smart_ore_generation.data

# Update Position
execute store result entity @s Pos[0] double 1 run scoreboard players get #pos_x smart_ore_generation.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #pos_z smart_ore_generation.data


## Check the regions
execute store result storage smart_ore_generation:params region_size int 1 run scoreboard players get _REGION_SIZE smart_ore_generation.data
execute at @s run function smart_ore_generation:v1.7.1/technical/check_regions with storage smart_ore_generation:params
kill @s

