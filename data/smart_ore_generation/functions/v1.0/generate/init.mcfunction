
summon marker ~ 0 ~ {Tags:["smart_ore_generation.chunk_init","smart_ore_generation.chunk_scan","global.ignore","global.ignore.kill","smithed.entity","smithed.strict"]}
execute as @e[tag=smart_ore_generation.chunk_init] at @s run function smart_ore_generation:v1.0/technical/generate/init_2
