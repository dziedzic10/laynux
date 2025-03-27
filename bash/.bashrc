#
# ~/.bashrc
#

fastfetch
eval "$(zoxide init bash)" 
export EDITOR=vim
eval "$(starship init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

### TRASH-CLI
alias d='trash-put'
alias rm='echo "This is not the command you are looking for."; false'

### THEME-QT
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_STYLE_OVERRIDE="kvantum"
export QT_QPA_PLATFORMTHEME="qt6ct"

### VIM-ZOXIDE
v() {
    vim "$(zoxide query "$1")"
}

### YAZI
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
