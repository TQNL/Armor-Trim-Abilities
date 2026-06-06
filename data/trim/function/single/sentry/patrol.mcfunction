scoreboard players reset @s trim.pillager_summon
execute on attacker at @s run summon pillager ~ ~ ~ {Tags:["trim.sentry","smithed.entity"],PatrolLeader:0b,Patrolling:1b,CanJoinRaid:0b,equipment:{mainhand:{id:"minecraft:crossbow",count:1,components:{"minecraft:damage":0}}}}
execute on attacker at @s run summon pillager ~ ~ ~ {Tags:["trim.sentry","smithed.entity"],PatrolLeader:0b,Patrolling:1b,CanJoinRaid:0b,equipment:{mainhand:{id:"minecraft:crossbow",count:1,components:{"minecraft:damage":0}}}}
execute on attacker at @s run summon pillager ~ ~ ~ {Tags:["trim.sentry","smithed.entity"],PatrolLeader:0b,Patrolling:1b,CanJoinRaid:0b,equipment:{mainhand:{id:"minecraft:crossbow",count:1,components:{"minecraft:damage":0}}}}
execute on attacker at @s run summon pillager ~ ~ ~ {Tags:["trim.sentry","smithed.entity"],PatrolLeader:0b,Patrolling:1b,CanJoinRaid:0b,equipment:{mainhand:{id:"minecraft:crossbow",count:1,components:{"minecraft:damage":0}}}}
execute on attacker at @s run summon pillager ~ ~ ~ {Tags:["trim.sentry","smithed.entity"],PatrolLeader:0b,Patrolling:1b,CanJoinRaid:0b,equipment:{mainhand:{id:"minecraft:crossbow",count:1,components:{"minecraft:damage":0}}}}

execute as @e[type=pillager,tag=trim.sentry] run function trim:single/sentry/pillager_buffs

execute as @e[type=pillager,tag=trim.sentry] at @s run damage @s 1 mob_attack by @n[type=!pillager,type=!player]
execute on attacker at @e[type=pillager,tag=trim.sentry] run damage @n[type=pillager,tag=trim.sentry] 1 mob_attack by @s

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