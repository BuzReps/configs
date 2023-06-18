# git-bash config file. Source it in windows C:\\Users\<User>\.bashrc

LS_COLORS=$LS_COLORS":di=04;32:*.h=01;36:*.cpp=01;34:*CMakeLists.txt=30;103:"
LS_COLORS=$LS_COLORS":*.filters=90:*.rc=90:*.user=90:*.vcproj=90:*.vcxproj=90:*.sln=90:*.manifest=90:*.ui=90:"

# Shortcuts
alias ls='ls --group-directories-first --color -a'
alias ll='ls --group-directories-first --color -la'
alias lsex='ls --group-directories-first --sort=extension --color -a'
alias llex='ls --group-directories-first --sort=extension --color -la'

# GIT shortcuts
alias st='git status'
alias logfiles='git log --oneline --name-only'
alias blame='git blame --date="format:%d %b %y"'

# Running GUI programs
alias ggui='start git-gui'

# See https://www.shellhacks.com/bash-colors/
# Non-printing escape sequences have to be enclosed in \[\033[ and \]
# If the escape sequence is controlling text color, then it will be followed by an m.
# \e[ or \033[ - begin color modifications
# COLORm - color code + m
# \e[0m - end color modifications

# Show after branch name */+ if there are unstaged/staged changes
GIT_PS1_SHOWDIRTYSTATE=1

buz_init_prompt() {
	local END_COLOR='\e[0m'
	local BLUE_FG='\e[34m'
	local RED_FG='\e[31m'
	local GREEN_FG='\e[32m'
	local YELLOW_FG='\e[1;33m'

  # TODO FIX. BROKEN LENGTH

	local MY_PROMPT='\[\033]0;\W\007\]'
	MY_PROMPT+='───── Return code: $? ─────\n\n'
	MY_PROMPT+='┌'
	MY_PROMPT+=$BLUE_FG'\u'$END_COLOR # username
	MY_PROMPT+=' at '
	MY_PROMPT+=$RED_FG'\h'$END_COLOR # hostname
	MY_PROMPT+=' in '
	MY_PROMPT+=$GREEN_FG'\w'$END_COLOR # current working directory
	MY_PROMPT+=$YELLOW_FG'$(__git_ps1 " on  %s")'$END_COLOR # git branch
	MY_PROMPT+='\012└>' # newline WARNING: WINDOWS: \n after function call leads to errors. Use \012 instead

	# Note: copying git-prompt.sh to .config/git breaks autocompletion
	PS1=$MY_PROMPT
}
buz_init_prompt

# Check if exists
if [[ -f ~/.bash_aliases ]]
then
	# e.g. cd aliases
	source ~/.bash_aliases
fi

