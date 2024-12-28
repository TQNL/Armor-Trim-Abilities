execute store result score @s trim_flag at @s as @p[tag=full_set_coast,distance=..4.5] run data get entity @s SelectedItem.components."minecraft:enchantments".levels."minecraft:fortune"
scoreboard players add @s trim_flag 1
execute store result storage trim_abilities:coast_armor fortune_level int 1 run scoreboard players get @s trim_flag
function trim:full_set/coast_new/fortune3 with storage trim_abilities:coast_armor
data remove storage trim_abilities:coast_armor fortune_level
scoreboard players reset @s trim_flag
