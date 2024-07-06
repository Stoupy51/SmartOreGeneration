
# Search for an air block up to 20 blocks
execute if block ~ ~ ~ #NAMESPACE:air positioned ~ ~1 ~ if entity @s[distance=..20] run function NAMESPACE:VERSION/slots/random_position/variation_up
execute store result score #success NAMESPACE.data unless block ~ ~ ~ #NAMESPACE:air run tp @s ~ ~ ~

