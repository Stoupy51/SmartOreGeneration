
#Input scores: #xzVariation, #maxHeight

#Define a -/+ value offset randomly with UUID.
#I multiply values by 10 to keep a digit after decimal.
#Init values
	function smart_ore_generation:v1.0/technical/generate/utils/fill_storage
	
	scoreboard players operation #x smart_ore_generation.data = #x.random smart_ore_generation.data
	scoreboard players operation #z smart_ore_generation.data = #z.random smart_ore_generation.data

	data modify storage simplenergy:temp all set from entity @s Pos
	execute store result score #pos_x smart_ore_generation.data run data get storage simplenergy:temp all[0] 10
	execute store result score #pos_z smart_ore_generation.data run data get storage simplenergy:temp all[2] 10

#Edit X & Z Pos : they can take a value between -#xzVariation & +#xzVariation
#Examples for #xzVariation = 400 : -37.4, 14.3, 0.1, ...
	scoreboard players operation #x smart_ore_generation.data %= #xz_variation smart_ore_generation.data
	scoreboard players operation #z smart_ore_generation.data %= #xz_variation smart_ore_generation.data
	execute if score #x.random smart_ore_generation.data matches ..-1 run scoreboard players operation #x smart_ore_generation.data *= #-1 smart_ore_generation.data
	execute if score #z.random smart_ore_generation.data matches ..-1 run scoreboard players operation #z smart_ore_generation.data *= #-1 smart_ore_generation.data
	scoreboard players operation #pos_x smart_ore_generation.data += #x smart_ore_generation.data
	scoreboard players operation #pos_z smart_ore_generation.data += #z smart_ore_generation.data

#Edit Y Pos : Y can take a value between world bottom and "#maxHeight"
	scoreboard players operation #pos_y smart_ore_generation.data = #world_bottom smart_ore_generation.data
	scoreboard players operation #pos_y smart_ore_generation.data *= #10 smart_ore_generation.data
	scoreboard players operation #y_max smart_ore_generation.data = #world_bottom smart_ore_generation.data
	scoreboard players operation #y_max smart_ore_generation.data *= #-10 smart_ore_generation.data
	scoreboard players operation #y_max smart_ore_generation.data += #max_height smart_ore_generation.data
	scoreboard players operation #y smart_ore_generation.data %= #y_max smart_ore_generation.data
	scoreboard players operation #pos_y smart_ore_generation.data += #y smart_ore_generation.data

#Update Position
	execute store result storage simplenergy:temp all[0] double 0.1 run scoreboard players get #pos_x smart_ore_generation.data
	execute store result storage simplenergy:temp all[1] double 0.1 run scoreboard players get #pos_y smart_ore_generation.data
	execute store result storage simplenergy:temp all[2] double 0.1 run scoreboard players get #pos_z smart_ore_generation.data
	data modify entity @s Pos set from storage simplenergy:temp all
