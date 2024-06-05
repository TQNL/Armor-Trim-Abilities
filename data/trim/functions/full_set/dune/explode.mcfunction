execute store result score @s trim_motion1 run data get entity @s Motion[1] 10
scoreboard players add @s trim_motion1 1
execute if score @s trim_motion1 matches ..-12 run tag @s add trim_explosive
execute if entity @s[tag=trim_explosive] if score @s trim_motion1 matches 0.. run function trim:full_set/dune/explode2
