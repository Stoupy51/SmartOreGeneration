
# Launch the function if is the right version
execute if score #NAMESPACE.major load.status matches 1 if score #NAMESPACE.minor load.status matches 4 if score #NAMESPACE.patch load.status matches 0 run function NAMESPACE:VERSION/slots/random_position/launch

