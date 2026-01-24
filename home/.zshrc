# Setup prompt and plugin manager
plugins=(zsh-autosuggestions zsh-syntax-highlighting command-not-found colored-man-pages) # vi-mode  colorize
zstyle ':omz:update' mode reminder
zstyle ':omz:update' verbose minimal
source $HOME/.oh-my-zsh/oh-my-zsh.sh
eval "$(starship init zsh)"

# Setup PATH
if ! [[ "$PATH" =~ "$HOME/.local/bin:" ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi
export PATH

# Installation-specific functions and aliases
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
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
alias ls='ls -lah --color=auto --group-directories-first --hyperlink=auto'

# Shell and other options
export HIST_STAMPS="yyyy-mm-dd"
export HISTCONTROL=ignoreboth
export EDITOR="hx"
