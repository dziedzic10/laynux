#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias updategrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias v='nvim'
alias vim='nvim'
alias sv='sudo nvim'
alias p='python learn.py'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias t='$HOME/.scripts/tailscale.sh'
PS1='[\u@\h \W]\$ '

### TRASH-CLI
alias d='trash-put'

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
export EDITOR=nvim
eval "$(starship init bash)"
eval "$(zoxide init bash)" 

