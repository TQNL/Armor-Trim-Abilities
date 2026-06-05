loot spawn ~ ~1 ~ loot trim:gold_block_batering
tag @s remove trim_gold_block_batering
execute positioned ~ ~1 ~ if entity @p[tag=full_set_snout,distance=..3] run data modify entity @n[type=item] Motion[1] set value 0.3d
data remove entity @s equipment.offhand
