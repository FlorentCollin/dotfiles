# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/florent/.zshrc'
# Disable case sensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"
alias vim=nvim
main() {
	cp ~/dev/competitive_programming/templates/io.cpp $1
}

run() {
	if [ $# -eq 0 ]
	  then
		echo "Waiting for input..." && ./a.out
      else
		g++ -std=c++17 -Wshadow -Wall -O2 -Wno-unused-result $1 && echo "Waiting for input..." && ./a.out
	fi
}

build() {
	g++ -std=c++17 -Wshadow -Wall -O2 -Wno-unused-result $1
}

cpwd() {
	pwd | xclip -sel clip
}

alias envim='vim ~/.config/nvim/init.vim'

VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR
export PATH=$PATH:$HOME/.local/bin

# FZF Nord theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#2E3440,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#2E3440,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
alias install="pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
alias aur="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro  yay -S"

# Bat theme
export BAT_THEME="Nord"
