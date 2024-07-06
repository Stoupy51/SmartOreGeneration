
# Check if air is around the block
execute if score #success NAMESPACE.data matches 0 store result score #success NAMESPACE.data if block ~1 ~ ~ #NAMESPACE:air
execute if score #success NAMESPACE.data matches 0 store result score #success NAMESPACE.data if block ~ ~1 ~ #NAMESPACE:air
execute if score #success NAMESPACE.data matches 0 store result score #success NAMESPACE.data if block ~ ~ ~1 #NAMESPACE:air
execute if score #success NAMESPACE.data matches 0 store result score #success NAMESPACE.data if block ~-1 ~ ~ #NAMESPACE:air
execute if score #success NAMESPACE.data matches 0 store result score #success NAMESPACE.data if block ~ ~-1 ~ #NAMESPACE:air
execute if score #success NAMESPACE.data matches 0 store result score #success NAMESPACE.data if block ~ ~ ~-1 #NAMESPACE:air

