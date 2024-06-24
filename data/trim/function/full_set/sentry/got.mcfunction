tag @s add full_set_sentry
execute if items entity @s hotbar.* crossbow[minecraft:custom_data~{trim_abilities_sentry_crossbow:1b}] run return 0
execute if items entity @s inventory.* crossbow[minecraft:custom_data~{trim_abilities_sentry_crossbow:1b}] run return 0
give @s crossbow[unbreakable={},enchantments={"minecraft:multishot":1,"minecraft:piercing":4,"minecraft:quick_charge":5},custom_name='{"text":"Sentry Crossbow","italic":false}',custom_data={trim_abilities_custom_item:1b,trim_abilities_sentry_crossbow:1b}] 1
#tag @s add trim_got_item