advancement revoke @s through trim:trim_abilities/root
scoreboard players reset @s trim_deaths
schedule clear trim:single/dune/saturation
schedule clear trim:single/silence/inflict_warden_power

# clean up
kill @e[type=item,nbt={PickupDelay:40s,Item:{tag:{trimdatapack:1b}}}]
kill @e[type=item,nbt={PickupDelay:40s,Item:{tag:{sentry_trim:1b}}}]
kill @e[type=item,nbt={PickupDelay:40s,Item:{tag:{spire_trim:1b}}}]
kill @e[type=item,nbt={PickupDelay:40s,Item:{tag:{silence_trim:1b}}}]
kill @e[type=item,nbt={PickupDelay:40s,Item:{tag:{trim_sentry_crossbow:1b}}}]
clear @s ender_pearl{display:{Name:'{"text":"Unender Pearl","italic":false}'},trimdatapack:1b,Enchantments:[{}]}
clear @s goat_horn{sentry_trim:1b}
clear @s splash_potion{spire_trim:1b}
clear @s bow{silence_trim:1b}
clear @s crossbow{trim_sentry_crossbow:1b}
execute if entity @s[tag=single_vex] run effect clear @s jump_boost
execute if entity @s[tag=single_vex] run effect clear @s slow_falling
execute if entity @s[tag=full_set_ward] run effect clear @s haste
execute if entity @s[tag=single_host] run effect clear @s hero_of_the_village
execute if entity @s[tag=single_tide] run effect clear @s water_breathing
execute if entity @s[tag=full_set_tide] run effect clear @s water_breathing
execute if entity @s[tag=full_set_tide] run effect clear @s dolphins_grace
execute if entity @s[tag=full_set_tide] run effect clear @s conduit_power
execute if entity @s[tag=single_shaper] run kill @e[tag=trim_block_id_shaper,sort=nearest,limit=1]

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
execute if data entity @s Inventory[{Slot:103b}].tag.Trim run item modify entity @s armor.head trim:trim_abilities_tag
execute if data entity @s Inventory[{Slot:102b}].tag.Trim run item modify entity @s armor.chest trim:trim_abilities_tag
execute if data entity @s Inventory[{Slot:101b}].tag.Trim run item modify entity @s armor.legs trim:trim_abilities_tag
execute if data entity @s Inventory[{Slot:100b}].tag.Trim run item modify entity @s armor.feet trim:trim_abilities_tag

#  full set
execute if data entity @s Inventory[{Slot:100b}].tag.Trim if data entity @s Inventory[{Slot:101b}].tag.Trim if data entity @s Inventory[{Slot:102b}].tag.Trim if data entity @s Inventory[{Slot:103b}].tag.Trim run function trim:update_trim_ability/u_t_a_full_armor
execute if data entity @s Inventory[{Slot:100b}].tag.Trim if data entity @s Inventory[{Slot:101b}].tag.Trim if data entity @s Inventory[{Slot:102b}].tag.Trim if data entity @s Inventory[{Slot:103b}].tag.Trim run return 0

#  single
data modify storage trim_abilities:player_armor boots set string entity @s Inventory[{Slot:100b}].tag.Trim.pattern 10
data modify storage trim_abilities:player_armor leggings set string entity @s Inventory[{Slot:101b}].tag.Trim.pattern 10
data modify storage trim_abilities:player_armor chestplate set string entity @s Inventory[{Slot:102b}].tag.Trim.pattern 10
data modify storage trim_abilities:player_armor helmet set string entity @s Inventory[{Slot:103b}].tag.Trim.pattern 10
execute if data entity @s Inventory[{Slot:100b}].tag.Trim run function trim:update_trim_ability/u_t_a_boots with storage trim_abilities:player_armor
execute if data entity @s Inventory[{Slot:101b}].tag.Trim run function trim:update_trim_ability/u_t_a_leggings with storage trim_abilities:player_armor
execute if data entity @s Inventory[{Slot:102b}].tag.Trim run function trim:update_trim_ability/u_t_a_chestplate with storage trim_abilities:player_armor
execute if data entity @s Inventory[{Slot:103b}].tag.Trim run function trim:update_trim_ability/u_t_a_helmet with storage trim_abilities:player_armor
