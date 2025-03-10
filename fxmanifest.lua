fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'yz-cowv1'
description 'Disnaker Susu Sapi Job'
version '1.0.0'

shared_scripts {
    'config.lua'
}

client_scripts {
    '@ox_lib/init.lua',
    'client/functions.lua',
    'client/npc.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'server/sv_main.lua'
}

-- dependencies {
--     'es_extended',
--     'ox_lib',
--     'ox_target',
--     'ox_inventory'
-- }