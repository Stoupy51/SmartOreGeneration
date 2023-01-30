
## Mandatory because you use the @s marker to place the ore
tp @s ~ ~ ~

## TODO : Change system by using the @s marker

#Generate Simplunium Ore (x4)
	scoreboard players set #xz_variation smart_ore_generation.data 400
	scoreboard players set #min_height smart_ore_generation.data 0
	scoreboard players set #max_height smart_ore_generation.data 400
	summon marker ~ 0 ~ {Tags:["smart_ore_generation.ore_pos"]}
	summon marker ~ 0 ~ {Tags:["smart_ore_generation.ore_pos"]}
	summon marker ~ 0 ~ {Tags:["smart_ore_generation.ore_pos"]}
	summon marker ~ 0 ~ {Tags:["smart_ore_generation.ore_pos"]}
	execute as @e[tag=smart_ore_generation.ore_pos,predicate=simplenergy:in_overworld] at @s run function smart_ore_generation:v1.0/technical/generate/simplunium

kill @e[tag=smart_ore_generation.ore_pos]

