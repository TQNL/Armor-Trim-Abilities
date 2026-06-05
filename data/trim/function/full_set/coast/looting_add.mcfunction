# tick will remove this again next tick
advancement revoke @s only trim:trim_abilities/kill_mob_coast
execute if entity @s[tag=full_set_coast_got_looting] run return 0
item modify entity @s weapon.mainhand {"function":"minecraft:set_enchantments","enchantments":{"minecraft:looting":1},"add":true}
tag @s add full_set_coast_got_looting
