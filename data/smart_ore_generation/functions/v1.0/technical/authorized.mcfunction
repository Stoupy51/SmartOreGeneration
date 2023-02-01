
# Teleport to player position
tp @s ~ ~ ~

## TODO : Check if chunk has been loaded before
function smart_ore_generation:v1.0/technical/generate/init

## Try on these regions: (- = Player, R = Region)
#
#	R	R	R
#	R	-	R
#	R	R	R
#

execute store result score #offset_x smart_ore_generation.data run data get entity @s Pos[0]
execute store result score #offset_z smart_ore_generation.data run data get entity @s Pos[2]
scoreboard players operation #offset_x smart_ore_generation.data %= _REGION_SIZE smart_ore_generation.data
scoreboard players operation #offset_z smart_ore_generation.data %= _REGION_SIZE smart_ore_generation.data


