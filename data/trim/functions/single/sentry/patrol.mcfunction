scoreboard players reset @s pillager_summon
execute on attacker at @s run summon pillager ~ ~ ~ {Tags:["sentry_trim"],PatrolLeader:0b,Patrolling:1b,CanJoinRaid:0b,HandItems:[{id:"minecraft:crossbow",Count:1b,tag:{Damage:0}},{}]}
execute on attacker at @s run summon pillager ~ ~ ~ {Tags:["sentry_trim"],PatrolLeader:0b,Patrolling:1b,CanJoinRaid:0b,HandItems:[{id:"minecraft:crossbow",Count:1b,tag:{Damage:0}},{}]}
execute on attacker at @s run summon pillager ~ ~ ~ {Tags:["sentry_trim"],PatrolLeader:0b,Patrolling:1b,CanJoinRaid:0b,HandItems:[{id:"minecraft:crossbow",Count:1b,tag:{Damage:0}},{}]}
execute on attacker at @s run summon pillager ~ ~ ~ {Tags:["sentry_trim"],PatrolLeader:0b,Patrolling:1b,CanJoinRaid:0b,HandItems:[{id:"minecraft:crossbow",Count:1b,tag:{Damage:0}},{}]}
execute on attacker at @s run summon pillager ~ ~ ~ {Tags:["sentry_trim"],PatrolLeader:0b,Patrolling:1b,CanJoinRaid:0b,HandItems:[{id:"minecraft:crossbow",Count:1b,tag:{Damage:0}},{}]}

execute as @e[type=pillager,tag=sentry_trim] run effect give @s regeneration 10
execute as @e[type=pillager,tag=sentry_trim] run effect give @s resistance 2 2

execute as @e[type=pillager,tag=sentry_trim] at @s run damage @s 1 mob_attack by @e[type=!pillager,type=!player,sort=nearest,limit=1]
schedule function trim:single/sentry/patrol2 1t
schedule function trim:single/sentry/patrol2 3t
schedule function trim:single/sentry/patrol2 5t
schedule function trim:single/sentry/patrol2 7t
schedule function trim:single/sentry/patrol2 9t
schedule function trim:single/sentry/patrol2 11t
schedule function trim:single/sentry/patrol2 13t
schedule function trim:single/sentry/patrol2 15t
schedule function trim:single/sentry/kill_patrol 5s replace

# somehow this mess and only this mess works