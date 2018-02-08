port-ls() {
  lsof -i tcp:$1
}

. ~/.git-completion.bash
. ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

export PS1="\[\033[38;5;25m\]\u\[$(tput sgr0)\]\[\033[38;5;39m\]@\[$(tput sgr0)\]\[\033[38;5;20m\]\h\[$(tput sgr0)\]\[\033[38;5;39m\]:\[$(tput sgr0)\]\[\033[38;5;27m\]\w\[$(tput sgr0)\]\[\033[38;5;39m\]\$(__git_ps1 \" (%s)\"):\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

export USR_LOCAL="/usr/local"
export GCLOUD_HOME="$USR_LOCAL/google-cloud-sdk"
export SBT_HOME="$USR_LOCAL/sbt"
export ACTIVATOR_HOME="$HOME/.activator"
export PYENV_ROOT="$HOME/.pyenv"
export JENV_ROOT="$HOME/.jenv"
export YARN_ROOT="$HOME/.yarn"
export LOCAL_NPM="./node_modules"

export PATH="$LOCAL_NPM/.bin:$YARN_ROOT/bin:$JENV_ROOT/bin:$PYENV_ROOT/bin:$GCLOUD_HOME/bin:$ACTIVATOR_HOME/bin:$SBT_HOME/bin:$USER_LOCAL/bin:$PATH"

if command -v jenv 1>/dev/null 2>&1; then
	eval "$(jenv init -)"
fi

if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


doc_format="'table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.Image}}'"

alias node-ls="ps -ef | grep 'node '"
alias node-watch="while :; do clear; date; node-ls; sleep 5; done"
alias dk-id="docker ps -q"
alias dk-id-a="docker ps -aq"
alias dk-ls="docker ps --format ${doc_format}"
alias dk-ls-a="docker ps -a --format ${doc_format}"
alias dk-watch="while :; do clear; date; dk-ls; sleep 5; done"
alias dk-watch-a="while :; do clear; date; dk-ls-a; sleep 5; done"
alias dk-lsi="docker images --filter 'dangling=false'"

