tag @s remove trim.update_next
advancement revoke @s through trim:trim_abilities/root
scoreboard players reset @s trim.deaths

# filter for if armor changed while riding wind charge vehicle by e.g. taking damage
execute if entity @s[tag=trim.full_set.flow] on vehicle if entity @s[type=horse,tag=trim.full_set.flow.wind_ball] run return 0

# main
schedule clear trim:single/dune/saturation
schedule clear trim:single/silence/inflict_warden_power

# clean up (trim_abilities_unender_pearl:1b, trim_abilities_potion_of_levitation:1b, trim_abilities_pillager_war_horn:1b, trim_abilities_sonic_boom:1b, trim_abilities_sentry_crossbow:1b all also have trim_abilities:1b)
kill @e[type=item,nbt={PickupDelay:40s,Item:{components:{"minecraft:custom_data":{trim_abilities_custom_item:1b}}}}]
clear @s *[minecraft:custom_data~{trim_abilities_custom_item:1b}]
execute if entity @s[tag=trim.single.vex] run effect clear @s jump_boost
execute if entity @s[tag=trim.single.vex] run effect clear @s slow_falling
execute if entity @s[tag=trim.full_set.coast] run effect clear @s luck
execute if entity @s[tag=trim.full_set.ward] run effect clear @s haste
execute if entity @s[tag=trim.single.host] run effect clear @s hero_of_the_village
execute if entity @s[tag=trim.single.tide] run effect clear @s water_breathing
execute if entity @s[tag=trim.full_set.tide] run effect clear @s water_breathing
execute if entity @s[tag=trim.full_set.tide] run effect clear @s dolphins_grace
execute if entity @s[tag=trim.full_set.tide] run effect clear @s conduit_power
execute if entity @s[tag=trim.single.shaper] run kill @n[tag=trim.block_id_shaper]
## 1.20.4: ability to reset got added, but this works fine
execute as @a[tag=trim.full_set.flow] run ride @s dismount
execute as @a[tag=trim.full_set.wild] run attribute @s step_height base set 0.6
execute as @a[tag=trim.full_set.wild] run attribute @s gravity base set 0.08
execute as @a[tag=trim.full_set.wild] run attribute @s safe_fall_distance base set 3
scoreboard players reset @s trim.get_bundle
scoreboard players reset @s trim.find_way
scoreboard players reset @s trim.panda_genes
## this item is allowed to go outside the player, this is just a curtosy, idc if the data pack gets disabled after
## reseting flow attributes
### sadly the default components can't be hidden again after being exposed, so the armor isn't exactly the same
### with the new attribute added, the default ones show up in the data, from the armor, only 1 of each piece can be custom:
execute unless entity @s[tag=!trim.single.flow,tag=!trim.full_set.flow] if items entity @s container.* *[custom_data~{trim_abilities:1b}] at @s run function trim:single/flow/reset_flow_armor {slot_type:"container."}
execute unless entity @s[tag=!trim.single.flow,tag=!trim.full_set.flow] if items entity @s weapon.offhand *[custom_data~{trim_abilities:1b}] at @s run function trim:single/flow/reset_flow_armor {slot_type:"weapon."}
## reseting single bolt attributes
execute at @s unless entity @s[tag=!trim.single.bolt,tag=!trim.full_set.bolt] if items entity @s container.* *[custom_data~{trim_abilities:1b}] at @s run function trim:single/bolt/reset_bolt_armor {slot_type:"container."}
execute at @s unless entity @s[tag=!trim.single.bolt,tag=!trim.full_set.bolt] if items entity @s weapon.offhand *[custom_data~{trim_abilities:1b}] at @s run function trim:single/bolt/reset_bolt_armor {slot_type:"weapon."}
## eventhough you can get this item out of the inventory by dropping, it has no practical use case, so who cares

# tag clean up
#tag @s remove trim.got_item
tag @s remove trim.snout
tag @s remove trim.full_set.coast
tag @s remove trim.single.coast
tag @s remove trim.full_set.dune
tag @s remove trim.single.dune
tag @s remove trim.full_set.eye
tag @s remove trim.single.eye
tag @s remove trim.full_set.rib
tag @s remove trim.single.rib
tag @s remove trim.full_set.sentry
tag @s remove trim.single.sentry
tag @s remove trim.full_set.silence
tag @s remove trim.single.silence
tag @s remove trim.full_set.snout
tag @s remove trim.single.snout
tag @s remove trim.full_set.spire
tag @s remove trim.single.spire
tag @s remove trim.full_set.vex
tag @s remove trim.single.vex
tag @s remove trim.full_set.ward
tag @s remove trim.single.ward
tag @s remove trim.full_set.tide
tag @s remove trim.single.tide
tag @s remove trim.full_set.wild
tag @s remove trim.single.wild
tag @s remove trim.full_set.ascendant
tag @s remove trim.single.wayfinder
tag @s remove trim.single.shaper
tag @s remove trim.single.host
tag @s remove trim.single.raiser
tag @s remove trim.single.flow
tag @s remove trim.full_set.flow
tag @s remove trim.single.bolt
tag @s remove trim.full_set.bolt
## add future tags

execute unless data entity @s equipment.feet unless data entity @s equipment.legs unless data entity @s equipment.chest unless data entity @s equipment.head run return 0

# mark trimmed armor
execute if data entity @s equipment.head.components."minecraft:trim" run item modify entity @s armor.head {"function":"minecraft:set_custom_data","tag":"{trim_abilities:1b}"}
execute if data entity @s equipment.chest.components."minecraft:trim" run item modify entity @s armor.chest {"function":"minecraft:set_custom_data","tag":"{trim_abilities:1b}"}
execute if data entity @s equipment.legs.components."minecraft:trim" run item modify entity @s armor.legs {"function":"minecraft:set_custom_data","tag":"{trim_abilities:1b}"}
execute if data entity @s equipment.feet.components."minecraft:trim" run item modify entity @s armor.feet {"function":"minecraft:set_custom_data","tag":"{trim_abilities:1b}"}

#  full set
execute if data entity @s equipment.feet.components."minecraft:trim" if data entity @s equipment.legs.components."minecraft:trim" if data entity @s equipment.chest.components."minecraft:trim" if data entity @s equipment.head.components."minecraft:trim" run return run function trim:update_trim_ability/u_t_a_full_armor

#  single
data modify storage trim_abilities:player_armor boots set string entity @s equipment.feet.components."minecraft:trim".pattern 10
data modify storage trim_abilities:player_armor leggings set string entity @s equipment.legs.components."minecraft:trim".pattern 10
data modify storage trim_abilities:player_armor chestplate set string entity @s equipment.chest.components."minecraft:trim".pattern 10
data modify storage trim_abilities:player_armor helmet set string entity @s equipment.head.components."minecraft:trim".pattern 10
execute if data entity @s equipment.feet.components."minecraft:trim" run function trim:update_trim_ability/u_t_a_boots with storage trim_abilities:player_armor
execute if data entity @s equipment.legs.components."minecraft:trim" run function trim:update_trim_ability/u_t_a_leggings with storage trim_abilities:player_armor
execute if data entity @s equipment.chest.components."minecraft:trim" run function trim:update_trim_ability/u_t_a_chestplate with storage trim_abilities:player_armor
execute if data entity @s equipment.head.components."minecraft:trim" run function trim:update_trim_ability/u_t_a_helmet with storage trim_abilities:player_armor
