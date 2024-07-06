
# Get random number between 0 and 1
scoreboard players set #random NAMESPACE.data 0
execute if predicate NAMESPACE:v1/chance/0.5 run scoreboard players add #random NAMESPACE.data 1

# Choose variation up or down
execute if score #random NAMESPACE.data matches 0 run function NAMESPACE:VERSION/slots/random_position/variation_up
execute if score #random NAMESPACE.data matches 0 if score #success NAMESPACE.data matches 0 run function NAMESPACE:VERSION/slots/random_position/variation_down
execute if score #random NAMESPACE.data matches 1 run function NAMESPACE:VERSION/slots/random_position/variation_down
execute if score #random NAMESPACE.data matches 1 if score #success NAMESPACE.data matches 0 run function NAMESPACE:VERSION/slots/random_position/variation_up

