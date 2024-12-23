# raycast done
execute if block ~ ~ ~ chest run data modify storage trim_abilities:loottables chest set string block ~ ~ ~ LootTable 10
execute if block ~ ~ ~ chest run data remove block ~ ~ ~ Items
execute if block ~ ~ ~ chest run function trim:full_set/coast/3 with storage trim_abilities:loottables
execute if block ~ ~ ~ chest run return 0

# further raycast, in unsuccesful case
execute positioned ^ ^ ^0.1 if entity @s[distance=..4.5] run function trim:full_set/coast/2
