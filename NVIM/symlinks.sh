#!/bin/bash

#run this after installing NVCHad!!!!
#don't run this twice..... durp.

#plugins galore
ln -s /home/abl030/DotFiles/NVIM/plugins.lua ~/.config/nvim/lua/plugins/plugins.lua
#our main lua config
ln -s /home/abl030/DotFiles/NVIM/init.lua ~/.config/nvim/lua/init.lua
#add in our vimrc custom config.
echo "dofile(vim.fn.stdpath('config') .. '/lua/init.lua')" >> ~/.config/nvim/lua/options.lua
#add in our ui custom config
sed -i '$d' ~/.config/nvim/lua/chadrc.lua
echo 'return vim.tbl_deep_extend("force", M, require "ui")' >> ~/.config/nvim/lua/chadrc.lua
ln -s ~/DotFiles/NVIM/ui.lua ~/.config/nvim/lua/ui.lua
