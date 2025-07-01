
# ruff: noqa: E501
# Imports
from stewbeet import Context, Predicate, set_json_encoder, write_versioned_function


# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def beet_default(ctx: Context) -> None:
	ns: str = ctx.project_id
	version: str = ctx.project_version

	## Configuration
	write_versioned_function("configuration/setup", f"""
## Defines for Datapack Helper Plus
#define score_holder _IS_ENABLED 			Whether the datapack is enabled or not
#define score_holder _DEBUG_LEVEL 			(0 = None, 1 = Launch of main functions, 2 = 1 and Random generated positions)
#define score_holder _PRIVATE_REGION_SIZE 	[DO NOT MODIFY] Default size of the region to generate in (Should be a multiple of 16)
#define score_holder _REGION_SIZE 			Current size of the region to generate in (Should be a multiple of 16)
#define score_holder _REGION_SIZE_10 		Size of the region multiplied by 10
#define score_holder _OVERWORLD_BOTTOM 		Bottom of the overworld

## Define constants
scoreboard players set _IS_ENABLED {ns}.data 1
scoreboard players set _DEBUG_LEVEL {ns}.data 0
scoreboard players set _PRIVATE_REGION_SIZE {ns}.data 96
scoreboard players operation _REGION_SIZE {ns}.data = _PRIVATE_REGION_SIZE {ns}.data
scoreboard players operation _REGION_SIZE_10 {ns}.data = _PRIVATE_REGION_SIZE {ns}.data
scoreboard players operation _REGION_SIZE_10 {ns}.data *= #10 {ns}.data

# Make this function non-executed on load
scoreboard players set #configured {ns}.data 1
""")
	write_versioned_function("configuration/world_bottom_start", f"""
# Checking for the world bottom
scoreboard players set _OVERWORLD_BOTTOM {ns}.data 2
execute in minecraft:overworld positioned 0 1 0 run function {ns}:v{version}/configuration/world_bottom_loop

# Fix world bottom if not found
execute if score _OVERWORLD_BOTTOM {ns}.data matches ..-100000 run scoreboard players set _OVERWORLD_BOTTOM {ns}.data 0
""")
	write_versioned_function("configuration/world_bottom_loop", f"""
# Checking for the world bottom (recursive function)
scoreboard players remove _OVERWORLD_BOTTOM {ns}.data 1
execute positioned 0 ~-1 0 if predicate {ns}:v1/overworld_bottom_check if score _OVERWORLD_BOTTOM {ns}.data matches -100000.. run function {ns}:v{version}/configuration/world_bottom_loop
""")
	ctx.data[ns].predicates["v1/overworld_bottom_check"] = set_json_encoder(
		Predicate({"condition": "minecraft:location_check","predicate": {"block": {}}})
	)

