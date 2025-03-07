#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias d='trash-put'
alias rm='echo "This is not the command you are looking for."; false'

eval "$(zoxide init bash)" 
