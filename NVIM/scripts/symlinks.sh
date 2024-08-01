#!/bin/bash

#run this after installing NVCHad!!!!
#don't run this twice..... durp.

#plugins galore
ln -s /home/abl030/DotFiles/NVIM/plugins.lua ~/.config/nvim/lua/plugins/plugins.lua
#our main lua config has both a vim component and a lua component, so you can edit as you see fit.
echo "vim.cmd('source ~/vim.vim')" >> ~/.config/nvim/init.lua
echo "dofile(vim.fn.stdpath('config') .. '/config.lua')" >> ~/.config/nvim/init.lua

#symlink in our config.lua
ln -s /home/abl030/DotFiles/NVIM/config.lua ~/.config/nvim/config.lua

#add in our vimrc custom config.
#echo "dofile(vim.fn.stdpath('config') .. '/lua/init.lua')" >> ~/.config/nvim/lua/options.lua
#add in our ui custom config
sed -i '$d' ~/.config/nvim/lua/chadrc.lua
echo 'return vim.tbl_deep_extend("force", M, require "ui")' >> ~/.config/nvim/lua/chadrc.lua
ln -s ~/DotFiles/NVIM/ui.lua ~/.config/nvim/lua/ui.lua

#sym in our lsp config so we can add new languages
rm ~/.config/nvim/lua/configs/lspconfig.lua
ln -s /home/abl030/DotFiles/NVIM/lspconfig.lua ~/.config/nvim/lua/configs/lspconfig.lua

#Don't forget to run :MasonInstallAll afer all this.
