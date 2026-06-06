# Migration from pre-Smithed runtime tag names to trim.* names.
# Kept separate from normal ability update so old world/player data does not linger after /reload.
execute as @a[tag=full_set_ascendant] run tag @s add trim.full_set.ascendant
execute as @a[tag=full_set_bolt] run tag @s add trim.full_set.bolt
execute as @a[tag=full_set_coast] run tag @s add trim.full_set.coast
execute as @a[tag=full_set_dune] run tag @s add trim.full_set.dune
execute as @a[tag=full_set_eye] run tag @s add trim.full_set.eye
execute as @a[tag=full_set_flow] run tag @s add trim.full_set.flow
execute as @a[tag=full_set_rib] run tag @s add trim.full_set.rib
execute as @a[tag=full_set_sentry] run tag @s add trim.full_set.sentry
execute as @a[tag=full_set_silence] run tag @s add trim.full_set.silence
execute as @a[tag=full_set_snout] run tag @s add trim.full_set.snout
execute as @a[tag=full_set_spire] run tag @s add trim.full_set.spire
execute as @a[tag=full_set_tide] run tag @s add trim.full_set.tide
execute as @a[tag=full_set_vex] run tag @s add trim.full_set.vex
execute as @a[tag=full_set_ward] run tag @s add trim.full_set.ward
execute as @a[tag=full_set_wild] run tag @s add trim.full_set.wild
execute as @a[tag=single_bolt] run tag @s add trim.single.bolt
execute as @a[tag=single_coast] run tag @s add trim.single.coast
execute as @a[tag=single_dune] run tag @s add trim.single.dune
execute as @a[tag=single_eye] run tag @s add trim.single.eye
execute as @a[tag=single_flow] run tag @s add trim.single.flow
execute as @a[tag=single_host] run tag @s add trim.single.host
execute as @a[tag=single_raiser] run tag @s add trim.single.raiser
execute as @a[tag=single_rib] run tag @s add trim.single.rib
execute as @a[tag=single_sentry] run tag @s add trim.single.sentry
execute as @a[tag=single_shaper] run tag @s add trim.single.shaper
execute as @a[tag=single_silence] run tag @s add trim.single.silence
execute as @a[tag=single_snout] run tag @s add trim.single.snout
execute as @a[tag=single_spire] run tag @s add trim.single.spire
execute as @a[tag=single_tide] run tag @s add trim.single.tide
execute as @a[tag=single_vex] run tag @s add trim.single.vex
execute as @a[tag=single_ward] run tag @s add trim.single.ward
execute as @a[tag=single_wayfinder] run tag @s add trim.single.wayfinder
execute as @a[tag=single_wild] run tag @s add trim.single.wild
execute as @a[tag=trim_snout] run tag @s add trim.snout
execute as @a[tag=trim_update_next] run tag @s add trim.update_next
execute as @a[tag=full_set_coast_got_looting] run tag @s add trim.full_set.coast.got_looting
tag @a remove full_set_ascendant
tag @a remove full_set_bolt
tag @a remove full_set_coast
tag @a remove full_set_dune
tag @a remove full_set_eye
tag @a remove full_set_flow
tag @a remove full_set_rib
tag @a remove full_set_sentry
tag @a remove full_set_silence
tag @a remove full_set_snout
tag @a remove full_set_spire
tag @a remove full_set_tide
tag @a remove full_set_vex
tag @a remove full_set_ward
tag @a remove full_set_wild
tag @a remove single_bolt
tag @a remove single_coast
tag @a remove single_dune
tag @a remove single_eye
tag @a remove single_flow
tag @a remove single_host
tag @a remove single_raiser
tag @a remove single_rib
tag @a remove single_sentry
tag @a remove single_shaper
tag @a remove single_silence
tag @a remove single_snout
tag @a remove single_spire
tag @a remove single_tide
tag @a remove single_vex
tag @a remove single_ward
tag @a remove single_wayfinder
tag @a remove single_wild
tag @a remove trim_snout
tag @a remove trim_update_next
tag @a remove full_set_coast_got_looting

# Clean or migrate old technical/entity tags that can remain in loaded chunks.
execute as @e[tag=full_set_flow_wind_ball] run tag @s add trim.full_set.flow.wind_ball
tag @e[tag=full_set_flow_wind_ball] remove full_set_flow_wind_ball
execute as @e[tag=full_set_flow_wind_ball_display] run tag @s add trim.full_set.flow.wind_ball.display
tag @e[tag=full_set_flow_wind_ball_display] remove full_set_flow_wind_ball_display
execute as @e[tag=full_set_flow_dont_kill] run tag @s add trim.full_set.flow.dont_kill
tag @e[tag=full_set_flow_dont_kill] remove full_set_flow_dont_kill
execute as @e[tag=sentry_trim] run tag @s add trim.sentry
tag @e[tag=sentry_trim] remove sentry_trim
execute as @e[tag=sentry_trim_kill_check] run tag @s add trim.sentry.kill_check
tag @e[tag=sentry_trim_kill_check] remove sentry_trim_kill_check
execute as @e[tag=trim_piglin_passive_timer] run tag @s add trim.piglin_passive_timer
tag @e[tag=trim_piglin_passive_timer] remove trim_piglin_passive_timer
execute as @e[tag=trim_ward_xp] run tag @s add trim.ward_xp
tag @e[tag=trim_ward_xp] remove trim_ward_xp
execute as @e[tag=trim_find_way_command] run tag @s add trim.find_way_command
tag @e[tag=trim_find_way_command] remove trim_find_way_command
execute as @e[tag=trim_assessed] run tag @s add trim.assessed
tag @e[tag=trim_assessed] remove trim_assessed
execute as @e[tag=trim_gold_block_batering] run tag @s add trim.gold_block_batering
tag @e[tag=trim_gold_block_batering] remove trim_gold_block_batering
execute as @e[tag=trim_block_id_shaper] run tag @s add trim.block_id_shaper
tag @e[tag=trim_block_id_shaper] remove trim_block_id_shaper
execute as @e[tag=trim_abilities_item_placeholder] run tag @s add trim.item_placeholder
tag @e[tag=trim_abilities_item_placeholder] remove trim_abilities_item_placeholder
execute as @e[tag=trim_abilities_bolting] run tag @s add trim.bolting
tag @e[tag=trim_abilities_bolting] remove trim_abilities_bolting
execute as @e[tag=trim_boomer] run tag @s add trim.boomer
tag @e[tag=trim_boomer] remove trim_boomer
execute as @e[tag=trim_explosive] run tag @s add trim.explosive
tag @e[tag=trim_explosive] remove trim_explosive
execute as @e[tag=trim_inspired] run tag @s add trim.inspired
tag @e[tag=trim_inspired] remove trim_inspired
execute as @e[tag=trim_got_item] run tag @s add trim.got_item
tag @e[tag=trim_got_item] remove trim_got_item
