
execute store result score #pos_x smart_ore_generation.data run data get entity @s Pos[0]
execute store result score #pos_z smart_ore_generation.data run data get entity @s Pos[2]
scoreboard players operation #pos_x smart_ore_generation.data /= #80 smart_ore_generation.data
scoreboard players operation #pos_z smart_ore_generation.data /= #80 smart_ore_generation.data
scoreboard players operation #pos_x smart_ore_generation.data *= #80 smart_ore_generation.data
scoreboard players operation #pos_z smart_ore_generation.data *= #80 smart_ore_generation.data

#Update Position
	execute store result entity @s Pos[0] double 1 run scoreboard players get #pos_x smart_ore_generation.data
	execute store result entity @s Pos[2] double 1 run scoreboard players get #pos_z smart_ore_generation.data
