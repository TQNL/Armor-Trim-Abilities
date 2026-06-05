effect give @s wither 10 0 false
effect give @s unluck 10 84 true
effect give @s luck 10 23 true
execute if entity @s[type=player] at @s unless block ~ ~ ~ fire run summon small_fireball ~ ~2 ~ {Motion:[0.0d,-10.0d,0.0d]}
execute unless entity @s[type=player] run data merge entity @s {Fire:140s}
