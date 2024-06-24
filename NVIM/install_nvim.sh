#!/bin/bash

#install neovim
sudo apt install neovim
#install nvchad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
#plugins galore
ln -s /home/abl030/DotFiles/NVIM/plugins.lua ~/.config/nvim/lua/plugins/plugins.lua
#our main lua config
ln -s /home/abl030/DotFiles/NVIM/init.lua ~/.config/nvim/lua/init.lua
#add in our vimrc custom config.
echo "dofile(vim.fn.stdpath('config') .. '/lua/init.lua')" >> ~/.config/nvim/lua/options.lua
