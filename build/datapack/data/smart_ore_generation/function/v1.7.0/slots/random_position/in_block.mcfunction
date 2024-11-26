
#> smart_ore_generation:v1.7.0/slots/random_position/in_block
#
# @within	smart_ore_generation:v1.7.0/slots/random_position/find_adjacent_air
#

# Check if air is around the block
execute if score #success smart_ore_generation.data matches 0 if block ~1 ~ ~ #smart_ore_generation:air run scoreboard players set #success smart_ore_generation.data 1
execute if score #success smart_ore_generation.data matches 0 if block ~ ~1 ~ #smart_ore_generation:air run scoreboard players set #success smart_ore_generation.data 1
execute if score #success smart_ore_generation.data matches 0 if block ~ ~ ~1 #smart_ore_generation:air run scoreboard players set #success smart_ore_generation.data 1
execute if score #success smart_ore_generation.data matches 0 if block ~-1 ~ ~ #smart_ore_generation:air run scoreboard players set #success smart_ore_generation.data 1
execute if score #success smart_ore_generation.data matches 0 if block ~ ~-1 ~ #smart_ore_generation:air run scoreboard players set #success smart_ore_generation.data 1
execute if score #success smart_ore_generation.data matches 0 if block ~ ~ ~-1 #smart_ore_generation:air run scoreboard players set #success smart_ore_generation.data 1

