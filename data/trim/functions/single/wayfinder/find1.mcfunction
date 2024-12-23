scoreboard players reset @s find_way
scoreboard players reset @s locate_test

data remove storage trim_abilities:wayfinder command
data remove storage trim_abilities:wayfinder check_locate
data remove storage trim_abilities:wayfinder check_succes
data remove storage trim_abilities:wayfinder distance_magnitude
data remove storage trim_abilities:wayfinder distance

data modify storage trim_abilities:wayfinder command set from entity @s SelectedItem.tag.pages[0]
data modify storage trim_abilities:wayfinder check_locate set string storage trim_abilities:wayfinder command 0 6
execute store success score @s locate_test run data modify storage trim_abilities:wayfinder check_locate set value "locate"
execute if score @s locate_test matches 1 run return 0

scoreboard players reset @s locate_test
function trim:single/wayfinder/find2 with storage trim_abilities:wayfinder
