#!/bin/bash

#Have to uninstall Neovim first, so we can pin and re-install the dev build:daily.
sudo apt remove neovim

#instal dev ppa
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

#install neovim, ripgrep for fuzzy search and zip for WSL2 based machines
#install gcc and others to stop errors
#https://stackoverflow.com/questions/75587679/neovim-treesitter-returning-no-c-complier-error
sudo apt install neovim zip ripgrep build-essential shellcheck pip python3-venv
#we need to install npm for lsp
# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

#install ubuntu nerdfont
mv ~/DotFiles/NVIM/scripts/UbuntuNerdFont-Regular.ttf  ~/.local/share/fonts/
fc-cache -f -v


#install nix multi-user. Just so we can compile nil_ls and have nix for lsp.
sh <(curl -L https://nixos.org/nix/install) --daemon

