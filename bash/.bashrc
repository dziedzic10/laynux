#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/Documents/scripts-configs/bashrcex

alias updategrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias upgradegrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias v='nvim'
alias vim='nvim'
alias sv='sudo nvim'
alias p='python learn.py'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias t='$HOME/.scripts/tailscale.sh'
alias gitu='cd $HOME/laynux/.install && ./update.sh'
alias d='trash-put'
alias clip='wl-copy <'
update() {
  "$HOME/Documents/scripts-configs/update_servers.sh" "$@"
}


PS1='[\u@\h \W]\$ '

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
alias
echo "update -a $HOME/Documents/scripts-configs/update_servers.sh"
  
export EDITOR=nvim
export VISUAL=nvim
eval "$(starship init bash)"
eval "$(zoxide init bash)" 

