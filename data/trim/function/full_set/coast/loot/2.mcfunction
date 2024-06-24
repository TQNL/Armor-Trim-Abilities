# raycast done
execute if block ~ ~ ~ #chest_or_barrel run data modify storage trim_abilities:loottables chest set string block ~ ~ ~ LootTable 10
execute if block ~ ~ ~ #chest_or_barrel run data remove block ~ ~ ~ Items
execute if block ~ ~ ~ #chest_or_barrel run function trim:full_set/coast/loot/3 with storage trim_abilities:loottables
execute if block ~ ~ ~ #chest_or_barrel run return 0

execute if block ~ ~ ~ vault run data modify storage trim_abilities:loottables vault set string block ~ ~ ~ config.loot_table 10
execute if block ~ ~ ~ vault align xyz positioned ~0.5 ~1 ~0.5 run function trim:full_set/coast/loot/vault with storage trim_abilities:loottables
execute if block ~ ~ ~ vault run return 0

# further raycast, in unsuccesful case
execute positioned ^ ^ ^0.1 if entity @s[distance=..5] run function trim:full_set/coast/loot/2
