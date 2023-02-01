
# Append empty list
data modify storage smart_ore_generation:main input append from storage smart_ore_generation:main to_append

# Loop again
scoreboard players add #count smart_ore_generation.data 1
execute if score #count smart_ore_generation.data < _HASH_MAX smart_ore_generation.data run function smart_ore_generation:v1.0/configuration/hash_table_create

