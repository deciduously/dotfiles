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
source ~/.dotfiles/antigen/antigen.zsh

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
alias reboot='sudo reboot'

alias ghc='stack exec -- ghc'
alias ghci='stack exec -- ghci'

source ~/.dotfiles/autoenv/activate.sh
source ~/.shell_prompt.sh
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi
