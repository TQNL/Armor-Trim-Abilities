# disable ability
execute if predicate trim:left_boat run advancement revoke @s only trim:trim_abilities/boating
execute if predicate trim:left_boat run advancement revoke @s only trim:trim_abilities/chest_boating
execute if predicate trim:left_boat run return 0

# enable ability
execute on vehicle at @s if block ~ ~ ~ water[level=0] run tp @s ~ ~0.47739276496 ~
execute on vehicle at @s if block ~ ~ ~ air run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 frosted_ice replace water[level=0]
