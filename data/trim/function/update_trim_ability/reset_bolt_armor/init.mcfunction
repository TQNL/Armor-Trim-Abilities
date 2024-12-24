execute store result score @s trim_bolt_slot run data get entity @s Inventory[{components:{"minecraft:custom_data":{single_bolt:{head:1b}}}}].Slot
execute if score @s trim_bolt_slot matches 9.. run data merge storage trim_abilities:bolt_armor {field:{head:{type:"inventory"}}}
execute if score @s trim_bolt_slot matches 0..8 run data merge storage trim_abilities:bolt_armor {field:{head:{type:"hotbar"}}}
execute if score @s trim_bolt_slot matches 9.. run scoreboard players remove @s trim_bolt_slot 9
execute store result storage trim_abilities:bolt_armor field.head.slot byte 1 run scoreboard players get @s trim_bolt_slot
function trim:update_trim_ability/reset_bolt_armor/1 with storage trim_abilities:bolt_armor field.head

execute store result score @s trim_bolt_slot run data get entity @s Inventory[{components:{"minecraft:custom_data":{single_bolt:{chest:1b}}}}].Slot
execute if score @s trim_bolt_slot matches 9.. run data merge storage trim_abilities:bolt_armor {field:{chest:{type:"inventory"}}}
execute if score @s trim_bolt_slot matches 0..8 run data merge storage trim_abilities:bolt_armor {field:{chest:{type:"hotbar"}}}
execute if score @s trim_bolt_slot matches 9.. run scoreboard players remove @s trim_bolt_slot 9
execute store result storage trim_abilities:bolt_armor field.chest.slot byte 1 run scoreboard players get @s trim_bolt_slot
function trim:update_trim_ability/reset_bolt_armor/1 with storage trim_abilities:bolt_armor field.chest

execute store result score @s trim_bolt_slot run data get entity @s Inventory[{components:{"minecraft:custom_data":{single_bolt:{legs:1b}}}}].Slot
execute if score @s trim_bolt_slot matches 9.. run data merge storage trim_abilities:bolt_armor {field:{legs:{type:"inventory"}}}
execute if score @s trim_bolt_slot matches 0..8 run data merge storage trim_abilities:bolt_armor {field:{legs:{type:"hotbar"}}}
execute if score @s trim_bolt_slot matches 9.. run scoreboard players remove @s trim_bolt_slot 9
execute store result storage trim_abilities:bolt_armor field.legs.slot byte 1 run scoreboard players get @s trim_bolt_slot
function trim:update_trim_ability/reset_bolt_armor/1 with storage trim_abilities:bolt_armor field.legs

execute store result score @s trim_bolt_slot run data get entity @s Inventory[{components:{"minecraft:custom_data":{single_bolt:{feet:1b}}}}].Slot
execute if score @s trim_bolt_slot matches 9.. run data merge storage trim_abilities:bolt_armor {field:{feet:{type:"inventory"}}}
execute if score @s trim_bolt_slot matches 0..8 run data merge storage trim_abilities:bolt_armor {field:{feet:{type:"hotbar"}}}
execute if score @s trim_bolt_slot matches 9.. run scoreboard players remove @s trim_bolt_slot 9
execute store result storage trim_abilities:bolt_armor field.feet.slot byte 1 run scoreboard players get @s trim_bolt_slot
function trim:update_trim_ability/reset_bolt_armor/1 with storage trim_abilities:bolt_armor field.feet
