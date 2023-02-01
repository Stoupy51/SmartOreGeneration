
## Defines for Datapack Helper Plus
#define score_holder _REGION_SIZE   Size of the region to generate in (Should be a multiple of 16)
#define score_holder _HASH_MAX      Max value of the hash for the Hash Table
#define score_holder _RANDOM_PRIME  Prime number to use for the random number generator
#define score_holder _NEXT_RANDOM   Next random number to pick 


## Define constants
scoreboard players set _PRIVATE_REGION_SIZE smart_ore_generation.data 96
scoreboard players operation _REGION_SIZE smart_ore_generation.data = _PRIVATE_REGION_SIZE smart_ore_generation.data
scoreboard players set _HASH_MAX smart_ore_generation.data 128


## Define random
scoreboard players set _RANDOM_PRIME smart_ore_generation.data 4157
scoreboard players set _NEXT_RANDOM smart_ore_generation.data 0
execute store result score _NEXT_RANDOM smart_ore_generation.data run seed
execute if score _NEXT_RANDOM smart_ore_generation.data matches 0 run function smart_ore_generation:v1.0/configuration/random


## Define / Create the hash table
function smart_ore_generation:v1.0/configuration/hash_table


## Forceload a region in overworld for a marker
execute in minecraft:overworld run forceload add 0 0
schedule function smart_ore_generation:v1.0/configuration/forceload_marker 5s


# Make this function non-executed on load
scoreboard players set #configured smart_ore_generation.data 1

