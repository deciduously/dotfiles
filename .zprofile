export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH=$HOME/go

export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.node_modules/bin:$PATH"
export PATH="$(go env GOPATH)/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"

export VDPAU_DRIVER=r600
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
