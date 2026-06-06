advancement revoke @s from trim:trim_abilities/root
execute unless entity @s[tag=trim.full_set.coast] run return 0
execute anchored eyes positioned ^ ^ ^ anchored feet run function trim:full_set/coast/loot/2
data remove storage trim_abilities:loottables chest
