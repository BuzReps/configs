#!/bin/bash

# Create symbolic link to given target in given directory
# @param[in] $1 Target file or directory
# @param[in] $2 Directory to store link into
function create_link() {
	local COLOR_END=$'\033[0m'
	local COLOR_ERROR=$'\033[31m'
	local COLOR_WARNING=$'\033[30;43m'
	local COLOR_SUCCESS=$'\033[32m'

	local target=$1
	local directory=$2
	if [[ "$directory" != */ ]]; then
		directory="$directory/"
	fi
	local link_name="${directory}$(basename ${target})"
	if [ -e "${link_name}" ]; then
		if [ "${link_name}" -ef "${target}" ]; then
			echo ${COLOR_SUCCESS}"[x] Already exists: ${target} -> ${link_name}"${COLOR_END}
		else
			echo ${COLOR_WARNING}"[ ] File ${link_name} exists. Cannot link ${target}"${COLOR_END}
		fi
	else
		mkdir -p "$directory"
		ln --symbolic --relative "$target" "$directory"
		if [ "${link_name}" -ef "${target}" ]; then
			echo ${COLOR_SUCCESS}"[+] Created: ${target} -> ${link_name}"${COLOR_END}
		else
			echo ${COLOR_ERROR}"[ ] Failed to create: ${target} -> ${link_name}"${COLOR_END}
		fi
	fi
}

create_link alacritty ~/.config/
create_link bash/.bashrc ~/
create_link bash/.bash_aliases ~/
create_link gdb/.gdbinit ~/
create_link gdb/.gdbearlyinit ~/
create_link git/.gitconfig ~/
create_link i3 ~/.config/
create_link nvim ~/.config/
# See README in redshift
ln redshift/redshift.conf ~/.config/
create_link tmux/.tmux.conf ~/
create_link Xresources/.Xresources ~/
create_link Xresources/.xsession ~/
create_link Xresources/.Xresources.d ~/

