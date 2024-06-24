advancement revoke @s from trim:trim_abilities/root
execute unless entity @s[tag=full_set_coast] run return 0
execute anchored eyes positioned ^ ^ ^ anchored feet run function trim:full_set/coast/2
