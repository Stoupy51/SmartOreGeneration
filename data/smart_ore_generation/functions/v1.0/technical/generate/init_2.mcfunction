
#Correct Position
	function smart_ore_generation:v1.0/technical/generate/correct_position

#Call function tag
	execute at @s run function #smart_ore_generation:v1/generate_ores

scoreboard players reset #x.random smart_ore_generation.data
scoreboard players reset #z.random smart_ore_generation.data
scoreboard players reset #x smart_ore_generation.data
scoreboard players reset #y smart_ore_generation.data
scoreboard players reset #z smart_ore_generation.data
scoreboard players reset #y_max smart_ore_generation.data
scoreboard players reset #pos_x smart_ore_generation.data
scoreboard players reset #pos_y smart_ore_generation.data
scoreboard players reset #pos_z smart_ore_generation.data
scoreboard players reset #xz_variation smart_ore_generation.data
scoreboard players reset #max_height smart_ore_generation.data
scoreboard players reset #min_height smart_ore_generation.data
scoreboard players reset #max_attempts smart_ore_generation.data

# Teleport back to loaded chunk 0 0
kill @s

