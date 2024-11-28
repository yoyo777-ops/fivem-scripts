fx_version 'cerulean'
game 'gta5'

author 'dd'
description 'Standalone Cuff System with ox_inventory and ox_target support.'
version '1.0.0'

shared_scripts {
    'config.lua',
}

client_scripts {
    'client/main.lua',
}

server_scripts {
    'server/main.lua',
    '@oxmysql/lib/MySQL.lua' -- Optional: Only if ox_inventory uses MySQL
}

dependencies {
    'ox_inventory',
    'ox_target'
}
