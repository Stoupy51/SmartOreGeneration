
## Correct position to the origin of the region

# Correct position to the origin of the region
execute store result score #pos_x NAMESPACE.data run data get entity @s Pos[0]
execute store result score #pos_z NAMESPACE.data run data get entity @s Pos[2]
scoreboard players operation #pos_x NAMESPACE.data /= _REGION_SIZE NAMESPACE.data
scoreboard players operation #pos_z NAMESPACE.data /= _REGION_SIZE NAMESPACE.data
scoreboard players operation #pos_x NAMESPACE.data *= _REGION_SIZE NAMESPACE.data
scoreboard players operation #pos_z NAMESPACE.data *= _REGION_SIZE NAMESPACE.data

# Update Position
execute store result entity @s Pos[0] double 1 run scoreboard players get #pos_x NAMESPACE.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #pos_z NAMESPACE.data


## Check the regions
execute store result storage NAMESPACE:params region_size int 1 run scoreboard players get _REGION_SIZE NAMESPACE.data
execute at @s run function NAMESPACE:VERSION/technical/check_regions with storage NAMESPACE:params
kill @s

