export ZSH="$HOME/.oh-my-zsh"
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

#if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
#  exec dbus-run-session startx 
#fi

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
alias pac="sudo pacman"
alias sudo="doas"
alias mount-share="sudo mount -t nfs imladris:/mnt/share /mnt/nfs"
alias hyprconfig="vim ~/.config/hypr/hyprland.conf"
alias umount-share="sudo umount -R /mnt/nfs"
alias csource="clear && source ~/.zshrc"
alias matrix="unimatrix -n -s 96 -l o --color green"
alias sunset="hyprsunset -t 3000 & disown"
alias sunrise="hyprsunset -t 6000 & disown"
alias ls="eza --icons=always"
alias notes-sync="sh ~/notes/sync.sh"
alias tty-clock="tty-clock -c -t -D -B -C 4"
alias vim="nvim"
alias suvim="doas nvim"

export PATH=$PATH:/home/ryan/.local/bin
export PATH=$PATH:/home/ryan/go/bin
export EDITOR=nvim

#eval "$(oh-my-posh init zsh --config 'catppuccin_mocha')"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
