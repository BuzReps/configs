# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vladislav/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors && colors

# Version control
# -U mark the function vcs_info for autoloading and suppress alias expansion
# -z use zsh style
autoload -Uz vcs_info
precmd() {
	vcs_info
}

plugins=(zsh-autosuggestions)
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# \UE0A0 - Branch character
zstyle ':vcs_info:git:*' formats ' on '$'\UE0A0'' %b'

# Mandatory for expanding vcs_info_msg_0_
setopt prompt_subst

# TODO FIX BROKEN LENGTH

PROMPT='───── Return code: %? ─────' # Return code
PROMPT+=$'\n' # Newline
PROMPT+=$'\n'
PROMPT+='┌%{$fg[blue]%}%n%{$reset_color%}' # %n - Username
PROMPT+=' at '
PROMPT+='%{$fg[red]%}%m%{$reset_color%}' # %m - Hostname
PROMPT+=' in '
PROMPT+='%{$fg[green]%}%~%{$reset_color%}' # %~ - Working directory
PROMPT+='%{$fg[yellow]%}$vcs_info_msg_0_%{$reset_color%}'
PROMPT+=$'\n'
PROMPT+='└>' # Prompt line

alias st='git status'
alias ls='ls --group-directories-first --color -a'
alias ll='ls --group-directories-first --color -lah'
alias ggui='git gui &!'

LOCAL_CONFIG=~/.zshrc_local
if test -f "$LOCAL_CONFIG"; then
	source "$LOCAL_CONFIG"
fi

