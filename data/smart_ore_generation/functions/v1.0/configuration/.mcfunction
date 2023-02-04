
## Defines for Datapack Helper Plus
#define score_holder _IS_ENABLED 			Whether the datapack is enabled or not
#define score_holder _DEBUG_LEVEL 			(0 = None, 1 = Launch of main functions, 2 = 1 + Random generated positions)
#define score_holder _PRIVATE_REGION_SIZE 	[DO NOT MODIFY] Default size of the region to generate in (Should be a multiple of 16)
#define score_holder _REGION_SIZE 			Current size of the region to generate in (Should be a multiple of 16)
#define score_holder _REGION_SIZE_10 		Size of the region multiplied by 10
#define score_holder _RANDOM_PRIME 			Prime number to use for the random number generator
#define score_holder _NEXT_RANDOM 			Next random number to pick 
#define score_holder _OVERWORLD_BOTTOM 		Bottom of the overworld


## Define constants
scoreboard players set _IS_ENABLED smart_ore_generation.data 1
scoreboard players set _DEBUG_LEVEL smart_ore_generation.data 0
scoreboard players set _PRIVATE_REGION_SIZE smart_ore_generation.data 96
scoreboard players operation _REGION_SIZE smart_ore_generation.data = _PRIVATE_REGION_SIZE smart_ore_generation.data
scoreboard players operation _REGION_SIZE_10 smart_ore_generation.data = _PRIVATE_REGION_SIZE smart_ore_generation.data
scoreboard players operation _REGION_SIZE_10 smart_ore_generation.data *= #10 smart_ore_generation.data


## Define random
scoreboard players set _RANDOM_PRIME smart_ore_generation.data 6978869
scoreboard players set _NEXT_RANDOM smart_ore_generation.data 0
execute store result score _NEXT_RANDOM smart_ore_generation.data run seed
execute if score _NEXT_RANDOM smart_ore_generation.data matches 0 run function smart_ore_generation:v1.0/configuration/random


## Forceload a region in overworld for a marker
execute in minecraft:overworld run forceload add 0 0
schedule function smart_ore_generation:v1.0/configuration/forceload_marker 5s
schedule function smart_ore_generation:v1.0/configuration/world_bottom_start 5s


# Make this function non-executed on load
scoreboard players set #configured smart_ore_generation.data 1

