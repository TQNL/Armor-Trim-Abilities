# raycast done - wont instantiate if loot table doesnt exist
execute if block ~ ~ ~ #trim:chest_or_barrel unless data block ~ ~ ~ LootTable run return fail
execute if block ~ ~ ~ #trim:chest_or_barrel run data modify storage trim_abilities:loottables chest set string block ~ ~ ~ LootTable 10
execute if block ~ ~ ~ #trim:chest_or_barrel unless data storage trim_abilities:loottables chest run return fail
execute if block ~ ~ ~ #trim:chest_or_barrel run return run function trim:full_set/coast/loot/3 with storage trim_abilities:loottables

execute if block ~ ~ ~ vault run data modify storage trim_abilities:loottables vault set string block ~ ~ ~ config.loot_table 10
execute if block ~ ~ ~ vault unless data storage trim_abilities:loottables vault run data modify storage trim_abilities:loottables vault set value "chests/trial_chambers/reward"
execute if block ~ ~ ~ vault align xyz positioned ~0.5 ~1 ~0.5 run return run function trim:full_set/coast/loot/vault with storage trim_abilities:loottables

# further raycast, in unsuccesful case
execute positioned ^ ^ ^0.1 if entity @s[distance=..5] run function trim:full_set/coast/loot/2
