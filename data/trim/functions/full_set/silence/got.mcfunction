tag @s add full_set_silence
execute unless entity @s[tag=trim_got_item] unless entity @s[nbt={SelectedItem:{id:"minecraft:bow",tag:{silence_trim:1b}}}] run give @s bow{Enchantments:[{id:"minecraft:infinity",lvl:1s}],display:{Name:'{"text":"Sonic Boom","italic":false}'},Unbreakable:1b,silence_trim:1b,trim_abilities:1b} 1
tag @s add trim_got_item