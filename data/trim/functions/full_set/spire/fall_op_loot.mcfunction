execute store result score @s trim_motion1_spire run data get entity @s Motion[1] 10
execute if score @s[tag=!trim_op_looted] trim_motion1_spire matches ..-12 run function trim:full_set/spire/fall_op_loot2
