tag @s add single_spire
execute unless entity @s[tag=trim_got_item] run give @s splash_potion{CustomPotionColor:11919584,display:{Name:'{"text":"Potion of Levitation","italic":false}',Lore:['{"text":"Gives you slow falling for 10s instead"}']},trim_abilities:1b,spire_trim:1b,custom_potion_effects:[{id:"minecraft:levitation",amplifier:0b,duration:60}]} 1
tag @s add trim_got_item
