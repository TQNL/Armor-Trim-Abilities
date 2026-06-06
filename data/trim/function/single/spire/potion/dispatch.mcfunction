# Remove marker effects.
effect clear @s minecraft:luck
effect clear @s minecraft:unluck

# Powered players get slow falling.
execute if entity @s[tag=trim.single.spire] run effect give @s minecraft:slow_falling 10 0

# Non-powered players get the original levitation effect.
execute unless entity @s[tag=trim.single.spire] run effect give @s minecraft:levitation 3 0