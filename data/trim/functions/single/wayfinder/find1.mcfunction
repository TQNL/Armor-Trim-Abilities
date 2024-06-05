scoreboard players reset @s find_way
scoreboard players reset @s locate_test
execute unless block ~ ~ ~ #air run return run tellraw @s {"color":"red","text":"You are partly standing in a block, your feet need to be in air"}
data remove storage trim_abilities:wayfinder command
data remove storage trim_abilities:wayfinder check_locate
data remove storage trim_abilities:wayfinder check_succes
data remove storage trim_abilities:wayfinder distance_magnitude
data remove storage trim_abilities:wayfinder distance

data modify storage trim_abilities:wayfinder command set from entity @s SelectedItem.components."minecraft:writable_book_content".pages[0].raw
data modify storage trim_abilities:wayfinder check_locate set string storage trim_abilities:wayfinder command 0 6
execute store success score @s locate_test run data modify storage trim_abilities:wayfinder check_locate set value "locate"
execute if score @s locate_test matches 1 run return run tellraw @s {"color":"red","text":"Invalid command given"}

scoreboard players reset @s locate_test
function trim:single/wayfinder/find2 with storage trim_abilities:wayfinder
