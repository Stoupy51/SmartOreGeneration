
#> smart_ore_generation:v1.0/technical/get_random
#
# @input	score : #max smart_ore_generation.data
#
# @output   score : #random smart_ore_generation.data
#
# Generate a random number between 0 and input (excluded)

scoreboard players operation #output smart_ore_generation.data = #input smart_ore_generation.data
scoreboard players operation #output smart_ore_generation.data /= #48 smart_ore_generation.data
scoreboard players operation #output smart_ore_generation.data %= #128 smart_ore_generation.data

