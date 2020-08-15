# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -v
# Reduce "lag" between mode
export KEYTIMEOUT=1
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

export PATH=$PATH:$HOME/.local/bin

alias ls=exa

alias vim=nvim
alias envim='nvim ~/.config/nvim/init.vim'
alias knvim='nvim ~/.config/kitty/kitty.conf'
VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR

# FZF Default
export FZF_DEFAULT_COMMAND='fd'
# FZF Nord theme
#export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    #--color=fg:#e5e9f0,bg:#2E3440,hl:#81a1c1
    #--color=fg+:#e5e9f0,bg+:#2E3440,hl+:#81a1c1
    #--color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    #--color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'
# FZF Atlas
#export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    #--color=fg:#c0c0c0,bg:#212121,hl:#444444
    #--color=fg+:#c0c0c0,bg+:#212121,hl+:#444444'
    #--color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    #--color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'
# FZF Codedark
#export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    #--color=fg:#c0c0c0,bg:#1E1E1E,hl:#444444
    #--color=fg+:#c0c0c0,bg+:#1E1E1E,hl+:#444444'

# FZF Alias and keybindings
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

alias install="pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"

alias aur="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro  yay -S"

alias pypi="curl -s https://pypi.org/simple/ | xmllint --xpath '//a/text()' - | fzf -m --preview-window wrap --preview 'curl -s https://pypi.org/pypi/{1}/json | jq -r \".info.summary\"' | xargs -ro pip install"

alias pypiuninstall="pip list | sed '1,2d' | fzf -m | xargs -ro pip uninstall"

# Bat theme
#export COLORTERM="truecolor"
#export BAT_THEME="Nord"
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# RMarkdown
function knit() {
    R -e "rmarkdown::render('$1')"
}

function pdf() {
    evince $1 1> /dev/null 2> /dev/null &!
}

autoload -z edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

alias bc="bc -l"
alias gs="git status"
alias run="./tests/Raytracer_tests --gtest_color=yes"

export TERM=xterm-kitty

function d() {
    dot -Tpng "$1" | feh -
}

function memory_leak() {
    valgrind --leak-check=full \
         --show-leak-kinds=all \
         --track-origins=yes \
         --verbose \
         $1
}

alias summary="Rscript -e 'summary (as.numeric (readLines (\"stdin\")))'"
