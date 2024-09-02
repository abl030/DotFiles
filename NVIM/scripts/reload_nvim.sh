# This will momentarily slow down the reload script, so not optimal.
# However it needs to be here, as if it's in the prereqs script nvm has not loaded into path and it fails.
# download and install Node.js (you may need to restart the terminal)
nvm install 22

#lets automate removing our nvchad and redoing from scratch
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim


#install nvchad
git clone https://github.com/NvChad/starter ~/.config/nvim

#and now call our symlinks scripts
bash ~/DotFiles/NVIM/scripts/symlinks.sh

nvim
