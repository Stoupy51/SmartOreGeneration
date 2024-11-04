
# Check if air is around the block
execute if score #success NAMESPACE.data matches 0 if block ~1 ~ ~ #NAMESPACE:air run scoreboard players set #success NAMESPACE.data 1
execute if score #success NAMESPACE.data matches 0 if block ~ ~1 ~ #NAMESPACE:air run scoreboard players set #success NAMESPACE.data 1
execute if score #success NAMESPACE.data matches 0 if block ~ ~ ~1 #NAMESPACE:air run scoreboard players set #success NAMESPACE.data 1
execute if score #success NAMESPACE.data matches 0 if block ~-1 ~ ~ #NAMESPACE:air run scoreboard players set #success NAMESPACE.data 1
execute if score #success NAMESPACE.data matches 0 if block ~ ~-1 ~ #NAMESPACE:air run scoreboard players set #success NAMESPACE.data 1
execute if score #success NAMESPACE.data matches 0 if block ~ ~ ~-1 #NAMESPACE:air run scoreboard players set #success NAMESPACE.data 1

