#!/bin/bash

#run this after installing NVCHad!!!!
#don't run this twice..... durp.

#plugins galore
ln -s /home/abl030/DotFiles/NVIM/plugins.lua ~/.config/nvim/lua/plugins/plugins.lua
#our main lua config
ln -s /home/abl030/DotFiles/NVIM/init.lua ~/.config/nvim/lua/init.lua
#add in our vimrc custom config.
echo "dofile(vim.fn.stdpath('config') .. '/lua/init.lua')" >> ~/.config/nvim/lua/options.lua