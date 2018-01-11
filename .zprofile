export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH=$HOME/go

export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.node_modules/bin:$PATH"
export PATH="$(go env GOPATH)/bin:$PATH"
export PATH="$HOME/.racket/6.8/bin:$PATH"
export PATH="$HOME/.local/planck:$PATH"
export PATH="$HOME/emsdk-portable:$PATH"
export PATH="$HOME/emsdk-portable/clang/fastcomp/build_incoming_64/bin:$PATH"
export PATH="$HOME/emsdk-portable/emscripten/incoming:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"

export VDPAU_DRIVER=r600

LOCALE_ARCHIVE=$HOME/.nix-profile/lib/locale/locale-archiv
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval 
"$($BASE16_SHELL/profile_helper.sh)"

source ~/.dotfiles/autoenv/activate.sh
source ~/.shell_prompt.sh

if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi

# opam configuration
test -r /home/ben/.opam/opam-init/init.zsh && . /home/ben/.opam/opam-init/init.zsh > /dev/null $

export GPG_TTY=$(tty)
if [[ -n "$SSH_CONNECTION" ]] ;then
  export PINENTRY_USER_DATA="USE_CURSES=1"
fi
