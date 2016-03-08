if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

. $HOME/.shellrc.load

# custom bash prompt via kirsle.net/wizards/ps1.html
export PS1="\[$(tput bold)\]\[$(tput setaf 6)\]\t \[$(tput setaf 2)\][\[$(tput setaf 3)\]\u\[$(tput setaf 1)\]@\[$(tput setaf 3)\]\h\[$(tput setaf 7)\]\$(parse_git_branch) \[\033[00m\]\w\[$(tput setaf 2)\]\[$(tput bold)\]]\[$(tput setaf 4)\]\\n\$ \[$(tput sgr0)\]"

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
export HISTSIZE=100000 # big big history
export HISTFILESIZE=100000 # big big history
shopt -s histappend # append to history, don't overwrite it

# Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# git
alias gits='git status'
alias gitf='git fetch'
alias gitc='git commit -m'
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
alias git-authors='git ls-tree -r -z --name-only HEAD -- $1 | xargs -0 -n1 git blame --line-porcelain HEAD |grep  "^author "|sort|uniq -c|sort -nr'
