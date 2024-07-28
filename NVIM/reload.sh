
#lets automate removing our nvchad and redoing from scratch
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim


#install nvchad
git clone https://github.com/NvChad/starter ~/.config/nvim 

#and now call our symlinks scripts
bash symlinks.sh

nvim
