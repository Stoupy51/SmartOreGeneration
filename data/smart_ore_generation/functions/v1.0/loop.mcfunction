
## Loop function runs every 2 seconds
schedule function smart_ore_generation:v1.0/loop 2s replace

## Execute on players
execute as @e[type=player] at @s run function smart_ore_generation:v1.0/technical/player

