
# Check if air is around the block
execute if score #success smart_ore_generation.data matches 0 store result score #success smart_ore_generation.data if block ~1 ~ ~ #smart_ore_generation:air
execute if score #success smart_ore_generation.data matches 0 store result score #success smart_ore_generation.data if block ~ ~1 ~ #smart_ore_generation:air
execute if score #success smart_ore_generation.data matches 0 store result score #success smart_ore_generation.data if block ~ ~ ~1 #smart_ore_generation:air
execute if score #success smart_ore_generation.data matches 0 store result score #success smart_ore_generation.data if block ~-1 ~ ~ #smart_ore_generation:air
execute if score #success smart_ore_generation.data matches 0 store result score #success smart_ore_generation.data if block ~ ~-1 ~ #smart_ore_generation:air
execute if score #success smart_ore_generation.data matches 0 store result score #success smart_ore_generation.data if block ~ ~ ~-1 #smart_ore_generation:air

