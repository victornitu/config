ls-port() {
  lsof -i tcp:$1
}

. ~/.git-completion.bash
. ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

export PS1="\[\033[38;5;25m\]\u\[$(tput sgr0)\]\[\033[38;5;39m\]@\[$(tput sgr0)\]\[\033[38;5;20m\]\h\[$(tput sgr0)\]\[\033[38;5;39m\]:\[$(tput sgr0)\]\[\033[38;5;27m\]\w\[$(tput sgr0)\]\[\033[38;5;39m\]\$(__git_ps1 \" (%s)\"):\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

export USR_LOCAL=/usr/local
export LOCAL_NPM=./node_modules

export PATH=$PATH:$USR_LOCAL/bin:$LOCAL_NPM/.bin

alias watch-node="while :; do clear; date; ps -ef | grep \"node \"; sleep 2; done"
alias node6="npx -p node-bin@6 -- node"
alias npm3="npx npm@3"
