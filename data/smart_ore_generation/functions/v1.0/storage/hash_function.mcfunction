
#> smart_ore_generation:v1.0/storage/hash_function
#
# @input	score : #input smart_ore_generation.data
#
# @output   score : #output smart_ore_generation.data
#
# Generate a number between 0 and _HASH_MAX constant to use for a Hash Table

scoreboard players operation #output smart_ore_generation.data = #input smart_ore_generation.data
scoreboard players operation #output smart_ore_generation.data /= _REGION_SIZE smart_ore_generation.data
scoreboard players operation #output smart_ore_generation.data %= _HASH_MAX smart_ore_generation.data

