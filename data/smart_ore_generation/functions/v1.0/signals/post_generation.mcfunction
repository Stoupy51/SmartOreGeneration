
#> smart_ore_generation:v1.0/signals/post_generation
#
# @within			#smart_ore_generation:v1/signals/post_generation
# @executed			as none at none (default of a /schedule)
#
# This function is executed once after all the ore generation is done.
# For example, if 6 regions are generated, this function will be executed 1 time after all the regions are generated.
# It can be used to do some post-generation tasks, like running a function on all the ores you generated
# instead of running it on each ore individually when you generate it.
# Useful for optimisation.

## Example of use in smart_ore_generation:v1/signals/example/post_generation

