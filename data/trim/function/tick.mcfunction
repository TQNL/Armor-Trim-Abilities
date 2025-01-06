# detect and update throwing of armor or deaths
execute as @e[type=item,nbt={PickupDelay:40s,Item:{components:{"minecraft:custom_data":{trim_abilities_custom_item:1b}}}}] on origin at @s run function trim:update_trim_ability/update_trim_ability
execute as @e[type=item] at @s if data entity @s Item.components."minecraft:trim" if block ~ ~-1 ~ grindstone run function trim:update_trim_ability/grindstone
execute as @a[scores={trim_deaths=1..}] at @s run function trim:update_trim_ability/update_trim_ability

# trigger ability
scoreboard players enable @a update_trim_ability
execute as @a[scores={update_trim_ability=1..}] at @s run function trim:update_trim_ability/update_trim_ability
scoreboard players reset @a[scores={update_trim_ability=1..}] update_trim_ability

# powers: only execute if the player has the proper tag!

#  eye
execute as @e[type=ender_pearl,nbt={Item:{components:{"minecraft:custom_data":{trim_abilities_unender_pearl:1b}}}}] at @s unless items entity @p hotbar.* ender_pearl[minecraft:custom_data~{trim_abilities_unender_pearl:1b}] unless items entity @p inventory.* ender_pearl[minecraft:custom_data~{trim_abilities_unender_pearl:1b}] if entity @p[tag=single_eye] run give @p ender_pearl[enchantment_glint_override=1b,custom_name='{"text":"Unender Pearl","italic":false}',custom_data={trim_abilities_custom_item:1b,trim_abilities_unender_pearl:1b}]
execute as @e[type=ender_pearl,nbt={Item:{components:{"minecraft:custom_data":{trim_abilities_unender_pearl:1b}}}}] at @s unless items entity @p hotbar.* ender_pearl[minecraft:custom_data~{trim_abilities_unender_pearl:1b}] unless items entity @p inventory.* ender_pearl[minecraft:custom_data~{trim_abilities_unender_pearl:1b}] if entity @p[tag=full_set_eye] run function trim:full_set/eye/1

# coast
execute as @a[tag=single_coast,advancements={trim:trim_abilities/boating=true}] at @s if block ~ ~-1 ~ water[level=0] run function trim:single/coast/1
execute as @a[tag=full_set_coast_got_looting] run function trim:full_set/coast/looting_remove
execute as @e[type=item,nbt={Age:0s,PickupDelay:10s}] at @s if entity @p[tag=full_set_coast,distance=..4.5] run function trim:full_set/coast/fortune
execute as @a[scores={trial_pot_broken=1..}] at @s run function trim:full_set/coast/loot/pot
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{trial_pot:1b}}}}] run data remove entity @s Item.components."minecraft:custom_data"

# dune (full set)
execute as @a[tag=full_set_dune] unless data entity @s RootVehicle at @s run function trim:full_set/dune/explode

# rib
execute at @a[tag=single_rib] as @e[distance=1..5,nbt={Brain:{}}] at @s on attacker as @n unless entity @s[nbt={active_effects:[{id:"minecraft:wither"}]}] run effect give @s wither 10 0 false
execute at @a[tag=full_set_rib] as @e[distance=1..5,nbt={Brain:{}}] at @s on attacker as @n unless entity @s[nbt={active_effects:[{id:"minecraft:wither"}]}] run function trim:full_set/rib/afflict
execute as @a[tag=full_set_rib] run function trim:full_set/rib/benefit
execute at @a[tag=full_set_rib] as @e[type=#arrows,distance=..2] at @s on origin as @n[type=#arrows] unless entity @s[nbt=!{Fire:-1s}] run data merge entity @s {Fire:2000s}
execute at @a[tag=full_set_rib] as @a[distance=1..6,nbt={active_effects:[{id:"minecraft:wither",duration:190}]}] at @s run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 air replace fire

# sentry
execute as @a[tag=single_sentry,nbt={SelectedItem:{id:"minecraft:goat_horn",components:{"minecraft:custom_data":{trim_abilities_pillager_war_horn:1b}}}},scores={pillager_summon=1..}] run function trim:single/sentry/patrol
execute as @e[tag=sentry_trim_kill_check] at @s on target if entity @s[type=player] as @e[tag=sentry_trim_kill_check,distance=..1] run tp @s ~ -128 ~

# silence
execute as @e[type=arrow,nbt={inGround:0b}] at @s on origin if entity @s[tag=full_set_silence,nbt={SelectedItem:{id:"minecraft:bow",components:{"minecraft:custom_data":{trim_abilities_sonic_boom:1b}}}}] as @n[type=arrow] run function trim:full_set/silence/boom

# snout
execute as @e[type=piglin,nbt=!{NoAI:1b}] at @s unless entity @e[tag=trim_piglin_passive_timer,distance=..1] on target if entity @s[tag=trim_snout] as @n[type=piglin] run function trim:single/snout/passify
execute at @e[tag=trim_piglin_passive_timer,nbt={Age:199}] as @n[type=piglin] run data merge entity @s {NoAI:0b}
execute as @e[type=piglin,nbt={Brain:{memories:{"minecraft:admiring_item":{ttl:119L}}},HandItems:[{id:"minecraft:gold_block",count:1}]}] if entity @p[tag=full_set_snout,tag=!trim_gold_block_batering] run tag @s add trim_gold_block_batering
execute as @e[type=piglin,tag=trim_gold_block_batering,nbt={Brain:{memories:{"minecraft:admiring_item":{ttl:0L}}},HandItems:[{id:"minecraft:gold_block",count:1}]}] at @s run function trim:full_set/snout/gold_block

# spire
execute as @e[type=potion,nbt={Item:{components:{"minecraft:custom_data":{trim_abilities_potion_of_levitation:1b}}}},limit=1] at @s unless items entity @p hotbar.* splash_potion[minecraft:custom_data~{trim_abilities_potion_of_levitation:1b}] unless items entity @p inventory.* splash_potion[minecraft:custom_data~{trim_abilities_potion_of_levitation:1b}] if entity @p[tag=single_spire] run function trim:single/spire/potion
execute as @a[tag=trim_threw_levi_potion] if data entity @s {active_effects:[{show_icon:1b,id:"minecraft:levitation"}]} run function trim:single/spire/potion2
execute as @a[tag=trim_threw_levi_potion,nbt={active_effects:[{show_icon:0b,id:"minecraft:unluck",duration:1}]}] run tag @s remove trim_threw_levi_potion

# wild (vex, ward & tide don't need ticked commands)
scoreboard players enable @a panda_genes
execute as @a[tag=single_wild,scores={panda_genes=1..}] at @s run function trim:single/wild/panda

# wayfinder
scoreboard players enable @a find_way
execute as @a[tag=single_wayfinder,scores={find_way=1..}] at @s run function trim:single/wayfinder/find1

# raiser
execute at @a[tag=single_raiser] as @e[type=villager,nbt={RestocksToday:2},distance=..32] run function trim:single/raiser/restock

# shaper
scoreboard players enable @a get_bundle
execute as @a[scores={get_bundle=1..}] if entity @s[tag=single_shaper] run give @s bundle
scoreboard players reset @a[scores={get_bundle=1..}] get_bundle

# ascendant & host don't need ticked commands

# flow
execute as @e[type=horse,tag=full_set_flow_wind_ball] at @s on passengers if entity @s[type=player] run tag @n[type=horse,tag=full_set_flow_wind_ball] add full_set_flow_dont_kill
execute as @e[type=horse,tag=full_set_flow_wind_ball,tag=!full_set_flow_dont_kill] at @s run tp @s ~ ~-200 ~
tag @e[type=horse,tag=full_set_flow_wind_ball] remove full_set_flow_dont_kill
## kill block display
execute as @e[type=block_display,tag=full_set_flow_wind_ball_display] run function trim:full_set/flow/kill_display

clear @a[tag=full_set_flow] saddle[minecraft:custom_data~{trim_flow_saddle:1b}]
execute as @a[tag=full_set_flow] on vehicle if entity @s[type=horse,tag=full_set_flow_wind_ball] unless items entity @s horse.saddle saddle[minecraft:custom_data~{trim_flow_saddle:1b}] run item replace entity @s horse.saddle with saddle[minecraft:custom_data={trim_flow_saddle:1b}]
execute as @a[tag=full_set_flow] at @s on vehicle if items entity @s armor.body * on owner run item replace entity @s player.cursor from entity @n[type=horse,tag=full_set_flow_wind_ball] armor.body
execute as @a[tag=full_set_flow] at @s on vehicle if items entity @s armor.body * run item replace entity @s armor.body with air
execute as @e[type=block_display,tag=full_set_flow_wind_ball_display] at @s run tp @s ~ ~ ~ ~5 ~

# bolt
## these items are meant as selection items for the grid (throwing gets detected at the beginning)
execute as @a[tag=full_set_bolt] at @s if items entity @s inventory.* *[custom_data~{trim_abilities_bolting:1b}] run clear @s *[custom_data~{trim_abilities_bolting:1b}]
execute as @a[tag=full_set_bolt] at @s if items entity @s hotbar.* *[custom_data~{trim_abilities_bolting:1b}] run clear @s *[custom_data~{trim_abilities_bolting:1b}]
execute as @a[tag=full_set_bolt] at @s if items entity @s weapon.offhand *[custom_data~{trim_abilities_bolting:1b}] run clear @s *[custom_data~{trim_abilities_bolting:1b}]

## detect item
execute as @a[tag=full_set_bolt,tag=!trim_abilities_bolting] at @s if items entity @s player.crafting.0 * run function trim:full_set/bolt/copper_bolting/1 {slot:0}
execute as @a[tag=full_set_bolt,tag=!trim_abilities_bolting] at @s if items entity @s player.crafting.1 * run function trim:full_set/bolt/copper_bolting/1 {slot:1}
execute as @a[tag=full_set_bolt,tag=!trim_abilities_bolting] at @s if items entity @s player.crafting.2 * run function trim:full_set/bolt/copper_bolting/1 {slot:2}
execute as @a[tag=full_set_bolt,tag=!trim_abilities_bolting] at @s if items entity @s player.crafting.3 * run function trim:full_set/bolt/copper_bolting/1 {slot:3}

## activate options - fullproof and gets you out of soft lock when closing the inventory
execute as @a[tag=full_set_bolt,tag=trim_abilities_bolting] at @s run function trim:full_set/bolt/copper_bolting/activate
