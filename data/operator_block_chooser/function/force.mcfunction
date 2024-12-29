scoreboard players reset #obc.choose_block_counter operator_block_chooser
data modify storage operator_block_chooser:choose_block coords.x set value 0
data modify storage operator_block_chooser:choose_block coords.z set value 0

# highest block in world + 1 to hopefully do less damage, fails if out of this world
execute positioned over world_surface positioned ~ ~1 ~ summon area_effect_cloud store result storage operator_block_chooser:choose_block coords.y int 1 run return run data get entity @s Pos[1]

# highest block in world that is garanteed to exist
execute positioned over world_surface summon area_effect_cloud store result storage operator_block_chooser:choose_block coords.y int 1 run data get entity @s Pos[1]
