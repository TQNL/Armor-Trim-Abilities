# Uninstall Armor Trim Abilities from the current world.
# This removes pack-created entities, player runtime state, storage values and scoreboard objectives.
tellraw @a {"text":"Uninstalling Armor Trim Abilities...","color":"#FFAA00"}

# Clear scheduled functions from abilities.
schedule clear trim:single/dune/saturation
schedule clear trim:single/silence/inflict_warden_power

# Per-player cleanup while scoreboards still exist.
execute as @a at @s run function trim:uninstall/player

# Remove pack-created loose items and technical/custom entities.
kill @e[type=item,nbt={PickupDelay:40s,Item:{components:{"minecraft:custom_data":{trim_abilities_custom_item:1b}}}}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{vault_loot_placeholder:1b}}}}]
kill @e[tag=trim.item_placeholder]
kill @e[tag=trim.full_set.flow.wind_ball]
kill @e[tag=trim.full_set.flow.wind_ball.display]
kill @e[tag=trim.sentry]
kill @e[tag=trim.piglin_passive_timer]
kill @e[tag=trim.ward_xp]
kill @e[tag=trim.find_way_command]
kill @e[tag=trim.block_id_shaper]

# Remove any remaining old technical entities from pre-migration worlds.
kill @e[tag=full_set_flow_wind_ball]
kill @e[tag=full_set_flow_wind_ball_display]
kill @e[tag=full_set_flow_dont_kill]
kill @e[tag=sentry_trim]
kill @e[tag=sentry_trim_kill_check]
kill @e[tag=trim_piglin_passive_timer]
kill @e[tag=trim_ward_xp]
kill @e[tag=trim_find_way_command]
kill @e[tag=trim_assessed]
kill @e[tag=trim_gold_block_batering]
kill @e[tag=trim_block_id_shaper]
kill @e[tag=trim_abilities_item_placeholder]
kill @e[tag=trim_abilities_bolting]
kill @e[tag=trim_boomer]
kill @e[tag=trim_explosive]
kill @e[tag=trim_inspired]
kill @e[tag=trim_got_item]

# Clear storage keys used by the pack.
data remove storage trim_abilities:copper_bolting root
data remove storage trim_abilities:coast_armor fortune_level
data remove storage trim_abilities:loottables chest
data remove storage trim_abilities:loottables vault
data remove storage trim_abilities:loottables sus_block
data remove storage trim_abilities:player_armor boots
data remove storage trim_abilities:player_armor leggings
data remove storage trim_abilities:player_armor chestplate
data remove storage trim_abilities:player_armor helmet
data remove storage trim_abilities:player_armor trim
data remove storage trim_abilities:reset_armor item
data remove storage trim_abilities:wayfinder root
data remove storage trim_abilities:wayfinder command
data remove storage trim_abilities:wayfinder check_locate
data remove storage trim_abilities:wayfinder check_succes
data remove storage trim_abilities:wayfinder distance_magnitude
data remove storage trim_abilities:wayfinder distance
data remove storage operator_block_chooser:choose_block coords

# Remove scoreboard objectives last.
scoreboard objectives remove trim.update
scoreboard objectives remove trim.compare1
scoreboard objectives remove trim.compare2
scoreboard objectives remove trim.compare3
scoreboard objectives remove trim.deaths
scoreboard objectives remove trim.pickaxe_slot
scoreboard objectives remove trim.math1
scoreboard objectives remove trim.motion1
scoreboard objectives remove trim.motion1_spire
scoreboard objectives remove trim.pillager_summon
scoreboard objectives remove trim.coin_flip
scoreboard objectives remove trim.panda_genes
scoreboard objectives remove trim.locate_test
scoreboard objectives remove trim.find_way
scoreboard objectives remove trim.daytime
scoreboard objectives remove trim.get_bundle
scoreboard objectives remove trim.trial_pot
scoreboard objectives remove trim.flow_slot
scoreboard objectives remove trim.bolt_slot
scoreboard objectives remove trim.flag
scoreboard objectives remove trim.coast
scoreboard objectives remove update_trim_ability
scoreboard objectives remove compare_armor1
scoreboard objectives remove compare_armor2
scoreboard objectives remove compare_armor3
scoreboard objectives remove trim_deaths
scoreboard objectives remove pickaxe_slot
scoreboard objectives remove trim_math1
scoreboard objectives remove trim_motion1
scoreboard objectives remove trim_motion1_spire
scoreboard objectives remove pillager_summon
scoreboard objectives remove trim_coin_flip
scoreboard objectives remove panda_genes
scoreboard objectives remove locate_test
scoreboard objectives remove find_way
scoreboard objectives remove trim_daytime
scoreboard objectives remove get_bundle
scoreboard objectives remove trial_pot_broken
scoreboard objectives remove trim_flow_slot
scoreboard objectives remove trim_bolt_slot
scoreboard objectives remove trim_flag
scoreboard objectives remove trim_coast

tellraw @a {"text":"Armor Trim Abilities uninstall cleanup finished. You can now remove the datapack and /reload.","color":"#00FF00"}
