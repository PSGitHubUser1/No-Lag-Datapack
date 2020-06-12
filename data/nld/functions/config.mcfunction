# Description: The settings for the Datapack
# From: main/tick
# Datapack by 2mal3

#                                                                            |
# Maximum entities on one block                                              V
execute if score nld.start nld.data matches 1 run gamerule maxEntityCramming 12


#                                                                                             |
# Maximum number of tnt                                                                       V
execute if score nld.start nld.data matches 1 run scoreboard players set nld.max_tnt nld.data 15


#                                                                                             |
# Range in which mobs are switched off                                                        V
execute as @e[type=!#nld:ignore,tag=nld.NoAI,tag=!global.ignore] at @s if entity @a[distance=..41] run data merge entity @s {NoAI:0b}
execute as @e[type=!#nld:ignore,tag=nld.NoAI,tag=!global.ignore] at @s if entity @a[distance=..41] run tag @s remove nld.NoAI
execute as @e[type=!#nld:ignore,tag=!nld.NoAI,tag=!global.ignore] at @s unless entity @a[distance=..41] run data merge entity @s {NoAI:1b}
execute as @e[type=!#nld:ignore,tag=!nld.NoAI,tag=!global.ignore] at @s unless entity @a[distance=..41] run tag @s add nld.NoAI
#                                                                                                   A
#                                                                                                   |



# Time after the items despawnen in ticks
kill @e[type=item,nbt={Age:3600s}]
#                             A
#                             |
#                                                                                                 |
# Number of entities from which the lag is increased                                              V
execute if score nld.start nld.data matches 1 run scoreboard players set nld.max_entitys nld.data 500


# Measures for too much lag
# When the measures are taken: execute if score nld.entitys nld.data matches <max entity numer>... run <command>
# When resolving measures: execute if score nld.entitys nld.data matches ..<min enity numer> run <command>
execute if score nld.entitys nld.data matches 500.. run gamerule doMobSpawning false
execute if score nld.entitys nld.data matches 500.. run say Mob Spawnig was switched off

execute if score nld.entitys nld.data matches ..500 run gamerule doMobSpawning true
execute if score nld.entitys nld.data matches ..500 run say Mob Spawnig was switched on
