scoreboard players reset @s find_way
scoreboard players reset @s locate_test

execute unless block ~ ~ ~ #air run return run tellraw @s {"color":"red","text":"You are partly standing in a block, your feet need to be in air"}

data modify storage trim_abilities:wayfinder root.command set from entity @s SelectedItem.components."minecraft:writable_book_content".pages[0].raw
data modify storage trim_abilities:wayfinder root.check_locate set string storage trim_abilities:wayfinder root.command 0 6
execute store success score @s locate_test run data modify storage trim_abilities:wayfinder root.check_locate set value "locate"
execute if score @s locate_test matches 1 run return run tellraw @s {"color":"red","text":"Invalid command given"}

scoreboard players reset @s locate_test

function trim:single/wayfinder/find2 with storage trim_abilities:wayfinder root
data remove storage trim_abilities:wayfinder root
