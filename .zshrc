# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.j
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
 zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
 HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(       tmux
                common-aliases
                copypath
                copyfile
                ubuntu
                git
                history
                history-substring-search
                autoupdate      # https://github.com/tamcore/autoupdate-oh-my-zsh-plugins
                zsh-syntax-highlighting # https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
                zsh-autosuggestions
                zsh-autocomplete # https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df
                rust
                pyenv
)

source $ZSH/oh-my-zsh.sh
# source ~/remote_ssh_nosleep.sh

bindkey '^I^I' autosuggest-accept
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias nosleep='sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target'

alias gosleep='sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target && sudo systemctl suspend && exit'

alias gohibe='sudo systemctl unmask hibernate.target && sudo systemctl hibernate && exit'

alias cr='cargo run'

alias  epi!="wakeonlan       18:c0:4d:65:86:e8 "

export PATH=$PATH:~/.local/bin/
export PATH=$PATH:/usr/local/cuda-12.3/bin/


export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Function to quickly push our dotfile changes
function push_dotfiles() {
    cd ~/DotFiles || return
    echo "Enter commit message: "
    read commit_message
    git add --all
    git commit -m "$commit_message"
    git push origin
}

# Similar function to easily pull remote changes
function pull_dotfiles() {
    cd ~/DotFiles || return
    git pull origin
}


#thisisatest

function edit() {
  case $1 in
    zsh)
      nvim ~/DotFiles/.zshrc
      ;;
    caddy)
      nvim ~/DotFiles/Caddy/Caddyfile 
      ;;
     diary)
      cd /mnt/data/Life/Zet/Projects/Diary && nvim
     ;;
   cullen)
     cd /mnt/data/Life/Zet/Cullen && nvim
     ;;
    *)
      echo "Unknown argument: $1"
      ;;
  esac
}

function reload() {
  case $1 in
    caddy)
      sudo systemctl restart caddy
      ;;
    zsh)
      exec zsh
      ;;
    nvim)
      bash ~/DotFiles/NVIM/scripts/reload_nvim.sh
      ;;
    *)
      echo "Unknown argument: $1"
      ;;
   esac
}

export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/abl030/.local/share/flatpak/exports/share"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


alias ls="ls -A -F --group-directories-first --sort=extension --color=always -l"
