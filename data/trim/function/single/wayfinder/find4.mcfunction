# catch command error with argument in text component
execute if data block ~ ~ ~ LastOutput.extra[{color:"red"}].extra[0].with run return run function trim:single/wayfinder/find_fault_arg with block ~ ~ ~ LastOutput.extra[0].extra[0]

# catch command error
execute if data block ~ ~ ~ LastOutput.extra[{color:"red"}] run return run function trim:single/wayfinder/find_fault with block ~ ~ ~ LastOutput.extra[0].extra[0]

#succes
tellraw @p[tag=single_wayfinder] ["The nearest one is ",{"block":"~ ~ ~","color":"green","nbt":"LastOutput.extra[0].with[2]"}," blocks away!"]
setblock ~ ~ ~ air replace
