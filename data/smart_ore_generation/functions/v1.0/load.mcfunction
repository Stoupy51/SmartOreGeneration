
#Objectives initialization
scoreboard objectives add smart_ore_generation.data dummy
execute unless score #configured smart_ore_generation.data matches 1 run function smart_ore_generation:v1.0/configuration/

#define storage smart_ore_generation:main
#define storage smart_ore_generation:overworld
#define storage smart_ore_generation:the_nether
#define storage smart_ore_generation:the_end
#define storage smart_ore_generation:custom

schedule function smart_ore_generation:v1.0/loop 2s replace

