fx_version 'adamant'

game 'gta5'

description 'Instance'

version '1.7.5'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'server/main.lua'
}


client_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'client/main.lua'
}
