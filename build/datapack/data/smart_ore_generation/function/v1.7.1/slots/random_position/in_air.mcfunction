
#> smart_ore_generation:v1.7.1/slots/random_position/in_air
#
# @within	smart_ore_generation:v1.7.1/slots/random_position/find_adjacent_air
#

# Get random number between 0 and 1
execute store result score #random smart_ore_generation.data run random value 0..1

# Choose variation up or down
execute if score #random smart_ore_generation.data matches 0 run function smart_ore_generation:v1.7.1/slots/random_position/variation_up
execute if score #random smart_ore_generation.data matches 0 if score #success smart_ore_generation.data matches 0 run function smart_ore_generation:v1.7.1/slots/random_position/variation_down
execute if score #random smart_ore_generation.data matches 1 run function smart_ore_generation:v1.7.1/slots/random_position/variation_down
execute if score #random smart_ore_generation.data matches 1 if score #success smart_ore_generation.data matches 0 run function smart_ore_generation:v1.7.1/slots/random_position/variation_up

