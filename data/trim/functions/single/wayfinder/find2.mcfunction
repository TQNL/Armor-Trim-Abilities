$setblock ~ ~ ~ command_block{TrackOutput:1b,auto:1b,Command:"$(command)"} replace
summon area_effect_cloud ~ ~ ~ {WaitTime:3,Tags:["trim_find_way_command"],Particle:{type:"block",block_state:"minecraft:air"}}
schedule function trim:single/wayfinder/find3 2t append
