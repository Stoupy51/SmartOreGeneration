
## Example of Working hash tables:
# storage smart_ore_generation:main hash_tables
# [
#   [
#       [{x:0, z:0}, ...],
#       ...
#   ],
#   ...
# ]
#
#

## Function that creates all Hash Tables for all dimensions (currently only overworld)
data modify storage smart_ore_generation:main to_append set value []
data modify storage smart_ore_generation:main input set value []


## Hash Table
# [
#    [], [], [], [], ...
# ]
scoreboard players set #count smart_ore_generation.data 0
execute if score #count smart_ore_generation.data < _HASH_MAX smart_ore_generation.data run function smart_ore_generation:v1.0/configuration/hash_table_create


## Hash Table of Hash Tables
# [
#   [
#    [], [], [], [], ...
#   ],
#   ...
# ]
data modify storage smart_ore_generation:main to_append set from storage smart_ore_generation:main input
data modify storage smart_ore_generation:main input set value []
scoreboard players set #count smart_ore_generation.data 0
execute if score #count smart_ore_generation.data < _HASH_MAX smart_ore_generation.data run function smart_ore_generation:v1.0/configuration/hash_table_create



# Set the Hash Tables to the dimensions
data modify storage smart_ore_generation:overworld hash_tables set from storage smart_ore_generation:main input
data modify storage smart_ore_generation:the_nether hash_tables set from storage smart_ore_generation:main input
data modify storage smart_ore_generation:the_end hash_tables set from storage smart_ore_generation:main input
data modify storage smart_ore_generation:custom hash_tables set from storage smart_ore_generation:main input


# Remove input and to_append
data remove storage smart_ore_generation:main input
data remove storage smart_ore_generation:main to_append

