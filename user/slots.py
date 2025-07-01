
# ruff: noqa: E501
# Imports
from stewbeet import Context, write_versioned_function


# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def beet_default(ctx: Context) -> None:
	ns: str = ctx.project_id
	version: str = ctx.project_version
	major, minor, patch = version.split(".")

	## Slots
	write_versioned_function("slots/random_position/apply_random", f"""
#> apply_random
#
# @input :
#	- #min_height : min value for Y Pos
#	- #max_height : max value for Y Pos
# @output :
#	- Nothing but update entity position
#
# Apply a random offset to entity position in the region defined by #min_height, #max_height, and _REGION_SIZE


## Get random values
# Get 2 random values (X & Z) between 0 and _REGION_SIZE (excluded)
execute store result score #r_x {ns}.data run random value 0..2147483646
scoreboard players operation #r_x {ns}.data %= _REGION_SIZE_10 {ns}.data

execute store result score #r_z {ns}.data run random value 0..2147483646
scoreboard players operation #r_z {ns}.data %= _REGION_SIZE_10 {ns}.data

# Get 1 random value (Y) between #min_height and #max_height (excluded)
scoreboard players operation #max {ns}.data = #max_height {ns}.data
scoreboard players operation #max {ns}.data -= #min_height {ns}.data
scoreboard players operation #max {ns}.data *= #10 {ns}.data
execute if score #max {ns}.data matches ..-1 run scoreboard players operation #max {ns}.data *= #-1 {ns}.data
execute store result score #r_y {ns}.data run random value 0..2147483646
scoreboard players operation #r_y {ns}.data %= #max {ns}.data


## Apply offset to entity position
data modify storage {ns}:main Pos set value [0.0d, 0.0d, 0.0d]

# Calculate X & Z offset
execute store result score #new_x {ns}.data run data get entity @s Pos[0] 10
execute store result score #new_z {ns}.data run data get entity @s Pos[2] 10
scoreboard players operation #new_x {ns}.data += #r_x {ns}.data
scoreboard players operation #new_z {ns}.data += #r_z {ns}.data

# Calculate Y offset
scoreboard players operation #new_y {ns}.data = #min_height {ns}.data
scoreboard players operation #new_y {ns}.data *= #10 {ns}.data
scoreboard players operation #new_y {ns}.data += #r_y {ns}.data

# Apply offset
execute store result storage {ns}:main Pos[0] double 0.1 run scoreboard players get #new_x {ns}.data
execute store result storage {ns}:main Pos[1] double 0.1 run scoreboard players get #new_y {ns}.data
execute store result storage {ns}:main Pos[2] double 0.1 run scoreboard players get #new_z {ns}.data
data modify entity @s Pos set from storage {ns}:main Pos


## Debug
execute if score _DEBUG_LEVEL {ns}.data matches 2.. run tellraw @a [{{"text":" Random position: (","color":"gold"}},{{"nbt":"Pos[0]","storage":"{ns}:main","color":"yellow"}},{{"text":", "}},{{"nbt":"Pos[1]","storage":"{ns}:main","color":"yellow"}},{{"text":", "}},{{"nbt":"Pos[2]","storage":"{ns}:main","color":"yellow"}},{{"text":")"}}]
""")
	write_versioned_function("slots/random_position/find_adjacent_air", f"""
# Remove an attempt from the max attempts counter
scoreboard players remove #max_attempts {ns}.data 1

# Check if the block is adjacent to air
scoreboard players set #success {ns}.data 0
execute at @s if block ~ ~ ~ #{ns}:air run function {ns}:v{version}/slots/random_position/in_air
execute if score #success {ns}.data matches 0 at @s run function {ns}:v{version}/slots/random_position/in_block

# Try a new time if the block is still not adjacent to air and there are still attempts left
execute if score #success {ns}.data matches 0 unless score #max_attempts {ns}.data matches 0 run function {ns}:v{version}/slots/random_position/try
""")
	write_versioned_function("slots/random_position/in_air", f"""
# Get random number between 0 and 1
execute store result score #random {ns}.data run random value 0..1

# Choose variation up or down
execute if score #random {ns}.data matches 0 run function {ns}:v{version}/slots/random_position/variation_up
execute if score #random {ns}.data matches 0 if score #success {ns}.data matches 0 run function {ns}:v{version}/slots/random_position/variation_down
execute if score #random {ns}.data matches 1 run function {ns}:v{version}/slots/random_position/variation_down
execute if score #random {ns}.data matches 1 if score #success {ns}.data matches 0 run function {ns}:v{version}/slots/random_position/variation_up
""")
	write_versioned_function("slots/random_position/in_block", f"""
# Check if air is around the block
execute if score #success {ns}.data matches 0 if block ~1 ~ ~ #{ns}:air run scoreboard players set #success {ns}.data 1
execute if score #success {ns}.data matches 0 if block ~ ~1 ~ #{ns}:air run scoreboard players set #success {ns}.data 1
execute if score #success {ns}.data matches 0 if block ~ ~ ~1 #{ns}:air run scoreboard players set #success {ns}.data 1
execute if score #success {ns}.data matches 0 if block ~-1 ~ ~ #{ns}:air run scoreboard players set #success {ns}.data 1
execute if score #success {ns}.data matches 0 if block ~ ~-1 ~ #{ns}:air run scoreboard players set #success {ns}.data 1
execute if score #success {ns}.data matches 0 if block ~ ~ ~-1 #{ns}:air run scoreboard players set #success {ns}.data 1
""")
	write_versioned_function("slots/random_position/launch", f"""
scoreboard players set #max_attempts {ns}.data 100
function {ns}:v{version}/slots/random_position/try
""")
	write_versioned_function("slots/random_position/try", f"""
data modify entity @s Pos set from storage {ns}:main initial_pos
function {ns}:v{version}/slots/random_position/apply_random
function {ns}:v{version}/slots/random_position/find_adjacent_air
""")
	write_versioned_function("slots/random_position/variation_down", f"""
# Search for an air block down to 20 blocks
execute if block ~ ~ ~ #{ns}:air positioned ~ ~-1 ~ if entity @s[distance=..20] run function {ns}:v{version}/slots/random_position/variation_down
execute store result score #success {ns}.data unless block ~ ~ ~ #{ns}:air run tp @s ~ ~ ~
""")
	write_versioned_function("slots/random_position/variation_up", f"""
# Search for an air block up to 20 blocks
execute if block ~ ~ ~ #{ns}:air positioned ~ ~1 ~ if entity @s[distance=..20] run function {ns}:v{version}/slots/random_position/variation_up
execute store result score #success {ns}.data unless block ~ ~ ~ #{ns}:air run tp @s ~ ~ ~
""")

	# Random position slot
	write_versioned_function("slots/random_position", f"""
# Launch the function if is the right version
execute if score #{ns}.major load.status matches {major} if score #{ns}.minor load.status matches {minor} if score #{ns}.patch load.status matches {patch} run function {ns}:v{version}/slots/random_position/launch
""", tags=[f"{ns}:v1/slots/random_position"])

