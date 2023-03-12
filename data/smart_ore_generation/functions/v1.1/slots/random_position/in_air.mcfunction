
# Get random number between 0 and 1
scoreboard players set #random smart_ore_generation.data 0
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add #random smart_ore_generation.data 1

# Choose variation up or down
execute if score #random smart_ore_generation.data matches 0 run function smart_ore_generation:v1.1/slots/random_position/variation_up
execute if score #random smart_ore_generation.data matches 0 if score #success smart_ore_generation.data matches 0 run function smart_ore_generation:v1.1/slots/random_position/variation_down
execute if score #random smart_ore_generation.data matches 1 run function smart_ore_generation:v1.1/slots/random_position/variation_down
execute if score #random smart_ore_generation.data matches 1 if score #success smart_ore_generation.data matches 0 run function smart_ore_generation:v1.1/slots/random_position/variation_up

