
#> smart_ore_generation:v1.7.1/load/main
#
# @within	smart_ore_generation:v1.7.1/load/resolve
#

# Avoiding multiple executions of the same load function
execute unless score #smart_ore_generation.loaded load.status matches 1 run function smart_ore_generation:v1.7.1/load/secondary

