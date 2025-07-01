
# ruff: noqa: E501
# Imports
from stewbeet import BlockTag, Context, set_json_encoder, write_load_file, write_versioned_function


# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def beet_default(ctx: Context) -> None:
	ns: str = ctx.project_id
	version: str = ctx.project_version

	# Write additional confirm load things
	write_load_file(f"""
# Objectives initialization
scoreboard objectives add {ns}.data dummy
scoreboard players set #10 {ns}.data 10
scoreboard players set #-1 {ns}.data -1

# Configuration initialization
execute unless score #configured {ns}.data matches 1 run function {ns}:v{version}/configuration/setup

# Forceload a region in overworld for a marker
execute in minecraft:overworld run forceload add 0 0
schedule function {ns}:v{version}/configuration/world_bottom_start 5s
""")

	# Write second_5 function
	write_versioned_function("second_5", f"""
## Execute on players
execute at @a run function {ns}:v{version}/technical/player
execute if score #generated {ns}.data matches 1 run function {ns}:v{version}/technical/post_generation
scoreboard players set #generated {ns}.data 0


## Performance profiling
# execute as @e[limit=64] at @s run function {ns}:v{version}/technical/generate/start
""")

	# Write the block tags
	air_blocks: list[str] = ["air","cave_air","void_air","structure_void","water","lava","glow_lichen"]
	ctx.data[ns].block_tags["air"] = set_json_encoder(BlockTag({"values":[f"minecraft:{x}" for x in air_blocks]}))

