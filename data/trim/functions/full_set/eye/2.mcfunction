# raycast done
execute unless block ~ ~ ~ #trim:air if block ~ ~1 ~ #trim:air if block ~ ~2 ~ #trim:air positioned ~ ~1 ~ align xyz run tp @s ~0.5 ~ ~0.5
execute unless block ~ ~ ~ #trim:air if block ~ ~1 ~ #trim:air if block ~ ~2 ~ #trim:air positioned ~ ~1 ~ align xyz run return 0
execute unless block ~ ~ ~ #trim:air if block ~ ~2 ~ #trim:air if block ~ ~3 ~ #trim:air positioned ~ ~2 ~ align xyz run tp @s ~0.5 ~ ~0.5
execute unless block ~ ~ ~ #trim:air if block ~ ~2 ~ #trim:air if block ~ ~3 ~ #trim:air positioned ~ ~2 ~ align xyz run return 0
execute unless block ~ ~ ~ #trim:air positioned ^ ^ ^-0.1 run function trim:full_set/eye/3
execute unless block ~ ~ ~ #trim:air run return 0

# further raycast, in unsuccesful case
execute if entity @s[distance=..50] positioned ^ ^ ^0.1 run function trim:full_set/eye/2
execute unless entity @s[distance=..50] positioned ^ ^ ^50 run function trim:full_set/eye/3
