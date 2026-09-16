
#> smart_ore_generation:v1.7.4/slots/random_position/in_block
#
# @executed	at @s
#
# @within	smart_ore_generation:v1.7.4/slots/random_position/find_adjacent_air [ at @s ]
#

# Check if air is around the block
execute if score #success smart_ore_generation.data matches 0 if block ~1 ~ ~ #smart_ore_generation:air run scoreboard players set #success smart_ore_generation.data 1
execute if score #success smart_ore_generation.data matches 0 if block ~ ~1 ~ #smart_ore_generation:air run scoreboard players set #success smart_ore_generation.data 1
execute if score #success smart_ore_generation.data matches 0 if block ~ ~ ~1 #smart_ore_generation:air run scoreboard players set #success smart_ore_generation.data 1
execute if score #success smart_ore_generation.data matches 0 if block ~-1 ~ ~ #smart_ore_generation:air run scoreboard players set #success smart_ore_generation.data 1
execute if score #success smart_ore_generation.data matches 0 if block ~ ~-1 ~ #smart_ore_generation:air run scoreboard players set #success smart_ore_generation.data 1
execute if score #success smart_ore_generation.data matches 0 if block ~ ~ ~-1 #smart_ore_generation:air run scoreboard players set #success smart_ore_generation.data 1

