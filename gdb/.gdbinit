# Its better to avoid escape sequences here: \e dont work, only \033. \[ \] dont work, cmd line is bugged
#set prompt -----------------------\n(gdb) 

# See https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797
# See https://sourceware.org/gdb/onlinedocs/gdb/Prompt.html
# See https://sourceware.org/gdb/onlinedocs/gdb/gdb_002eprompt.html#gdb_002eprompt
# \033 dont work
set extended-prompt \[\e[0;91m\]----------------------------------------------\n\[\e[0;32m\]> \[\e[0m\]

# See print settings: https://ftp.gnu.org/old-gnu/Manuals/gdb/html_node/gdb_57.html

# "print *obj" prints structs in formatted form rather than inline
set print pretty on
# "print *ptr" actual type members rather than declared (pointer type)
set print object on
# print arrays in column
set print array on

# prints symbol source file location after symbol name
set print symbol-filename on
# do not print addresses
#set print address off

# Alternative: att
set disassembly-flavor intel

