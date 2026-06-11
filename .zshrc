export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
#  exec dbus-run-session startx 
#fi

autoload -U compaudit compinit

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export PATH=$PATH:/home/ryan/.cargo/bin
export PF_INFO="ascii os cpu kernel uptime wm pkgs memory"
fastfetch
echo "\n"
alias sudo="doas"
alias mount-share="sudo mount -t nfs imladris:/mnt/share /mnt/nfs"
alias umount-share="sudo umount -R /mnt/nfs"
alias csource="clear && source ~/.zshrc"
alias matrix="unimatrix -n -s 96 -l o --color green"
alias ls="eza --icons=always"
alias notes-sync="sh ~/notes/sync.sh"
alias tty-clock="tty-clock -c -t -D -B -C 4"
alias vim="nvim"
alias suvim="doas nvim"

export PATH=$PATH:/home/ryan/.local/bin
export PATH=$PATH:/home/ryan/go/bin
export EDITOR=nvim

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
