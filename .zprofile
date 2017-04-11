export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH=$HOME/go

export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.node_modules/bin:$PATH"
export PATH="$(go env GOPATH)/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
