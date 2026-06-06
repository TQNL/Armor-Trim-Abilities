tag @s add trim.full_set.flow

function trim:single/flow/got
tag @s remove trim.single.flow

summon horse ~ ~ ~ {Silent:1b,Invulnerable:1b,Tame:1b,Variant:512,Tags:["trim.full_set.flow.wind_ball","smithed.entity"],active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b}],attributes:[{id:"minecraft:jump_strength",base:1},{id:"minecraft:max_health",base:40},{id:"minecraft:movement_speed",base:0.3375}],equipment:{saddle:{id:"minecraft:saddle",count:1,components:{"minecraft:custom_data":{trim_flow_saddle:1b},"minecraft:equippable":{slot:"saddle",asset_id:"empty",allowed_entities:["minecraft:block_display","minecraft:player"]}}}}}
ride @s mount @n[type=horse,tag=trim.full_set.flow.wind_ball]
summon block_display ~ ~ ~ {Tags:["trim.full_set.flow.wind_ball.display","smithed.entity","smithed.strict"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.75f,-1.5f,-0.75f],scale:[1.5f,1.5f,1.5f]},block_state:{Name:"minecraft:white_stained_glass"}}
ride @n[type=block_display,tag=trim.full_set.flow.wind_ball.display] mount @n[type=horse,tag=trim.full_set.flow.wind_ball]
data modify entity @n[type=horse,tag=trim.full_set.flow.wind_ball] Owner set from entity @s UUID
