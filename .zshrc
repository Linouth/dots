# Fix completion
autoload -Uz compinit
compinit

# Enable menu for completion (with VIM bindings)
zstyle ':completion:*' menu select
zmodload zsh/complist

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey '^n' expand-or-complete
bindkey '^p' reverse-menu-complete

# Configure command history
HISTFILE="$HOME/.zhistory"
HISTSIZE=50000
SAVEHIST=10000

setopt extendedhistory
setopt histexpiredupsfirst
setopt histignoredups
setopt histignorespace
setopt histverify
setopt sharehistory
setopt incappendhistory

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

# Enable colors
autoload -U colors && colors
setopt promptsubst


# Set env variables
path+=$HOME/bin
path+=$HOME/src/esp/xtensa-esp32-elf/bin
export IDF_PATH=$HOME/src/esp/esp-idf

# Add git prompt function
function git_prompt_info() {
	local ref
	ref=$(command git symbolic-ref HEAD 2>/dev/null) || \
	ref=$(command git rev-parse --short HEAD 2>/dev/null) || return 0
	echo "${ref//refs\/heads\//}"
}

# Source Antibody and load plugins
source <(antibody init)
antibody bundle < $HOME/.zsh_plugins

# Enable LS colors
eval $( dircolors -b $HOME/.config/LS_COLORS )
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
alias ls='ls --color'


# Aliases
alias dots='git --git-dir=$HOME/.dots.git/ --work-tree=$HOME'
alias open='xdg-open'
alias la='ls -la'
