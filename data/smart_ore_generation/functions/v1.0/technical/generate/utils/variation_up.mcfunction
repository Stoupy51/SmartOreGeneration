
execute if block ~ ~ ~ #simplenergy:air positioned ~ ~1 ~ if entity @s[distance=..20] run function smart_ore_generation:v1.0/technical/generate/utils/variation_up
execute store result score #temp smart_ore_generation.data unless block ~ ~ ~ #simplenergy:air run tp @s ~ ~ ~
