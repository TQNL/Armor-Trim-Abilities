# new way of doing the update as oposed to previous versions to cull the amount of calls per tick by the advancement, was causing a loop and proved unpatchable
execute as @a[tag=trim.update_next] run function trim:update_trim_ability/update_trim_ability

# detect and update throwing of armor or deaths
execute as @e[type=item,nbt={PickupDelay:40s,Item:{components:{"minecraft:custom_data":{trim_abilities_custom_item:1b}}}}] on origin at @s run function trim:update_trim_ability/update_trim_ability
execute as @e[type=item] at @s if data entity @s Item.components."minecraft:trim" if block ~ ~-1 ~ grindstone run function trim:update_trim_ability/grindstone
execute as @a[scores={trim.deaths=1..}] at @s run function trim:update_trim_ability/update_trim_ability

# trigger ability
scoreboard players enable @a trim.update
execute as @a[scores={trim.update=1..}] at @s run function trim:update_trim_ability/update_trim_ability
scoreboard players reset @a[scores={trim.update=1..}] trim.update

# powers: only execute if the player has the proper tag!

#  eye
execute as @e[type=ender_pearl,tag=!trim.assessed,nbt={Item:{components:{"minecraft:custom_data":{trim_abilities_unender_pearl:1b}}}}] at @s on origin run function trim:pearl_helper

# coast
execute as @a[tag=trim.single.coast,advancements={trim:trim_abilities/boating=true}] at @s if block ~ ~-1 ~ water[level=0] run function trim:single/coast/1
execute as @a[tag=trim.full_set.coast.got_looting] run function trim:full_set/coast/looting_remove
execute at @a[tag=trim.full_set.coast] as @e[type=item,nbt={Age:0s,PickupDelay:10s},distance=..4.5] at @s run function trim:full_set/coast/fortune
execute as @a[scores={trim.trial_pot=1..}] at @s run function trim:full_set/coast/loot/pot
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{trial_pot:1b}}}}] run data remove entity @s Item.components."minecraft:custom_data"

# dune (full set)
execute as @a[tag=trim.full_set.dune] unless data entity @s RootVehicle at @s run function trim:full_set/dune/explode

# rib
execute at @a[tag=trim.single.rib] as @e[distance=1..5,nbt={Brain:{}}] at @s on attacker as @n unless entity @s[nbt={active_effects:[{id:"minecraft:wither"}]}] run effect give @s wither 10 0 false
execute at @a[tag=trim.full_set.rib] as @e[distance=1..5,nbt={Brain:{}}] at @s on attacker as @n unless entity @s[nbt={active_effects:[{id:"minecraft:unluck",amplifier:84b},{id:"minecraft:luck",amplifier:23b}]}] run function trim:full_set/rib/afflict
execute as @a[tag=trim.full_set.rib] run function trim:full_set/rib/benefit
execute at @a[tag=trim.full_set.rib] as @e[type=#arrows,distance=..2] at @s on origin as @n[type=#arrows] unless entity @s[nbt=!{Fire:-1s}] run data merge entity @s {Fire:2000s}
execute at @a[tag=trim.full_set.rib] as @a[distance=1..6,nbt={active_effects:[{id:"minecraft:wither",duration:190}]}] at @s run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 air replace fire

# sentry
execute as @a[tag=trim.single.sentry,nbt={SelectedItem:{id:"minecraft:goat_horn",components:{"minecraft:custom_data":{trim_abilities_pillager_war_horn:1b}}}},scores={trim.pillager_summon=1..}] run function trim:single/sentry/patrol
execute as @e[tag=trim.sentry.kill_check] at @s on target if entity @s[type=player] as @e[tag=trim.sentry.kill_check,distance=..1] run tp @s ~ -128 ~

# silence
execute as @e[type=arrow,nbt={inGround:0b}] at @s on origin if entity @s[tag=trim.full_set.silence,nbt={SelectedItem:{id:"minecraft:bow",components:{"minecraft:custom_data":{trim_abilities_sonic_boom:1b}}}}] as @n[type=arrow] run function trim:full_set/silence/boom

# snout
execute as @e[type=piglin,tag=!smithed.entity,nbt=!{NoAI:1b}] at @s unless entity @e[tag=trim.piglin_passive_timer,distance=..1] on target if entity @s[tag=trim.snout] as @n[type=piglin,tag=!smithed.entity] run function trim:single/snout/passify
execute at @e[tag=trim.piglin_passive_timer,nbt={Age:199}] as @n[type=piglin,tag=!smithed.entity] run data merge entity @s {NoAI:0b}
execute as @e[type=piglin,tag=!smithed.entity,nbt={Brain:{memories:{"minecraft:admiring_item":{ttl:119L}}},equipment:{offhand:{id:"minecraft:gold_block",count:1}}}] if entity @p[tag=trim.full_set.snout,tag=!trim.gold_block_batering] run tag @s add trim.gold_block_batering
execute as @e[type=piglin,tag=trim.gold_block_batering,tag=!smithed.entity,nbt={Brain:{memories:{"minecraft:admiring_item":{ttl:0L}}},equipment:{offhand:{id:"minecraft:gold_block",count:1}}}] at @s run function trim:full_set/snout/gold_block
execute as @e[type=piglin,tag=!smithed.entity,nbt={equipment:{offhand:{id:"minecraft:gold_block",count:1}},NoAI:1b}] run data merge entity @s {NoAI:0b}

# spire: changing the potion to a marker effect here to let the item display properly
execute as @e[type=splash_potion,nbt={Item:{components:{"minecraft:custom_data":{trim_abilities_potion_of_levitation:1b}}}}] if data entity @s Item.components."minecraft:potion_contents".custom_effects[{id:"minecraft:levitation"}] run function trim:single/spire/potion/convert_to_marker
execute as @a if data entity @s active_effects[{id:"minecraft:luck",amplifier:104b}] if data entity @s active_effects[{id:"minecraft:unluck",amplifier:18b}] run function trim:single/spire/potion/dispatch

# wild (vex, ward & tide don't need ticked commands)
scoreboard players enable @a trim.panda_genes
execute as @a[tag=trim.single.wild,scores={trim.panda_genes=1..}] at @s run function trim:single/wild/panda

# wayfinder
scoreboard players enable @a trim.find_way
execute as @a[tag=trim.single.wayfinder,scores={trim.find_way=1..}] at @s run function trim:single/wayfinder/find1

# raiser
execute at @a[tag=trim.single.raiser] as @e[type=villager,tag=!smithed.entity,nbt={RestocksToday:2},distance=..32] run function trim:single/raiser/restock

# shaper
scoreboard players enable @a trim.get_bundle
execute as @a[scores={trim.get_bundle=1..}] if entity @s[tag=trim.single.shaper] run give @s bundle
scoreboard players reset @a[scores={trim.get_bundle=1..}] trim.get_bundle

# ascendant & host don't need ticked commands

# flow
execute as @e[type=horse,tag=trim.full_set.flow.wind_ball] at @s on passengers if entity @s[type=player] run tag @n[type=horse,tag=trim.full_set.flow.wind_ball] add trim.full_set.flow.dont_kill
execute as @e[type=horse,tag=trim.full_set.flow.wind_ball,tag=!trim.full_set.flow.dont_kill] at @s unless entity @p[distance=..1] run tp @s ~ ~-200 ~
## added @p check to make sure the player within 1 block (aka riding it) doesnt tp with
tag @e[type=horse,tag=trim.full_set.flow.wind_ball] remove trim.full_set.flow.dont_kill
## kill block display + make the model follow the vehicle which broke in 1.21.5
execute as @e[type=horse,tag=trim.full_set.flow.wind_ball] at @s run function trim:full_set/flow/ride_display
execute as @e[type=block_display,tag=trim.full_set.flow.wind_ball.display] at @s run function trim:full_set/flow/kill_display

clear @a[tag=trim.full_set.flow] saddle[minecraft:custom_data~{trim_flow_saddle:1b}]
execute as @a[tag=trim.full_set.flow] on vehicle if entity @s[type=horse,tag=trim.full_set.flow.wind_ball] unless items entity @s saddle saddle[minecraft:custom_data~{trim_flow_saddle:1b}] run item replace entity @s saddle with saddle[minecraft:custom_data={trim_flow_saddle:1b}]
execute as @a[tag=trim.full_set.flow] at @s on vehicle if items entity @s armor.body * on owner run item replace entity @s player.cursor from entity @n[type=horse,tag=trim.full_set.flow.wind_ball] armor.body
execute as @a[tag=trim.full_set.flow] at @s on vehicle if items entity @s armor.body * run item replace entity @s armor.body with air
execute as @e[type=block_display,tag=trim.full_set.flow.wind_ball.display] at @s run rotate @s ~5 ~

# bolt
## these items are meant as selection items for the grid (throwing gets detected at the beginning)
execute as @a[tag=trim.full_set.bolt] at @s if items entity @s container.* *[custom_data~{trim_abilities_bolting:1b}] run clear @s *[custom_data~{trim_abilities_bolting:1b}]
execute as @a[tag=trim.full_set.bolt] at @s if items entity @s weapon.offhand *[custom_data~{trim_abilities_bolting:1b}] run clear @s *[custom_data~{trim_abilities_bolting:1b}]

## detect item
execute as @a[tag=trim.full_set.bolt,tag=!trim.bolting] at @s if items entity @s player.crafting.0 * run function trim:full_set/bolt/copper_bolting/1 {slot:0}
execute as @a[tag=trim.full_set.bolt,tag=!trim.bolting] at @s if items entity @s player.crafting.1 * run function trim:full_set/bolt/copper_bolting/1 {slot:1}
execute as @a[tag=trim.full_set.bolt,tag=!trim.bolting] at @s if items entity @s player.crafting.2 * run function trim:full_set/bolt/copper_bolting/1 {slot:2}
execute as @a[tag=trim.full_set.bolt,tag=!trim.bolting] at @s if items entity @s player.crafting.3 * run function trim:full_set/bolt/copper_bolting/1 {slot:3}

## activate options - fullproof and gets you out of soft lock when closing the inventory
execute as @a[tag=trim.full_set.bolt,tag=trim.bolting] at @s run function trim:full_set/bolt/copper_bolting/activate
