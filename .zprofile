export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH=$HOME/go

export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.node_modules/bin:$PATH"
export PATH="$(go env GOPATH)/bin:$PATH"
export PATH="$HOME/.racket/6.8/bin:$PATH"
export PATH="$HOME/emsdk-portable:$PATH"
export PATH="$HOME/emsdk-portable/clang/fastcomp/build_incoming_64/bin:$PATH"
export PATH="$HOME/emsdk-portable/emscripten/incoming:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"

export VDPAU_DRIVER=r600

LOCALE_ARCHIVE=$HOME/.nix-profile/lib/locale/locale-archiv
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi
