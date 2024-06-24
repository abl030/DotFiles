#!/bin/bash

#install neovim
sudo apt install neovim ripgrep -y
#install gcc and others to stop errors
#https://stackoverflow.com/questions/75587679/neovim-treesitter-returning-no-c-complier-error
sudo apt update && sudo apt install build-essential

#install nvchad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

