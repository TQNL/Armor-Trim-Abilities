advancement revoke @s only trim:trim_abilities/totem
execute store result score @s trim_coin_flip run random value 0..1
execute if score @s trim_coin_flip matches 1 run scoreboard players reset @s trim_coin_flip
execute if score @s trim_coin_flip matches 1 run return 0
execute unless data entity @s SelectedItem if data entity @s Inventory[{Slot:-106b}] run item replace entity @s weapon.mainhand with totem_of_undying
execute unless data entity @s Inventory[{Slot:-106b}] run item replace entity @s weapon.offhand with totem_of_undying
scoreboard players reset @s trim_coin_flip
