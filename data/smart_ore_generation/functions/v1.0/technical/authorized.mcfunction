
## Teleport to player position and correct position to the origin of the region

# Teleport to player position
tp @s ~ ~ ~

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
execute if score _PRIVATE_REGION_SIZE smart_ore_generation.data = _REGION_SIZE smart_ore_generation.data at @s run function smart_ore_generation:v1.0/technical/check_regions_static
execute unless score _PRIVATE_REGION_SIZE smart_ore_generation.data = _REGION_SIZE smart_ore_generation.data at @s run function smart_ore_generation:v1.0/technical/check_regions_dynamic


# Go back to 0 0
execute in minecraft:overworld run tp @s 0 0 0

