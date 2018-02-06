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

antigen theme bira

antigen apply
# End Antigen Block

alias vi=nvim
alias vim=nvim
alias top=htop
alias u='time sudo emerge --sync && time sudo emerge -auDNt --with-bdeps=y --keep-going @world'
alias timers='systemctl list-timers'
alias ls='ls -l --color=auto'
alias reboot='sudo shutdown -r now'
alias clojurei='java -cp /usr/share/clojure-1.8/lib/clojure.jar clojure.main'

source ~/.dotfiles/autoenv/activate.sh
# source ~/.shell_prompt.sh

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi

function dir_resolve {
    if [[ -d "$1" ]]
    then
        pushd "$1" >/dev/null
        pwd
        popd >/dev/null
    elif [[ -e $1 ]]
    then
        pushd "$(dirname "$1")" >/dev/null
        echo "$(pwd)/$(basename "$1")"
        popd >/dev/null
    else
        echo "$1" does not exist! >&2
        return 127
    fi
}

# opam configuration
test -r /home/ben/.opam/opam-init/init.zsh && . /home/ben/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# source ~/.java9
