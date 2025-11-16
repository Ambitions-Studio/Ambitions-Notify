fx_version 'cerulean'

game 'gta5'

use_experimental_fxv2_oal 'yes'

author 'Ambitions Studio'

description 'Ambitions Notifications — A lightweight and modular notification system designed for the Ambitions framework on FiveM.'

version '0.0.0'

name 'Ambitions Notification'

lua54 'yes'

shared_scripts {
  '@Ambitions/init.lua',
}

server_scripts {
}

client_scripts {
  'client/notify.lua'
}

ui_page 'web/dist/index.html'

files {
  'web/dist/**/*'
}

dependencies {
    'Ambitions'
}
