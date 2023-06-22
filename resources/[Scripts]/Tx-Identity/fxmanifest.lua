fx_version 'adamant'
lua54 'yes'
game 'gta5'


escrow_ignore {
	'locales/*.lua',
	'config.lua',
	'server/main.lua',
	'Readme.md',
	'client/main.lua',
	'html/index.html',
	'html/js/script.js',
	'html/css/style.css',
  }

description 'Tx Identity'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@es_extended/locale.lua',
	'@oxmysql/lib/MySQL.lua',
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

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/js/script.js',
	'html/css/style.css',
}

dependency 'es_extended'

dependency '/assetpacks'