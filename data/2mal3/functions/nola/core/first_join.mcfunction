# Description: Tests all new players to see if the minecraft or server version is wrong and tells them so
# Called from tag: 2mal3:nola/debug
# Datapack by 2mal3

# Collects the data
execute store result score $nola.temp_0 nola.data run data get entity @s DataVersion

scoreboard players set $nola.temp_1 nola.data 0
execute unless score $nola.temp_1 nola.data matches 1.. store success score $nola.temp_1 nola.data run data get entity @s "Spigot.ticksLived"
execute unless score $nola.temp_1 nola.data matches 1.. store success score $nola.temp_1 nola.data run data get entity @s "Bukkit.updateLevel"
execute unless score $nola.temp_1 nola.data matches 1.. store success score $nola.temp_1 nola.data run data get entity @s "Paper.SpawnReason"

# Gives an error message for wrong versions
execute unless score $nola.temp_0 nola.data matches 2584.. run tellraw @s [{"text":"[","color":"gray"},{"text":"<name>","color":"gold"},{"text":"/","color":"gray"},{"text":"WARN","color":"gold"},{"text":"]: ","color":"gray"},{"text":"This Minecraft version is not supported by the datapack. Please use a version later than 1.16.","color":"gold"}]

execute if score $nola.temp_1 nola.data matches 1 run tellraw @s [{"text":"[","color":"gray"},{"text":"<name>","color":"gold"},{"text":"/","color":"gray"},{"text":"WARN","color":"gold"},{"text":"]: ","color":"gray"},{"text":"This Minecraft version is not supported by the datapack. Please use a version later than 1.16.","color":"gold"}]