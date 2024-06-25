$execute as @e[type=horse,tag=full_set_flow_wind_ball] if entity @s[nbt={Owner:$(UUID)}] on passengers run kill @s[type=block_display,tag=full_set_flow_wind_ball_display]
$execute as @e[type=horse,tag=full_set_flow_wind_ball] if entity @s[nbt={Owner:$(UUID)}] run tp @s ~ -200 ~
