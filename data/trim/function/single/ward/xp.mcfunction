execute at @s run summon area_effect_cloud ~ ~ ~ {Tags:["trim_ward_xp"],Duration:1,Particle:{type:"block",block_state:"minecraft:air"}}
schedule function trim:single/ward/xp2 1t append
