# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer
}

trap 'timer_start' DEBUG

if [ "$PROMPT_COMMAND" == "" ]; then
  PROMPT_COMMAND="timer_stop"
else
  PROMPT_COMMAND="$PROMPT_COMMAND; timer_stop"
fi

PS1='------------------ Duration: ${timer_show}s Exit status: '\$?' ------------------\n\n\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\'\n'$ '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

LS_COLORS=$LS_COLORS":tw=30;42:ow=30;42:"
LS_COLORS=$LS_COLORS":di=04;32:*.h=01;36:*.cpp=01;34:*CMakeLists.txt=30;103:"
LS_COLORS=$LS_COLORS":*.filters=90:*.rc=90:*.user=90:*.vcproj=90:*.vcxproj=90:*.sln=90:*.manifest=90:*.ui=90:"

config_ls ()
{
  local LS_COMMAND=ls
  if command -v lsd &> /dev/null
  then
    LS_COMMAND=lsd
  fi

  local COMMON_ARGS="--group-directories-first --color=auto"
  alias ls="$LS_COMMAND $COMMON_ARGS -ah"
  alias ll="$LS_COMMAND $COMMON_ARGS -lah"
  alias lsex="$LS_COMMAND $COMMON_ARGS --sort=extension -ah"
  alias llex="$LS_COMMAND $COMMON_ARGS --sort=extension -lah"
}
config_ls

# Alias definitions.

alias st='git status'
alias logfiles='git log --oneline --name-only'
alias blame='git blame --date="format:%d %b %y"'
alias ggui='git gui & disown'
alias tmuxNewNamedSession="tmux new -s "
alias clipboard_to_png='xclip -selection clipboard -t image/png -o > '
alias info='info --vi-keys'
alias tree='tree -a --dirsfirst -I .git'

# Show completion options
bind 'set show-all-if-ambiguous on'
# Pressing tab will traverse completion options
# bind 'TAB:menu-complete'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

if [ -f "$HOME/.local/bin" ]; then
    PATH="$PATH:$HOME/.local/bin"
fi

export FZF_DEFAULT_OPTS="
--inline-info \
--ansi \
--color=16"
