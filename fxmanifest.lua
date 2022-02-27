fx_version 'cerulean'

game 'gta5'

author 'Roderic#0614'
description 'Example'

--Client Scripts-- 
client_scripts {
    'NativeUI.lua',
	'Config.lua',
 'Client/*.lua'
}

--Server Scripts-- 
server_scripts {
	'Config.lua',
	'@mysql-async/lib/MySQL.lua',
	'Server/*.lua'
}

export {
    'WalkMenuStart'
}
--UI Part-- 
ui_page {
 'html/index.html', 
}

--File Part-- 
files {
 'html/index.html',
 'html/app.js', 
 'html/style.css'
} 