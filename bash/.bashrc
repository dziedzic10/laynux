#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias updategrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias v='nvim'
alias vim='nvim'
alias p='python learn.py'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

### TRASH-CLI
alias d='trash-put'
alias rm='echo "This is not the command you are looking for."; false'

### YAZI
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

fastfetch
export EDITOR=vim
eval "$(starship init bash)"
eval "$(zoxide init bash)" 

