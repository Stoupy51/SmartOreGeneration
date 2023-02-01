
scoreboard players remove #max_attempts smart_ore_generation.data 1
scoreboard players set #temp smart_ore_generation.data 0

execute at @s if block ~ ~ ~ #simplenergy:air run function smart_ore_generation:v1.0/technical/generate/utils/in_air
execute at @s if score #temp smart_ore_generation.data matches 0 run function smart_ore_generation:v1.0/technical/generate/utils/in_block

#Try a new time if the block is still not adjacent to air
execute if score #temp smart_ore_generation.data matches 0 unless score #max_attempts smart_ore_generation.data matches 0 run function smart_ore_generation:v1.0/technical/generate/utils/new_random_position

