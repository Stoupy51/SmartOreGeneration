
# Remove an attempt from the max attempts counter
scoreboard players remove #max_attempts smart_ore_generation.data 1

# Check if the block is adjacent to air
scoreboard players set #success smart_ore_generation.data 0
execute at @s if block ~ ~ ~ #smart_ore_generation:air run function smart_ore_generation:v1.1/slots/random_position/in_air
execute if score #success smart_ore_generation.data matches 0 at @s run function smart_ore_generation:v1.1/slots/random_position/in_block

# Try a new time if the block is still not adjacent to air and there are still attempts left
execute if score #success smart_ore_generation.data matches 0 unless score #max_attempts smart_ore_generation.data matches 0 run function smart_ore_generation:v1.1/slots/random_position/try

