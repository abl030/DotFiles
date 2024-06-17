

#adjust our git profile
git config --global user.name "abl030"
git config --global user.email abl030@gmail.com

#install GH

# Check if gh is installed
if command_exists gh; then
    echo "GitHub CLI (gh) is already installed."
else
#installwget and GH
sudo apt install wget -y
# Set up the GitHub CLI repository and keyring
echo "Setting up GitHub CLI repository and keyring..."
sudo mkdir -p -m 755 /etc/apt/keyrings
wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# Update package lists and install gh
echo "Updating package lists..."
sudo apt update
echo "Installing GitHub CLI (gh)..."
sudo apt install gh -y

echo "GitHub CLI (gh) installation complete."

gh auth login

fi



#Pull in the repo
gh repo clone abl030/DotFiles

#create our symlinks
ln -s ~/DotFiles/.zshrc ~/.zshrc
ln -s ~/DotFiles/.vimrc ~/.vimrc
ln -s ~/DotFiles/.p10k.zsh ~/.p10k.zsh
ln -s ~/DotFiles/vim-vim ~/vim.vim
ln -s ~/DotFiles/.tmux.conf ~/.tmux.conf


#install dependencies
sudo apt install zsh curl -y

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#ZSH plugins
#TODO - Use a plugin manager???

#Autoupdate External Plugins
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/autoupdate

#ZSH syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#Fish like autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#Autocomplete
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete

#Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Print a message to remind the user to restart the shell
echo "Homebrew will be installed. Please restart your shell or open a new terminal session, then run this script again to continue the setup."
echo "After restarting, re-run this script"

# Check if Homebrew is installed and proceed if it is
if command -v brew >/dev/null 2>&1; then
    echo "Continuing with the installation..."
    # Update Homebrew
    brew update

    # Install pyenv
    brew install pyenv
else
#install homebrew and asks user to restart shell environment
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Please restart your shell and run this script again."
    exit 1

fi