execute store result score @s trim.flag at @s as @p[tag=trim.full_set.coast,distance=..4.5] run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:fortune"
scoreboard players add @s trim.flag 1
execute store result storage trim_abilities:coast_armor fortune_level int 1 run scoreboard players get @s trim.flag
function trim:full_set/coast/fortune3 with storage trim_abilities:coast_armor
data remove storage trim_abilities:coast_armor fortune_level
scoreboard players reset @s trim.flag
