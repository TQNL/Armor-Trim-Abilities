execute as @a[tag=single_wayfinder] if entity @s[tag=single_raiser] if entity @s[tag=single_shaper] if entity @s[tag=single_host] run tag @s add full_set_ascendant
execute as @a[tag=full_set_ascendant] at @s run effect give @a[distance=..128] speed 7 0 true
execute as @a[tag=full_set_ascendant] at @s run effect give @a[distance=..128] haste 7 0 true
execute as @a[tag=full_set_ascendant] at @s run effect give @a[distance=..128] strength 7 0 true
execute as @a[tag=full_set_ascendant] at @s run effect give @a[distance=..128] regeneration 7 0 true
schedule function trim:ascendant 6s replace

# flow mount, here for lag
execute as @e[type=horse,tag=full_set_flow_wind_ball] at @s on passengers if entity @s[type=player] run tag @n[type=horse,tag=full_set_flow_wind_ball] add full_set_flow_dont_kill
execute as @e[type=horse,tag=full_set_flow_wind_ball,tag=!full_set_flow_dont_kill] at @s run tp @s ~ ~-200 ~
tag @e[type=horse,tag=full_set_flow_wind_ball] remove full_set_flow_dont_kill
## kill block display
execute as @e[type=block_display,tag=full_set_flow_wind_ball_display] run function trim:full_set/flow/kill_display
