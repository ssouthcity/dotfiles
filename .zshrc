# Theme
# =====
eval "$(starship init zsh)"

# Terminal Behaviour
# ==================
setopt autocd
setopt correct

# Custom Commands
# ===============
alias ls="ls --color=auto"
alias ll="ls -alF"
alias dotgit="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
function take () { mkdir $1 && cd $1; }

function dotenv() {
  set -a
  source .env
  set +a
}

# Golang
# ======
export PATH="$PATH:/usr/local/go/bin"

# Python
# ======
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Node
# ====
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Tmux
# ====
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    tmux attach || tmux >/dev/null 2>&1
fi

# Node
# ====
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
