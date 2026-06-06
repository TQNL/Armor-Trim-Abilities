execute store result score @s trim.motion1 run data get entity @s Motion[1] 10
scoreboard players add @s trim.motion1 1
execute if score @s trim.motion1 matches ..-12 run tag @s add trim.explosive
execute if entity @s[tag=trim.explosive] if score @s trim.motion1 matches 0.. run function trim:full_set/dune/explode2
