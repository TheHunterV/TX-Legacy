fx_version 'cerulean'
game 'gta5'

author 'Txpac'

lua54 'yes'

shared_script {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config.lua'
}

client_script {
    'client.lua',
    'clothes/client/*.lua',
    'portefeuille/client/*.lua',
}
server_script {
    'server.lua',
    'clothes/server/*.lua',
    'portefeuille/server/*.lua'
}