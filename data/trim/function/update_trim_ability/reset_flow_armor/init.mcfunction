execute store result score @s trim_flow_slot run data get entity @s Inventory[{components:{"minecraft:custom_data":{single_flow:{head:1b}}}}].Slot
execute if score @s trim_flow_slot matches 10.. run data merge storage trim_abilities:flow_armor {head:{type:"inventory"}}
execute if score @s trim_flow_slot matches 0..9 run data merge storage trim_abilities:flow_armor {head:{type:"hotbar"}}
execute if score @s trim_flow_slot matches 10.. run scoreboard players remove @s trim_flow_slot 9
execute store result storage trim_abilities:flow_armor head.slot byte 1 run scoreboard players get @s trim_flow_slot
function trim:update_trim_ability/reset_flow_armor/0 with storage trim_abilities:flow_armor head

execute store result score @s trim_flow_slot run data get entity @s Inventory[{components:{"minecraft:custom_data":{single_flow:{chest:1b}}}}].Slot
execute if score @s trim_flow_slot matches 10.. run data merge storage trim_abilities:flow_armor {chest:{type:"inventory"}}
execute if score @s trim_flow_slot matches 0..9 run data merge storage trim_abilities:flow_armor {chest:{type:"hotbar"}}
execute if score @s trim_flow_slot matches 10.. run scoreboard players remove @s trim_flow_slot 9
execute store result storage trim_abilities:flow_armor chest.slot byte 1 run scoreboard players get @s trim_flow_slot
function trim:update_trim_ability/reset_flow_armor/0 with storage trim_abilities:flow_armor chest

execute store result score @s trim_flow_slot run data get entity @s Inventory[{components:{"minecraft:custom_data":{single_flow:{legs:1b}}}}].Slot
execute if score @s trim_flow_slot matches 10.. run data merge storage trim_abilities:flow_armor {legs:{type:"inventory"}}
execute if score @s trim_flow_slot matches 0..9 run data merge storage trim_abilities:flow_armor {legs:{type:"hotbar"}}
execute if score @s trim_flow_slot matches 10.. run scoreboard players remove @s trim_flow_slot 9
execute store result storage trim_abilities:flow_armor legs.slot byte 1 run scoreboard players get @s trim_flow_slot
function trim:update_trim_ability/reset_flow_armor/0 with storage trim_abilities:flow_armor legs

execute store result score @s trim_flow_slot run data get entity @s Inventory[{components:{"minecraft:custom_data":{single_flow:{feet:1b}}}}].Slot
execute if score @s trim_flow_slot matches 10.. run data merge storage trim_abilities:flow_armor {feet:{type:"inventory"}}
execute if score @s trim_flow_slot matches 0..9 run data merge storage trim_abilities:flow_armor {feet:{type:"hotbar"}}
execute if score @s trim_flow_slot matches 10.. run scoreboard players remove @s trim_flow_slot 9
execute store result storage trim_abilities:flow_armor feet.slot byte 1 run scoreboard players get @s trim_flow_slot
function trim:update_trim_ability/reset_flow_armor/0 with storage trim_abilities:flow_armor feet
