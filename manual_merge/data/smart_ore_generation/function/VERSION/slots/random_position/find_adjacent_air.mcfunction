
# Remove an attempt from the max attempts counter
scoreboard players remove #max_attempts NAMESPACE.data 1

# Check if the block is adjacent to air
scoreboard players set #success NAMESPACE.data 0
execute at @s if block ~ ~ ~ #NAMESPACE:air run function NAMESPACE:VERSION/slots/random_position/in_air
execute if score #success NAMESPACE.data matches 0 at @s run function NAMESPACE:VERSION/slots/random_position/in_block

# Try a new time if the block is still not adjacent to air and there are still attempts left
execute if score #success NAMESPACE.data matches 0 unless score #max_attempts NAMESPACE.data matches 0 run function NAMESPACE:VERSION/slots/random_position/try

