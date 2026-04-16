# Setup prompt and plugin manager
plugins=(zsh-autosuggestions zsh-syntax-highlighting command-not-found colored-man-pages) # vi-mode  colorize
zstyle ':omz:update' mode disabled
zstyle ':omz:update' verbose minimal
export ZSH_CUSTOM="$HOME/.dotfiles/external/zsh"
source $HOME/.dotfiles/external/zsh/oh-my-zsh/oh-my-zsh.sh
eval "$(starship init zsh)"

# Setup PATH
if ! [[ "$PATH" =~ "$HOME/.local/bin:" ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi
export PATH

# Installation-specific functions and aliases
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*(N); do
        if [ -f "$rc" ]; then
            source "$rc"
        fi
    done
fi
unset rc

# Global functions and aliases
y() {
    local tmp="$(mktemp -t yazi-cwd.XXXXXX)"
    yazi "$@" --cwd-file="$tmp"
    if [ -f "$tmp" ]; then
        cd "$(cat "$tmp")"
        rm -f "$tmp"
    fi
}
alias z='zellij'
alias ls='ls -lah --color=auto --group-directories-first --hyperlink=auto'
alias git-cleanup-branches='git branch --merged origin/main | grep -vE "^\s*(\*|main|dev)" | xargs -n 1 git branch -d'

# Shell and other options
export HISTFILE=~/.zsh_history
export HIST_STAMPS="yyyy-mm-dd"
export HISTCONTROL=ignoreboth
export EDITOR="hx"
