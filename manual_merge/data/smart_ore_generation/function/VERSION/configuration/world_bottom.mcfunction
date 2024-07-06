
# Checking for the world bottom (recursive function)
scoreboard players remove _OVERWORLD_BOTTOM NAMESPACE.data 1
execute positioned 0 ~-1 0 if predicate NAMESPACE:v1/overworld_bottom_check if score _OVERWORLD_BOTTOM NAMESPACE.data matches -100000.. run function NAMESPACE:VERSION/configuration/world_bottom

