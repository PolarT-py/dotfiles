#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export XCURSOR_THEME=Bibata-Modern-Ice
export XCURSOR_SIZE=24  # Adjust the size as needed
