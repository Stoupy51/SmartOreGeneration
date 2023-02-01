
#define score_holder _REGION_SIZE   Size of the region to generate in
#define score_holder _HASH_MAX      Max value of the hash for the Hash Table
#define score_holder _NEXT_RANDOM   Next random number to pick 

## Define constants
scoreboard players set _REGION_SIZE smart_ore_generation.data 48
scoreboard players set _HASH_MAX smart_ore_generation.data 128

## Define random
scoreboard players set _NEXT_RANDOM smart_ore_generation.data 0
execute store result score _NEXT_RANDOM smart_ore_generation.data run seed
execute if score _NEXT_RANDOM smart_ore_generation.data matches 0 run function smart_ore_generation:v1.0/configuration/random

## Define / Create the hash table
function smart_ore_generation:v1.0/configuration/hash_table

# Make this function non-executed on load
scoreboard players set #configured smart_ore_generation.data 1

