tag @s add single_spire
execute unless entity @s[tag=trim_got_item] run give @s splash_potion[custom_name='{"text":"Potion of Levitation","italic":false}',lore=['{"text":"Gives you slow falling for 10s instead"}'],potion_contents={custom_color:11919584,custom_effects:[{id:"minecraft:levitation",amplifier:0b,duration:60}]},custom_data={trim_abilities_custom_item:1b,trim_abilities_potion_of_levitation:1b}] 1
tag @s add trim_got_item
