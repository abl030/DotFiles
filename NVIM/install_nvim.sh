#!/bin/bash

sudo apt install neovim

git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

ln 's' /home/abl030/DotFiles/NVIM/plugins.lua ~/.config/nvim/lua/plugins