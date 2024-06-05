advancement revoke @s through trim:trim_abilities/root
scoreboard players reset @s trim_deaths
schedule clear trim:single/dune/saturation
schedule clear trim:single/silence/inflict_warden_power

# clean up (trim_abilities_unender_pearl:1b, trim_abilities_potion_of_levitation:1b, trim_abilities_pillager_war_horn:1b, trim_abilities_sonic_boom:1b, trim_abilities_sentry_crossbow:1b all also have trim_abilities:1b)
kill @e[type=item,nbt={PickupDelay:40s,Item:{components:{"minecraft:custom_data":{trim_abilities_custom_item:1b}}}}]
clear @s *[minecraft:custom_data~{trim_abilities_custom_item:1b}]
execute if entity @s[tag=single_vex] run effect clear @s jump_boost
execute if entity @s[tag=single_vex] run effect clear @s slow_falling
execute if entity @s[tag=full_set_ward] run effect clear @s haste
execute if entity @s[tag=single_host] run effect clear @s hero_of_the_village
execute if entity @s[tag=single_tide] run effect clear @s water_breathing
execute if entity @s[tag=full_set_tide] run effect clear @s water_breathing
execute if entity @s[tag=full_set_tide] run effect clear @s dolphins_grace
execute if entity @s[tag=full_set_tide] run effect clear @s conduit_power
execute if entity @s[tag=single_shaper] run kill @e[tag=trim_block_id_shaper,sort=nearest,limit=1]
execute as @a[tag=full_set_wild] run attribute @s generic.step_height base set 0.6
execute as @a[tag=full_set_wild] run attribute @s generic.gravity base set 0.08
execute as @a[tag=full_set_wild] run attribute @s generic.safe_fall_distance base set 3
scoreboard players reset @s get_bundle
scoreboard players reset @s find_way
scoreboard players reset @s panda_genes

# tag clean up
tag @s remove trim_snout
tag @s remove trim_debug_stick
tag @s remove trim_got_item
tag @s remove full_set_coast
tag @s remove single_coast
tag @s remove full_set_dune
tag @s remove single_dune
tag @s remove full_set_eye
tag @s remove single_eye
tag @s remove full_set_rib
tag @s remove single_rib
tag @s remove full_set_sentry
tag @s remove single_sentry
tag @s remove full_set_silence
tag @s remove single_silence
tag @s remove full_set_snout
tag @s remove single_snout
tag @s remove full_set_spire
tag @s remove single_spire
tag @s remove full_set_vex
tag @s remove single_vex
tag @s remove full_set_ward
tag @s remove single_ward
tag @s remove full_set_tide
tag @s remove single_tide
tag @s remove full_set_wild
tag @s remove single_wild
tag @s remove full_set_ascendant
tag @s remove single_wayfinder
tag @s remove single_shaper
tag @s remove single_host
tag @s remove single_raiser

execute unless data entity @s Inventory[{Slot:100b}] unless data entity @s Inventory[{Slot:101b}] unless data entity @s Inventory[{Slot:102b}] unless data entity @s Inventory[{Slot:103b}] run return 0

# mark trimmed armor
execute if data entity @s Inventory[{Slot:103b}].components."minecraft:trim" run item modify entity @s armor.head trim:trim_abilities_tag
execute if data entity @s Inventory[{Slot:102b}].components."minecraft:trim" run item modify entity @s armor.chest trim:trim_abilities_tag
execute if data entity @s Inventory[{Slot:101b}].components."minecraft:trim" run item modify entity @s armor.legs trim:trim_abilities_tag
execute if data entity @s Inventory[{Slot:100b}].components."minecraft:trim" run item modify entity @s armor.feet trim:trim_abilities_tag

#  full set
execute if data entity @s Inventory[{Slot:100b}].components."minecraft:trim" if data entity @s Inventory[{Slot:101b}].components."minecraft:trim" if data entity @s Inventory[{Slot:102b}].components."minecraft:trim" if data entity @s Inventory[{Slot:103b}].components."minecraft:trim" run function trim:update_trim_ability/u_t_a_full_armor
execute if data entity @s Inventory[{Slot:100b}].components."minecraft:trim" if data entity @s Inventory[{Slot:101b}].components."minecraft:trim" if data entity @s Inventory[{Slot:102b}].components."minecraft:trim" if data entity @s Inventory[{Slot:103b}].components."minecraft:trim" run return 0

#  single
data modify storage trim_abilities:player_armor boots set string entity @s Inventory[{Slot:100b}].components."minecraft:trim".pattern 10
data modify storage trim_abilities:player_armor leggings set string entity @s Inventory[{Slot:101b}].components."minecraft:trim".pattern 10
data modify storage trim_abilities:player_armor chestplate set string entity @s Inventory[{Slot:102b}].components."minecraft:trim".pattern 10
data modify storage trim_abilities:player_armor helmet set string entity @s Inventory[{Slot:103b}].components."minecraft:trim".pattern 10
execute if data entity @s Inventory[{Slot:100b}].components."minecraft:trim" run function trim:update_trim_ability/u_t_a_boots with storage trim_abilities:player_armor
execute if data entity @s Inventory[{Slot:101b}].components."minecraft:trim" run function trim:update_trim_ability/u_t_a_leggings with storage trim_abilities:player_armor
execute if data entity @s Inventory[{Slot:102b}].components."minecraft:trim" run function trim:update_trim_ability/u_t_a_chestplate with storage trim_abilities:player_armor
execute if data entity @s Inventory[{Slot:103b}].components."minecraft:trim" run function trim:update_trim_ability/u_t_a_helmet with storage trim_abilities:player_armor
