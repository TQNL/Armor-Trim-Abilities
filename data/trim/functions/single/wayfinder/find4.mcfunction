data modify storage trim_abilities:wayfinder check_succes set string block ~ ~ ~ LastOutput 20 23
execute store success score @s locate_test run data modify storage trim_abilities:wayfinder check_succes set value "red"
execute if score @s locate_test matches 0 run function trim:single/wayfinder/find_fault
execute if score @s locate_test matches 0 run scoreboard players reset @s locate_test
execute if score @s locate_test matches 0 run return 0
scoreboard players reset @s locate_test


data modify storage trim_abilities:wayfinder distance_magnitude set string block ~ ~ ~ LastOutput -33 -32
execute store success score @s locate_test run data modify storage trim_abilities:wayfinder distance_magnitude set value '"'
execute if score @s locate_test matches 0 run data modify storage trim_abilities:wayfinder distance set string block ~ ~ ~ LastOutput -32 -26
execute if score @s locate_test matches 0 run function trim:single/wayfinder/find5
execute if score @s locate_test matches 0 run scoreboard players reset @s locate_test
execute if score @s locate_test matches 0 run return 0

data modify storage trim_abilities:wayfinder distance_magnitude set string block ~ ~ ~ LastOutput -32 -31
execute store success score @s locate_test run data modify storage trim_abilities:wayfinder distance_magnitude set value '"'
execute if score @s locate_test matches 0 run data modify storage trim_abilities:wayfinder distance set string block ~ ~ ~ LastOutput -31 -26
execute if score @s locate_test matches 0 run function trim:single/wayfinder/find5
execute if score @s locate_test matches 0 run scoreboard players reset @s locate_test
execute if score @s locate_test matches 0 run return 0

data modify storage trim_abilities:wayfinder distance_magnitude set string block ~ ~ ~ LastOutput -31 -30
execute store success score @s locate_test run data modify storage trim_abilities:wayfinder distance_magnitude set value '"'
execute if score @s locate_test matches 0 run data modify storage trim_abilities:wayfinder distance set string block ~ ~ ~ LastOutput -30 -26
execute if score @s locate_test matches 0 run function trim:single/wayfinder/find5
execute if score @s locate_test matches 0 run scoreboard players reset @s locate_test
execute if score @s locate_test matches 0 run return 0

data modify storage trim_abilities:wayfinder distance_magnitude set string block ~ ~ ~ LastOutput -30 -29
execute store success score @s locate_test run data modify storage trim_abilities:wayfinder distance_magnitude set value '"'
execute if score @s locate_test matches 0 run data modify storage trim_abilities:wayfinder distance set string block ~ ~ ~ LastOutput -29 -26
execute if score @s locate_test matches 0 run function trim:single/wayfinder/find5
execute if score @s locate_test matches 0 run scoreboard players reset @s locate_test
execute if score @s locate_test matches 0 run return 0

data modify storage trim_abilities:wayfinder distance_magnitude set string block ~ ~ ~ LastOutput -29 -28
execute store success score @s locate_test run data modify storage trim_abilities:wayfinder distance_magnitude set value '"'
execute if score @s locate_test matches 0 run data modify storage trim_abilities:wayfinder distance set string block ~ ~ ~ LastOutput -28 -26
execute if score @s locate_test matches 0 run function trim:single/wayfinder/find5
execute if score @s locate_test matches 0 run scoreboard players reset @s locate_test
execute if score @s locate_test matches 0 run return 0

data modify storage trim_abilities:wayfinder distance_magnitude set string block ~ ~ ~ LastOutput -28 -27
data modify storage trim_abilities:wayfinder distance set string block ~ ~ ~ LastOutput -27 -26
function trim:single/wayfinder/find5
scoreboard players reset @s locate_test