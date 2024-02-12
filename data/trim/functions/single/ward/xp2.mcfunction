execute at @e[tag=trim_ward_xp] as @p[advancements={trim:trim_abilities/kill_mob=true}] at @s as @e[type=experience_orb,distance=..8] store result entity @s Value short 2 run data get entity @s Value
execute at @e[tag=trim_ward_xp] as @p[advancements={trim:trim_abilities/kill_mob=true}] run advancement revoke @s only trim:trim_abilities/kill_mob
