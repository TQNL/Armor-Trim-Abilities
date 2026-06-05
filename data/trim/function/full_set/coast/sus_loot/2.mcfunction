# raycast done
execute if block ~ ~ ~ #trim:sus_block run data modify storage trim_abilities:loottables sus_block set string block ~ ~ ~ LootTable 10
execute if block ~ ~ ~ #trim:sus_block if data block ~ ~ ~ {LootTable:"minecraft:archaeology/trail_ruins_common"} run return run data merge block ~ ~ ~ {LootTable:"minecraft:archaeology/trail_ruins_rare"}
execute if block ~ ~ ~ #trim:sus_block run return run function trim:full_set/coast/sus_loot/3 with storage trim_abilities:loottables

# further raycast, in unsuccesful case
execute positioned ^ ^ ^0.1 if entity @s[distance=..4.5] run function trim:full_set/coast/sus_loot/2
