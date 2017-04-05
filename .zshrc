# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/deciduously/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Antigen block
source ~/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply
# End Antigen Block

alias vi=nvim
alias vim=nvim
alias top=htop
alias u='sudo pacman -Syu'
alias timers='systemctl list-timers'
alias ls='ls -l --color=auto'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'
alias gco='git checkout'
alias gp='git push'

export GOPATH=$HOME/go

export PATH="$PATH:$HOME/.local/bin"

export PATH="$PATH:$HOME/.node_modules/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:$HOME/.rvm/bin"

source /usr/share/autoenv/activate.sh
source ~/.shell_prompt.sh
