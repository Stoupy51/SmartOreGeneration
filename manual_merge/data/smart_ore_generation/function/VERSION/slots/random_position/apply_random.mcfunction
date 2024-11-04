
#> NAMESPACE:VERSION/slots/random_position/apply_random
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
execute store result score #r_x NAMESPACE.data run random value 0..2147483646
scoreboard players operation #r_x NAMESPACE.data %= _REGION_SIZE_10 NAMESPACE.data

execute store result score #r_z NAMESPACE.data run random value 0..2147483646
scoreboard players operation #r_z NAMESPACE.data %= _REGION_SIZE_10 NAMESPACE.data

# Get 1 random value (Y) between #min_height and #max_height (excluded)
scoreboard players operation #max NAMESPACE.data = #max_height NAMESPACE.data
scoreboard players operation #max NAMESPACE.data -= #min_height NAMESPACE.data
scoreboard players operation #max NAMESPACE.data *= #10 NAMESPACE.data
execute if score #max NAMESPACE.data matches ..-1 run scoreboard players operation #max NAMESPACE.data *= #-1 NAMESPACE.data
execute store result score #r_y NAMESPACE.data run random value 0..2147483646
scoreboard players operation #r_y NAMESPACE.data %= #max NAMESPACE.data


## Apply offset to entity position
data modify storage NAMESPACE:main Pos set value [0.0d, 0.0d, 0.0d]

# Calculate X & Z offset
execute store result score #new_x NAMESPACE.data run data get entity @s Pos[0] 10
execute store result score #new_z NAMESPACE.data run data get entity @s Pos[2] 10
scoreboard players operation #new_x NAMESPACE.data += #r_x NAMESPACE.data
scoreboard players operation #new_z NAMESPACE.data += #r_z NAMESPACE.data

# Calculate Y offset
scoreboard players operation #new_y NAMESPACE.data = #min_height NAMESPACE.data
scoreboard players operation #new_y NAMESPACE.data *= #10 NAMESPACE.data
scoreboard players operation #new_y NAMESPACE.data += #r_y NAMESPACE.data

# Apply offset
execute store result storage NAMESPACE:main Pos[0] double 0.1 run scoreboard players get #new_x NAMESPACE.data
execute store result storage NAMESPACE:main Pos[1] double 0.1 run scoreboard players get #new_y NAMESPACE.data
execute store result storage NAMESPACE:main Pos[2] double 0.1 run scoreboard players get #new_z NAMESPACE.data
data modify entity @s Pos set from storage NAMESPACE:main Pos



## Debug
execute if score _DEBUG_LEVEL NAMESPACE.data matches 2.. run tellraw @a [{"text":" Random position: (","color":"gold"},{"nbt":"Pos[0]","storage":"NAMESPACE:main","color":"yellow"},{"text":", "},{"nbt":"Pos[1]","storage":"NAMESPACE:main","color":"yellow"},{"text":", "},{"nbt":"Pos[2]","storage":"NAMESPACE:main","color":"yellow"},{"text":")"}]

