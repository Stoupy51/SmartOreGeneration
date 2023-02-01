
#> smart_ore_generation:v1.0/technical/get_random
#
# @input	score : #max smart_ore_generation.data
#
# @output   score : #random smart_ore_generation.data
#
# Generate a random number between 0 and input (excluded)

scoreboard players operation #random smart_ore_generation.data = _NEXT_RANDOM smart_ore_generation.data
scoreboard players operation #random smart_ore_generation.data %= #max smart_ore_generation.data
scoreboard players operation _NEXT_RANDOM smart_ore_generation.data *= _RANDOM_PRIME smart_ore_generation.data

