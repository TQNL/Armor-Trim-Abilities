data modify storage trim_abilities:wayfinder check_succes set string block ~ ~ ~ LastOutput -7 -4
execute store success score @s locate_test run data modify storage trim_abilities:wayfinder check_succes set value "red"
execute if score @s locate_test matches 0 run function trim:single/wayfinder/find_fault
execute if score @s locate_test matches 0 run return run scoreboard players reset @s locate_test
scoreboard players reset @s locate_test


data modify storage trim_abilities:wayfinder distance_magnitude set string block ~ ~ ~ LastOutput -6 -5
execute store success score @s locate_test run data modify storage trim_abilities:wayfinder distance_magnitude set value ','
execute if score @s locate_test matches 0 run data modify storage trim_abilities:wayfinder distance set string block ~ ~ ~ LastOutput -5 -4
execute if score @s locate_test matches 0 run function trim:single/wayfinder/find5
execute if score @s locate_test matches 0 run return run scoreboard players reset @s locate_test


data modify storage trim_abilities:wayfinder distance_magnitude set string block ~ ~ ~ LastOutput -7 -6
execute store success score @s locate_test run data modify storage trim_abilities:wayfinder distance_magnitude set value ','
execute if score @s locate_test matches 0 run data modify storage trim_abilities:wayfinder distance set string block ~ ~ ~ LastOutput -6 -4
execute if score @s locate_test matches 0 run function trim:single/wayfinder/find5
execute if score @s locate_test matches 0 run return run scoreboard players reset @s locate_test


data modify storage trim_abilities:wayfinder distance_magnitude set string block ~ ~ ~ LastOutput -8 -7
execute store success score @s locate_test run data modify storage trim_abilities:wayfinder distance_magnitude set value ','
execute if score @s locate_test matches 0 run data modify storage trim_abilities:wayfinder distance set string block ~ ~ ~ LastOutput -7 -4
execute if score @s locate_test matches 0 run function trim:single/wayfinder/find5
execute if score @s locate_test matches 0 run return run scoreboard players reset @s locate_test


data modify storage trim_abilities:wayfinder distance_magnitude set string block ~ ~ ~ LastOutput -9 -8
execute store success score @s locate_test run data modify storage trim_abilities:wayfinder distance_magnitude set value ','
execute if score @s locate_test matches 0 run data modify storage trim_abilities:wayfinder distance set string block ~ ~ ~ LastOutput -8 -4
execute if score @s locate_test matches 0 run function trim:single/wayfinder/find5
execute if score @s locate_test matches 0 run return run scoreboard players reset @s locate_test


data modify storage trim_abilities:wayfinder distance_magnitude set string block ~ ~ ~ LastOutput -10 -9
execute store success score @s locate_test run data modify storage trim_abilities:wayfinder distance_magnitude set value ','
execute if score @s locate_test matches 0 run data modify storage trim_abilities:wayfinder distance set string block ~ ~ ~ LastOutput -9 -4
execute if score @s locate_test matches 0 run function trim:single/wayfinder/find5
execute if score @s locate_test matches 0 run return run scoreboard players reset @s locate_test


data modify storage trim_abilities:wayfinder distance set string block ~ ~ ~ LastOutput -10 -4
function trim:single/wayfinder/find5
scoreboard players reset @s locate_test