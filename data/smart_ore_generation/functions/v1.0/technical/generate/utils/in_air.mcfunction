
execute store result score #random smart_ore_generation.data run data get entity @s UUID[3]
scoreboard players operation #random smart_ore_generation.data %= #2 smart_ore_generation.data

scoreboard players set #temp smart_ore_generation.data 0
execute if score #random smart_ore_generation.data matches 0 run function smart_ore_generation:v1.0/technical/generate/utils/variation_up
execute if score #random smart_ore_generation.data matches 0 if score #temp smart_ore_generation.data matches 0 run function smart_ore_generation:v1.0/technical/generate/utils/variation_down
execute if score #random smart_ore_generation.data matches 1 run function smart_ore_generation:v1.0/technical/generate/utils/variation_down
execute if score #random smart_ore_generation.data matches 1 if score #temp smart_ore_generation.data matches 0 run function smart_ore_generation:v1.0/technical/generate/utils/variation_up

scoreboard players reset #random smart_ore_generation.data
