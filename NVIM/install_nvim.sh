#!/bin/bash

#Have to uninstall Neovim first, so we can pin and re-install the dev build-essential
#sudo apt remove neovim

#instal dev ppa 
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

#install neovim, ripgrep for fuzzy search and zip for WSL2 based machines
sudo apt install neovim zip ripgrep -y
#install gcc and others to stop errors
#https://stackoverflow.com/questions/75587679/neovim-treesitter-returning-no-c-complier-error
sudo apt install build-essential

#we need to install npm for lsp
# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# download and install Node.js (you may need to restart the terminal)
nvm install 22

#lets automate removing our nvchad and redoing from scratch
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim


#install nvchad
git clone https://github.com/NvChad/starter ~/.config/nvim 

#and now call our symlinks scripts
bash symlinks.sh

nvim

