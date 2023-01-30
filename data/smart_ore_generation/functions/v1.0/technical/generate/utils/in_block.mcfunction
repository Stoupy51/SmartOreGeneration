
execute if score #temp smart_ore_generation.data matches 0 store result score #temp smart_ore_generation.data if block ~1 ~ ~ #simplenergy:air
execute if score #temp smart_ore_generation.data matches 0 store result score #temp smart_ore_generation.data if block ~ ~1 ~ #simplenergy:air
execute if score #temp smart_ore_generation.data matches 0 store result score #temp smart_ore_generation.data if block ~ ~ ~1 #simplenergy:air
execute if score #temp smart_ore_generation.data matches 0 store result score #temp smart_ore_generation.data if block ~-1 ~ ~ #simplenergy:air
execute if score #temp smart_ore_generation.data matches 0 store result score #temp smart_ore_generation.data if block ~ ~-1 ~ #simplenergy:air
execute if score #temp smart_ore_generation.data matches 0 store result score #temp smart_ore_generation.data if block ~ ~ ~-1 #simplenergy:air
