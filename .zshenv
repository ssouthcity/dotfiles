# Rust
# ====
. "$HOME/.cargo/env"

# Golang
# ======
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin

# Python
# ======
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Azure
# =====
export PATH="$PATH:$HOME/.azure/bin"
export PATH="$PATH:$HOME/.dotnet"
