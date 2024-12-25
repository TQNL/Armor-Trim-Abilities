# raycast done
execute if block ~ ~ ~ #sus_block run data modify storage trim_abilities:loottables sus_block set string block ~ ~ ~ LootTable 10
execute if block ~ ~ ~ #sus_block run function trim:full_set/coast/sus_loot/3 with storage trim_abilities:loottables
execute if block ~ ~ ~ #sus_block run return 0

# further raycast, in unsuccesful case
execute positioned ^ ^ ^0.1 if entity @s[distance=..4.5] run function trim:full_set/coast/sus_loot/2
