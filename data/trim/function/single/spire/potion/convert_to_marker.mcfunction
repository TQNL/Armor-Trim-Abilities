# Convert thrown potion payload from display-levitation to marker effects.
data modify entity @s Item.components."minecraft:potion_contents".custom_effects set value [{id:"minecraft:luck",amplifier:104b,show_icon:0b,show_particles:0b,duration:100},{id:"minecraft:unluck",amplifier:18b,show_icon:0b,show_particles:0b,duration:100}]

# Refund the thrower.
execute on origin if entity @s[tag=single_spire] unless items entity @s container.* splash_potion[minecraft:custom_data~{trim_abilities_potion_of_levitation:1b}] run give @s splash_potion[custom_name={"text":"Potion of Levitation","italic":false},lore=[{"text":"Gives you slow falling for 10s instead"}],potion_contents={custom_color:11919584,custom_effects:[{id:"minecraft:levitation",amplifier:0b,duration:60}]},custom_data={trim_abilities_custom_item:1b,trim_abilities_potion_of_levitation:1b}] 1
