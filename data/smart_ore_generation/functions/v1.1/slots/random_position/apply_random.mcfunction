
#> smart_ore_generation:v1.1/slots/random_position/apply_random
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
scoreboard players operation #max smart_ore_generation.data = _REGION_SIZE_10 smart_ore_generation.data
function smart_ore_generation:v1.1/technical/get_random
scoreboard players operation #r_x smart_ore_generation.data = #random smart_ore_generation.data
function smart_ore_generation:v1.1/technical/get_random
scoreboard players operation #r_z smart_ore_generation.data = #random smart_ore_generation.data

# Get 1 random value (Y) between #min_height and #max_height (excluded)
scoreboard players operation #max smart_ore_generation.data = #max_height smart_ore_generation.data
scoreboard players operation #max smart_ore_generation.data -= #min_height smart_ore_generation.data
scoreboard players operation #max smart_ore_generation.data *= #10 smart_ore_generation.data
function smart_ore_generation:v1.1/technical/get_random
scoreboard players operation #r_y smart_ore_generation.data = #random smart_ore_generation.data


## Apply offset to entity position
data modify storage smart_ore_generation:main Pos set value [0.0d, 0.0d, 0.0d]

# Calculate X & Z offset
execute store result score #new_x smart_ore_generation.data run data get entity @s Pos[0] 10
execute store result score #new_z smart_ore_generation.data run data get entity @s Pos[2] 10
scoreboard players operation #new_x smart_ore_generation.data += #r_x smart_ore_generation.data
scoreboard players operation #new_z smart_ore_generation.data += #r_z smart_ore_generation.data

# Calculate Y offset
scoreboard players operation #new_y smart_ore_generation.data = #min_height smart_ore_generation.data
scoreboard players operation #new_y smart_ore_generation.data *= #10 smart_ore_generation.data
scoreboard players operation #new_y smart_ore_generation.data += #r_y smart_ore_generation.data

# Apply offset
execute store result storage smart_ore_generation:main Pos[0] double 0.1 run scoreboard players get #new_x smart_ore_generation.data
execute store result storage smart_ore_generation:main Pos[1] double 0.1 run scoreboard players get #new_y smart_ore_generation.data
execute store result storage smart_ore_generation:main Pos[2] double 0.1 run scoreboard players get #new_z smart_ore_generation.data
data modify entity @s Pos set from storage smart_ore_generation:main Pos



## Debug
execute if score _DEBUG_LEVEL smart_ore_generation.data matches 2.. run tellraw @a [{"text":" Random position: (","color":"gold"},{"nbt":"Pos[0]","storage":"smart_ore_generation:main","color":"yellow"},{"text":", "},{"nbt":"Pos[1]","storage":"smart_ore_generation:main","color":"yellow"},{"text":", "},{"nbt":"Pos[2]","storage":"smart_ore_generation:main","color":"yellow"},{"text":")"}]

