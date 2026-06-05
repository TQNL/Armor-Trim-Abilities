setblock ~ ~ ~ air
data remove block ~ ~ ~ LastOutput.extra[0].extra[0].with
$tellraw @s [{"color":"red","text":"Something went wrong in the command: "},{"color":"red","translate":"$(translate)"}]