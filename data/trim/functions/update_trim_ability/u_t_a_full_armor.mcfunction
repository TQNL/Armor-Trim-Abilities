#  full set
data modify storage trim_abilities:player_armor boots set from entity @s Inventory[{Slot:100b}].components."minecraft:trim".pattern
data modify storage trim_abilities:player_armor leggings set from entity @s Inventory[{Slot:101b}].components."minecraft:trim".pattern
data modify storage trim_abilities:player_armor chestplate set from entity @s Inventory[{Slot:102b}].components."minecraft:trim".pattern
data modify storage trim_abilities:player_armor helmet set from entity @s Inventory[{Slot:103b}].components."minecraft:trim".pattern
execute store success score @s compare_armor1 run data modify storage trim_abilities:player_armor helmet set from storage trim_abilities:player_armor chestplate
execute store success score @s compare_armor2 run data modify storage trim_abilities:player_armor chestplate set from storage trim_abilities:player_armor leggings
execute store success score @s compare_armor3 run data modify storage trim_abilities:player_armor leggings set from storage trim_abilities:player_armor boots
execute if score @s compare_armor1 matches 0 if score @s compare_armor2 matches 0 if score @s compare_armor3 matches 0 run data modify storage trim_abilities:player_armor trim set string entity @s Inventory[{Slot:100b}].components."minecraft:trim".pattern 10
execute if score @s compare_armor1 matches 0 if score @s compare_armor2 matches 0 if score @s compare_armor3 matches 0 run function trim:update_trim_ability/full_set_ability with storage trim_abilities:player_armor
execute if score @s compare_armor1 matches 0 if score @s compare_armor2 matches 0 if score @s compare_armor3 matches 0 run return 0

#  single
data modify storage trim_abilities:player_armor boots set string entity @s Inventory[{Slot:100b}].components."minecraft:trim".pattern 10
data modify storage trim_abilities:player_armor leggings set string entity @s Inventory[{Slot:101b}].components."minecraft:trim".pattern 10
data modify storage trim_abilities:player_armor chestplate set string entity @s Inventory[{Slot:102b}].components."minecraft:trim".pattern 10
data modify storage trim_abilities:player_armor helmet set string entity @s Inventory[{Slot:103b}].components."minecraft:trim".pattern 10
execute if data entity @s Inventory[{Slot:100b}].components."minecraft:trim" run function trim:update_trim_ability/u_t_a_boots with storage trim_abilities:player_armor
execute if data entity @s Inventory[{Slot:101b}].components."minecraft:trim" run function trim:update_trim_ability/u_t_a_leggings with storage trim_abilities:player_armor
execute if data entity @s Inventory[{Slot:102b}].components."minecraft:trim" run function trim:update_trim_ability/u_t_a_chestplate with storage trim_abilities:player_armor
execute if data entity @s Inventory[{Slot:103b}].components."minecraft:trim" run function trim:update_trim_ability/u_t_a_helmet with storage trim_abilities:player_armor
