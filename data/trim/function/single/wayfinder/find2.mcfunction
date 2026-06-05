$setblock ~ ~ ~ command_block{TrackOutput:1b,auto:1b,Command:"$(command)"} replace
summon area_effect_cloud ~ ~ ~ {Duration:2,Age:0,WaitTime:0,Radius:0f,Tags:["trim_find_way_command"],Particle:{type:"block",block_state:"minecraft:air"}}
schedule function trim:single/wayfinder/find3 2t replace
