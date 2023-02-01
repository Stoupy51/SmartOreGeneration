
# Search for an air block up to 20 blocks
execute if block ~ ~ ~ #smart_ore_generation:air positioned ~ ~1 ~ if entity @s[distance=..20] run function smart_ore_generation:v1.0/slots/random_position/variation_up
execute store result score #success smart_ore_generation.data unless block ~ ~ ~ #smart_ore_generation:air run tp @s ~ ~ ~

