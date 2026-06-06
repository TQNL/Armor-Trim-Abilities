tellraw @a {"text": "Loaded Armor Trim Abilities","color": "#00FF00"}

# Scoreboards
scoreboard objectives add trim.update trigger
scoreboard objectives add trim.compare1 dummy
scoreboard objectives add trim.compare2 dummy
scoreboard objectives add trim.compare3 dummy
scoreboard objectives add trim.deaths deathCount
scoreboard objectives add trim.pickaxe_slot dummy
scoreboard objectives add trim.math1 dummy
scoreboard objectives add trim.motion1 dummy
scoreboard objectives add trim.motion1_spire dummy
scoreboard objectives add trim.pillager_summon minecraft.used:minecraft.goat_horn
scoreboard objectives add trim.coin_flip dummy
scoreboard objectives add trim.panda_genes trigger
scoreboard objectives add trim.locate_test dummy
scoreboard objectives add trim.find_way trigger
scoreboard objectives add trim.daytime dummy
scoreboard objectives add trim.get_bundle trigger
scoreboard objectives add trim.trial_pot mined:decorated_pot
scoreboard objectives add trim.flow_slot dummy
scoreboard objectives add trim.bolt_slot dummy
scoreboard objectives add trim.flag dummy
scoreboard objectives add trim.coast dummy

# Migration from older pack internals
function trim:migration/tags

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

# Re-evaluate players after migration and install/reload.
execute as @a at @s run function trim:update_trim_ability/update_trim_ability

# remove old:
data remove storage trim_abilities:wayfinder command
data remove storage trim_abilities:wayfinder check_locate
data remove storage trim_abilities:wayfinder check_succes
data remove storage trim_abilities:wayfinder distance_magnitude
data remove storage trim_abilities:wayfinder distance
