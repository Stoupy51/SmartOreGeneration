
#> smart_ore_generation:v1.0/event/denied_dimensions
#
# @within #smart_ore_generation:v1/denied_dimensions
# @executed as and at the player who triggered the event
# @input score #authorized smart_ore_generation.data equals to 1 or 0 if another datapack has already denied generation
#
## WARNING!
# - You must check the #authorized score matching 1 before executing any commands to prevent reenable generation in a dimension that is disabled by another datapack.
# - Putting the #authorized score to 0 will disable generation in the dimension for every datapack.

## Here is an example to disable generation in a dimension:
# execute if score #authorized smart_ore_generation.data matches 1 if predicate simplenergy:in_dim/overworld run scoreboard players set #authorized smart_ore_generation.data 0

## Another example:
# execute if score #authorized smart_ore_generation.data matches 1 if entity @s[nbt={Dimension:"minecraft:overworld"}] run scoreboard players set #authorized smart_ore_generation.data 0


