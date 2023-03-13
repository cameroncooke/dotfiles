# git log taken from: http://stackoverflow.com/a/9074343/862016
alias glog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gac='git add -A && git commit -m'
alias gu='git submodule update --init --recursive'
alias gp='git pull origin && gu'

#alias both-merged =	 !git-both-merged
alias gpp='git push origin +$(git rev-parse --abbrev-ref HEAD)'

#alias both-merged =	 !git-both-merged