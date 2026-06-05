execute at @s run summon area_effect_cloud ~ ~ ~ {Duration:0,Age:0,WaitTime:0,Radius:0f,Tags:["trim_ward_xp"],Particle:{type:"block",block_state:"minecraft:air"}}
schedule function trim:single/ward/xp2 1t append
