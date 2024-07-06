
## Defines for Datapack Helper Plus
#define score_holder _IS_ENABLED 			Whether the datapack is enabled or not
#define score_holder _DEBUG_LEVEL 			(0 = None, 1 = Launch of main functions, 2 = 1 + Random generated positions)
#define score_holder _PRIVATE_REGION_SIZE 	[DO NOT MODIFY] Default size of the region to generate in (Should be a multiple of 16)
#define score_holder _REGION_SIZE 			Current size of the region to generate in (Should be a multiple of 16)
#define score_holder _REGION_SIZE_10 		Size of the region multiplied by 10
#define score_holder _OVERWORLD_BOTTOM 		Bottom of the overworld


## Define constants
scoreboard players set _IS_ENABLED NAMESPACE.data 1
scoreboard players set _DEBUG_LEVEL NAMESPACE.data 0
scoreboard players set _PRIVATE_REGION_SIZE NAMESPACE.data 96
scoreboard players operation _REGION_SIZE NAMESPACE.data = _PRIVATE_REGION_SIZE NAMESPACE.data
scoreboard players operation _REGION_SIZE_10 NAMESPACE.data = _PRIVATE_REGION_SIZE NAMESPACE.data
scoreboard players operation _REGION_SIZE_10 NAMESPACE.data *= #10 NAMESPACE.data


# Make this function non-executed on load
scoreboard players set #configured NAMESPACE.data 1

