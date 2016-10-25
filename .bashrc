if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

. $HOME/.shellrc.load

BLACK="\[$(tput setaf 0)\]"
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
MAGENTA="\[$(tput setaf 5)\]"
CYAN="\[$(tput setaf 6)\]"
WHITE="\[$(tput setaf 7)\]"
LIME_YELLOW="\[$(tput setaf 190)\]"
POWDER_BLUE="\[$(tput setaf 153)\]"
BOLD="\[$(tput bold)\]"
NORMAL="\[$(tput sgr0)\]"
BLINK="\[$(tput blink)\]"
REVERSE="\[$(tput smso)\]"
UNDERLINE="\[$(tput smul)\]"

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="${BOLD}\t ${NORMAL}[\u@\h]${BOLD}${WHITE}\$(parse_git_branch) \
${NORMAL}${GREEN}\w\\n${RED}\$${NORMAL} "

# commands
alias cdiff='colordiff' # requires colordiff package
alias grep='grep -iI --color=auto'
alias df='df -h'
alias duh='du -c -h'
alias dus='du -a | sort -r | head -n 10'
alias mkdir='mkdir -p -v'
alias pingcount='ping -c 5'
alias tree='tree -c'
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du -d=1'
alias hist='history | grep' # requires an argument
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias pgg='ps -Af | grep' # requires an argument
alias ..='cd ..'
alias cd..='cd ..'
alias rmtmp='find ./ -name *~ | xargs rm'
alias xvfb='Xvfb :99 & >/dev/null; export DISPLAY=:99'
alias watcher='find . -name "*.cpp" -o -name "*.h" -o -name "*.xml" -o -name "*.inl" -o -name "Jamfile" | entr -cdr'
alias pywatcher='find . -name "*.py" | entr -cdr'
eval $(thefuck --alias)

# ls
alias ll='ls -l'
alias la='ll -A'
alias lz='ll -rS' # sort by size
alias lt='ll -rt' # sort by date
alias lm='la | more'

# terminal features
alias cls=' echo -ne "\033c"' # clear screen for real (it does not work in Terminology)

# histoy modification
HISTTIMEFORMAT="%d/%m/%y %T "
export HISTCONTROL=ignoredups:erasedups # no duplicate entries
export HISTSIZE=999 # big big history
export HISTFILESIZE=999 # big big history
export HISTCONTROL=ignoredups
export HISTCONTROL=erasedups
shopt -s histappend # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# git
alias gits='git status'
alias gitf='git fetch'
alias gitc='git commit -m'
alias git-authors='git ls-tree -r -z --name-only HEAD -- $1 | xargs -0 -n1 git blame --line-porcelain HEAD |grep  "^author "|sort|uniq -c|sort -nr'
alias gitd='git diff'
alias gitdc='git diff --cached'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_DEFAULT_OPTS='-m'

fe() {
    # fe - Open the selected files with the default editor
    local files=$(fzf --query="$1" --select-1 --exit-0 | sed -e "s/\(.*\)/\'\1\'/")
    local command="${EDITOR:-vim} -p $files"
    [ -n "$files" ] && eval $command
}

fd() {
    # fd - cd to selected directory
    local dir
    dir=$(find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) &&
    cd "$dir"
}

fh() {
    # fh - repeat history
    eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

fkill() {
    # fkill - kill process
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    if [ "x$pid" != "x" ]
    then
        kill -${1:-9} $pid
    fi
}

export BERT_PLATFORM_REV=5800v2

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/devel
source /usr/local/bin/virtualenvwrapper.sh

source "~/.bash/up/src/.bash_functions"
source "~/.bash/up/completion/up"
