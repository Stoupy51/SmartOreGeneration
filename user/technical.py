
# ruff: noqa: E501
# Imports
from stewbeet import Context, Predicate, set_json_encoder, write_versioned_function


# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def beet_default(ctx: Context) -> None:
	ns: str = ctx.project_id
	version: str = ctx.project_version

	## Technical
	write_versioned_function("technical/player", f"""
# Check for an unvisited zone if dimension is authorized
scoreboard players set #authorized {ns}.data 1
function #{ns}:v1/signals/denied_dimensions
execute if score #authorized {ns}.data matches 1 summon marker run function {ns}:v{version}/technical/authorized
""")
	write_versioned_function("technical/authorized", f"""
## Correct position to the origin of the region

# Correct position to the origin of the region
execute store result score #pos_x {ns}.data run data get entity @s Pos[0]
execute store result score #pos_z {ns}.data run data get entity @s Pos[2]
scoreboard players operation #pos_x {ns}.data /= _REGION_SIZE {ns}.data
scoreboard players operation #pos_z {ns}.data /= _REGION_SIZE {ns}.data
scoreboard players operation #pos_x {ns}.data *= _REGION_SIZE {ns}.data
scoreboard players operation #pos_z {ns}.data *= _REGION_SIZE {ns}.data

# Update Position
execute store result entity @s Pos[0] double 1 run scoreboard players get #pos_x {ns}.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #pos_z {ns}.data


## Check the regions
execute store result storage {ns}:params region_size int 1 run scoreboard players get _REGION_SIZE {ns}.data
execute at @s run function {ns}:v{version}/technical/check_regions with storage {ns}:params
kill @s
""")
	write_versioned_function("technical/check_regions", f"""
## Try on these regions: (- = Player, R = Region)
#
#	R	R	R
#	R	-	R
#	R	R	R
#

## Check if regions are loaded
$execute positioned ~-$(region_size) 0 ~-$(region_size) if loaded ~ ~ ~ if predicate {ns}:v1/is_region_non_generated run function {ns}:v{version}/technical/generate/start
$execute positioned ~0 0 ~-$(region_size) if loaded ~ ~ ~ if predicate {ns}:v1/is_region_non_generated run function {ns}:v{version}/technical/generate/start
$execute positioned ~$(region_size) 0 ~-$(region_size) if loaded ~ ~ ~ if predicate {ns}:v1/is_region_non_generated run function {ns}:v{version}/technical/generate/start
$execute positioned ~-$(region_size) 0 ~ if loaded ~ ~ ~ if predicate {ns}:v1/is_region_non_generated run function {ns}:v{version}/technical/generate/start
$execute positioned ~$(region_size) 0 ~ if loaded ~ ~ ~ if predicate {ns}:v1/is_region_non_generated run function {ns}:v{version}/technical/generate/start
$execute positioned ~-$(region_size) 0 ~$(region_size) if loaded ~ ~ ~ if predicate {ns}:v1/is_region_non_generated run function {ns}:v{version}/technical/generate/start
$execute positioned ~ 0 ~$(region_size) if loaded ~ ~ ~ if predicate {ns}:v1/is_region_non_generated run function {ns}:v{version}/technical/generate/start
$execute positioned ~$(region_size) 0 ~$(region_size) if loaded ~ ~ ~ if predicate {ns}:v1/is_region_non_generated run function {ns}:v{version}/technical/generate/start
""")
	ctx.data[ns].predicates["v1/is_region_non_generated"] = set_json_encoder(Predicate({
		"type": "minecraft:inverted",
		"term": {
			"type": "minecraft:location_check",
			"predicate": {
				"block": {
					"blocks": [
						"minecraft:barrier"
					]
				}
			}
		}
	}), max_level=-1)
	write_versioned_function("technical/generate/start", f"""
# Debug level
execute if score _DEBUG_LEVEL {ns}.data matches 1.. run say §6[Smart Ore Generation] §eGenerating new Region!

# Place a barrier block to remember the loaded region
setblock ~ 0 ~ barrier

# Call public function tag
data modify storage {ns}:main initial_pos set from entity @s Pos
execute at @s run function #{ns}:v1/signals/generate_ores

# Indicate that a new region has been generated
scoreboard players set #generated {ns}.data 1

# Debug level
execute if score _DEBUG_LEVEL {ns}.data matches 1.. run say §6[Smart Ore Generation] §eDone generating ores!
""")

	# Post generation
	write_versioned_function("technical/post_generation", f"""
# Debug message
execute if score _DEBUG_LEVEL {ns}.data matches 1.. run say §6[Smart Ore Generation] §ePost generation

# Launch signals for others datapacks to use
function #{ns}:v1/signals/post_generation

# Reset scoreboard players
scoreboard players reset #generated {ns}.data
""")

