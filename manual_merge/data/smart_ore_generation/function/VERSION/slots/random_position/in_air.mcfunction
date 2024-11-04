
# Get random number between 0 and 1
execute store result score #random NAMESPACE.data run random value 0..1

# Choose variation up or down
execute if score #random NAMESPACE.data matches 0 run function NAMESPACE:VERSION/slots/random_position/variation_up
execute if score #random NAMESPACE.data matches 0 if score #success NAMESPACE.data matches 0 run function NAMESPACE:VERSION/slots/random_position/variation_down
execute if score #random NAMESPACE.data matches 1 run function NAMESPACE:VERSION/slots/random_position/variation_down
execute if score #random NAMESPACE.data matches 1 if score #success NAMESPACE.data matches 0 run function NAMESPACE:VERSION/slots/random_position/variation_up

