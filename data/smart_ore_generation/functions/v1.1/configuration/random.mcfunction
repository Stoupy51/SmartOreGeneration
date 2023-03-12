
## Define random number between 0 and 16777216
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 1
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 2
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 4
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 8
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 16
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 32
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 64
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 128
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 256
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 512
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 1024
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 2048
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 4096
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 8192
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 16384
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 32768
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 65536
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 131072
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 262144
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 524288
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 1048576
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 2097152
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 4194304
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 8388608
execute if predicate smart_ore_generation:v1/chance/0.5 run scoreboard players add _NEXT_RANDOM smart_ore_generation.data 16777216

execute if score _NEXT_RANDOM smart_ore_generation.data matches 0 run scoreboard players set _NEXT_RANDOM smart_ore_generation.data 7

