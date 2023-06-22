fx_version 'cerulean'
game 'gta5'
description 'Tx-Modules'

shared_script 'config.lua'

client_script 'client/main.lua'

export 'seatbelt'

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/app.js',
    'ui/*.css',
}