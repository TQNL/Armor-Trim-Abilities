tag @s add single_sentry
execute if items entity @s hotbar.* goat_horn[minecraft:custom_data~{trim_abilities_pillager_war_horn:1b}] run return 0
execute if items entity @s inventory.* goat_horn[minecraft:custom_data~{trim_abilities_pillager_war_horn:1b}] run return 0
give @s goat_horn[enchantment_glint_override=1b,custom_name='{"text":"Pillager War Horn","italic":false}',lore=['{"text":"Summon 3 pillager on your attacker"}'],instrument="minecraft:seek_goat_horn",custom_data={trim_abilities_custom_item:1b,trim_abilities_pillager_war_horn:1b}] 1
#tag @s add trim_got_item