
## Try on these regions: (- = Player, R = Region)
#
#	R	R	R
#	R	-	R
#	R	R	R
#

## Check if region 0 -1 is loaded
scoreboard players operation #pos_z smart_ore_generation.data -= _REGION_SIZE smart_ore_generation.data
execute store result entity @s Pos[0] double 1 run scoreboard players get #pos_x smart_ore_generation.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #pos_z smart_ore_generation.data
execute at @s if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.0/technical/generate/start

## Check if region -1 -1 is loaded
scoreboard players operation #pos_x smart_ore_generation.data -= _REGION_SIZE smart_ore_generation.data
execute store result entity @s Pos[0] double 1 run scoreboard players get #pos_x smart_ore_generation.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #pos_z smart_ore_generation.data
execute at @s if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.0/technical/generate/start

## Check if region -1 0 is loaded
scoreboard players operation #pos_z smart_ore_generation.data += _REGION_SIZE smart_ore_generation.data
execute store result entity @s Pos[0] double 1 run scoreboard players get #pos_x smart_ore_generation.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #pos_z smart_ore_generation.data
execute at @s if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.0/technical/generate/start

## Check if region -1 1 is loaded
scoreboard players operation #pos_z smart_ore_generation.data += _REGION_SIZE smart_ore_generation.data
execute store result entity @s Pos[0] double 1 run scoreboard players get #pos_x smart_ore_generation.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #pos_z smart_ore_generation.data
execute at @s if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.0/technical/generate/start

## Check if region 0 1 is loaded
scoreboard players operation #pos_x smart_ore_generation.data += _REGION_SIZE smart_ore_generation.data
execute store result entity @s Pos[0] double 1 run scoreboard players get #pos_x smart_ore_generation.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #pos_z smart_ore_generation.data
execute at @s if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.0/technical/generate/start

## Check if region 1 1 is loaded
scoreboard players operation #pos_x smart_ore_generation.data += _REGION_SIZE smart_ore_generation.data
execute store result entity @s Pos[0] double 1 run scoreboard players get #pos_x smart_ore_generation.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #pos_z smart_ore_generation.data
execute at @s if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.0/technical/generate/start

## Check if region 1 0 is loaded
scoreboard players operation #pos_z smart_ore_generation.data -= _REGION_SIZE smart_ore_generation.data
execute store result entity @s Pos[0] double 1 run scoreboard players get #pos_x smart_ore_generation.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #pos_z smart_ore_generation.data
execute at @s if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.0/technical/generate/start

## Check if region 1 -1 is loaded
scoreboard players operation #pos_z smart_ore_generation.data -= _REGION_SIZE smart_ore_generation.data
execute store result entity @s Pos[0] double 1 run scoreboard players get #pos_x smart_ore_generation.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #pos_z smart_ore_generation.data
execute at @s if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.0/technical/generate/start

