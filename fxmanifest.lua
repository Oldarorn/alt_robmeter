------------------------------
----------tony.647#0778-------
------------------------------


fx_version 'cerulean'

game 'gta5'
lua54 'yes'

description 'Parking Meter Robbery'

version '1.1.0'

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}

client_scripts {
	'client/main.lua'
}

server_scripts {
	'server/server.lua'
}

files {
  'locales/*.json'
}