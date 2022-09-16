fx_version 'cerulean'
game 'gta5'
lua54 'yes'
name "benzo-carrental"
author "Benzo#6565 & Mycroft#9999"
version "1.0.0"

shared_scripts {'@es_extended/imports.lua', 'shared/*.lua'}

client_scripts {'client/*.lua'}

server_scripts {'server/*.lua'}

dependencies {'es_extended', 'esx_context', 'ox_inventory'}
