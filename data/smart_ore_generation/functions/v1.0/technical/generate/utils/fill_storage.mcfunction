
scoreboard players set #x.random smart_ore_generation.data 0
execute if predicate simplenergy:chance/0.5 run scoreboard players add #x.random smart_ore_generation.data 1
execute if predicate simplenergy:chance/0.5 run scoreboard players add #x.random smart_ore_generation.data 2
execute if predicate simplenergy:chance/0.5 run scoreboard players add #x.random smart_ore_generation.data 4
execute if predicate simplenergy:chance/0.5 run scoreboard players add #x.random smart_ore_generation.data 8
execute if predicate simplenergy:chance/0.5 run scoreboard players add #x.random smart_ore_generation.data 16
execute if predicate simplenergy:chance/0.5 run scoreboard players add #x.random smart_ore_generation.data 32
execute if predicate simplenergy:chance/0.5 run scoreboard players operation #x.random smart_ore_generation.data *= #-1 smart_ore_generation.data
scoreboard players operation #x.random smart_ore_generation.data *= #seed smart_ore_generation.data

scoreboard players set #y smart_ore_generation.data 0
execute if predicate simplenergy:chance/0.5 run scoreboard players add #y smart_ore_generation.data 1
execute if predicate simplenergy:chance/0.5 run scoreboard players add #y smart_ore_generation.data 2
execute if predicate simplenergy:chance/0.5 run scoreboard players add #y smart_ore_generation.data 4
execute if predicate simplenergy:chance/0.5 run scoreboard players add #y smart_ore_generation.data 8
execute if predicate simplenergy:chance/0.5 run scoreboard players add #y smart_ore_generation.data 16
execute if predicate simplenergy:chance/0.5 run scoreboard players add #y smart_ore_generation.data 32
execute if predicate simplenergy:chance/0.5 run scoreboard players operation #y smart_ore_generation.data *= #-1 smart_ore_generation.data
scoreboard players operation #y smart_ore_generation.data *= #seed smart_ore_generation.data

scoreboard players set #z.random smart_ore_generation.data 0
execute if predicate simplenergy:chance/0.5 run scoreboard players add #z.random smart_ore_generation.data 1
execute if predicate simplenergy:chance/0.5 run scoreboard players add #z.random smart_ore_generation.data 2
execute if predicate simplenergy:chance/0.5 run scoreboard players add #z.random smart_ore_generation.data 4
execute if predicate simplenergy:chance/0.5 run scoreboard players add #z.random smart_ore_generation.data 8
execute if predicate simplenergy:chance/0.5 run scoreboard players add #z.random smart_ore_generation.data 16
execute if predicate simplenergy:chance/0.5 run scoreboard players add #z.random smart_ore_generation.data 32
execute if predicate simplenergy:chance/0.5 run scoreboard players operation #z.random smart_ore_generation.data *= #-1 smart_ore_generation.data
scoreboard players operation #z.random smart_ore_generation.data *= #seed smart_ore_generation.data
