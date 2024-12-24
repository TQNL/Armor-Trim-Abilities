tag @s add full_set_flow

function trim:single/flow/got
tag @s remove single_flow

summon horse ~ ~ ~ {Silent:1b,Invulnerable:1b,Tame:1b,Variant:512,Tags:["full_set_flow_wind_ball"],active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b}],attributes:[{id:"minecraft:generic.jump_strength",base:1},{id:"minecraft:generic.max_health",base:40},{id:"minecraft:generic.movement_speed",base:0.3375}],SaddleItem:{id:"minecraft:saddle",Count:1b,components:{"minecraft:custom_data":{trim_flow_saddle:1b}}}}
ride @s mount @n[type=horse,tag=full_set_flow_wind_ball]
summon block_display ~ ~ ~ {Tags:["full_set_flow_wind_ball_display"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.75f,-1.5f,-0.75f],scale:[1.5f,1.5f,1.5f]},block_state:{Name:"minecraft:white_stained_glass"}}
ride @n[type=block_display,tag=full_set_flow_wind_ball_display] mount @n[type=horse,tag=full_set_flow_wind_ball]
data modify entity @n[type=horse,tag=full_set_flow_wind_ball] Owner set from entity @s UUID
