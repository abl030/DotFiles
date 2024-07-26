#!/bin/bash

#install neovim, ripgrep for fuzzy search and zip for WSL2 based machines
sudo apt install neovim zip ripgrep -y
#install gcc and others to stop errors
#https://stackoverflow.com/questions/75587679/neovim-treesitter-returning-no-c-complier-error
sudo apt update && sudo apt install build-essential

#install nvchad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

