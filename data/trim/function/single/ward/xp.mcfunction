execute at @s run summon area_effect_cloud ~ ~ ~ {Tags:["trim_ward_xp"],WaitTime:2,Particle:{type:"block",block_state:"minecraft:air"}}
schedule function trim:single/ward/xp2 1t append
