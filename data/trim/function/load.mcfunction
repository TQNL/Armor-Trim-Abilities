tellraw @a {"text": "Loaded Armor Trim Abilities","color": "#00FF00"}
execute as @a at @s run function trim:update_trim_ability/update_trim_ability
scoreboard objectives add update_trim_ability trigger
scoreboard objectives add compare_armor1 dummy
scoreboard objectives add compare_armor2 dummy
scoreboard objectives add compare_armor3 dummy
scoreboard objectives add trim_deaths deathCount
scoreboard objectives add pickaxe_slot dummy
scoreboard objectives add trim_math1 dummy
scoreboard objectives add trim_motion1 dummy
scoreboard objectives add trim_motion1_spire dummy
scoreboard objectives add pillager_summon minecraft.used:minecraft.goat_horn
scoreboard objectives add trim_coin_flip dummy
scoreboard objectives add panda_genes trigger
scoreboard objectives add locate_test dummy
scoreboard objectives add find_way trigger
scoreboard objectives add trim_daytime dummy
scoreboard objectives add get_bundle trigger
scoreboard objectives add trial_pot_broken mined:decorated_pot
scoreboard objectives add trim_flow_slot dummy
scoreboard objectives add trim_bolt_slot dummy
scoreboard objectives add trim_flag dummy
