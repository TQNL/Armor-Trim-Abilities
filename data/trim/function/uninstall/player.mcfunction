# Per-player cleanup for Armor Trim Abilities uninstall. Run by trim:uninstall.
advancement revoke @s through trim:trim_abilities/root
scoreboard players reset @s trim.update
scoreboard players reset @s trim.deaths
scoreboard players reset @s trim.get_bundle
scoreboard players reset @s trim.find_way
scoreboard players reset @s trim.panda_genes

# Clear effects this pack can keep active. These are guarded by ability tags where possible.
execute if entity @s[tag=trim.single.vex] run effect clear @s jump_boost
execute if entity @s[tag=trim.single.vex] run effect clear @s slow_falling
execute if entity @s[tag=trim.full_set.coast] run effect clear @s luck
execute if entity @s[tag=trim.full_set.ward] run effect clear @s haste
execute if entity @s[tag=trim.single.host] run effect clear @s hero_of_the_village
execute if entity @s[tag=trim.single.tide] run effect clear @s water_breathing
execute if entity @s[tag=trim.full_set.tide] run effect clear @s water_breathing
execute if entity @s[tag=trim.full_set.tide] run effect clear @s dolphins_grace
execute if entity @s[tag=trim.full_set.tide] run effect clear @s conduit_power

# Reset modified movement/ride state.
execute if entity @s[tag=trim.full_set.flow] run ride @s dismount
execute if entity @s[tag=trim.full_set.wild] run attribute @s step_height base set 0.6
execute if entity @s[tag=trim.full_set.wild] run attribute @s gravity base set 0.08
execute if entity @s[tag=trim.full_set.wild] run attribute @s safe_fall_distance base set 3

# Remove custom items and best-effort reset armor component edits.
clear @s *[minecraft:custom_data~{trim_abilities_custom_item:1b}]
execute if items entity @s container.* *[custom_data~{trim_abilities:1b}] at @s run function trim:single/flow/reset_flow_armor {slot_type:"container."}
execute if items entity @s weapon.offhand *[custom_data~{trim_abilities:1b}] at @s run function trim:single/flow/reset_flow_armor {slot_type:"weapon."}
execute if items entity @s container.* *[custom_data~{trim_abilities:1b}] at @s run function trim:single/bolt/reset_bolt_armor {slot_type:"container."}
execute if items entity @s weapon.offhand *[custom_data~{trim_abilities:1b}] at @s run function trim:single/bolt/reset_bolt_armor {slot_type:"weapon."}

# Remove runtime tags.
tag @s remove trim.full_set.ascendant
tag @s remove trim.full_set.bolt
tag @s remove trim.full_set.coast
tag @s remove trim.full_set.dune
tag @s remove trim.full_set.eye
tag @s remove trim.full_set.flow
tag @s remove trim.full_set.rib
tag @s remove trim.full_set.sentry
tag @s remove trim.full_set.silence
tag @s remove trim.full_set.snout
tag @s remove trim.full_set.spire
tag @s remove trim.full_set.tide
tag @s remove trim.full_set.vex
tag @s remove trim.full_set.ward
tag @s remove trim.full_set.wild
tag @s remove trim.single.bolt
tag @s remove trim.single.coast
tag @s remove trim.single.dune
tag @s remove trim.single.eye
tag @s remove trim.single.flow
tag @s remove trim.single.host
tag @s remove trim.single.raiser
tag @s remove trim.single.rib
tag @s remove trim.single.sentry
tag @s remove trim.single.shaper
tag @s remove trim.single.silence
tag @s remove trim.single.snout
tag @s remove trim.single.spire
tag @s remove trim.single.tide
tag @s remove trim.single.vex
tag @s remove trim.single.ward
tag @s remove trim.single.wayfinder
tag @s remove trim.single.wild
tag @s remove trim.snout
tag @s remove trim.update_next
tag @s remove trim.full_set.coast.got_looting
tag @s remove trim.bolting
tag @s remove trim.boomer
tag @s remove trim.explosive
tag @s remove trim.inspired
tag @s remove trim.gold_block_batering
tag @s remove full_set_ascendant
tag @s remove full_set_bolt
tag @s remove full_set_coast
tag @s remove full_set_dune
tag @s remove full_set_eye
tag @s remove full_set_flow
tag @s remove full_set_rib
tag @s remove full_set_sentry
tag @s remove full_set_silence
tag @s remove full_set_snout
tag @s remove full_set_spire
tag @s remove full_set_tide
tag @s remove full_set_vex
tag @s remove full_set_ward
tag @s remove full_set_wild
tag @s remove single_bolt
tag @s remove single_coast
tag @s remove single_dune
tag @s remove single_eye
tag @s remove single_flow
tag @s remove single_host
tag @s remove single_raiser
tag @s remove single_rib
tag @s remove single_sentry
tag @s remove single_shaper
tag @s remove single_silence
tag @s remove single_snout
tag @s remove single_spire
tag @s remove single_tide
tag @s remove single_vex
tag @s remove single_ward
tag @s remove single_wayfinder
tag @s remove single_wild
tag @s remove trim_snout
tag @s remove trim_update_next
tag @s remove full_set_coast_got_looting
