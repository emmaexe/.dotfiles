# Source global bashrc
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# Setup PATH
if ! [[ "$PATH" =~ "$HOME/.local/bin:" ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi
export PATH

# Source user defined aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            source "$rc"
        fi
    done
fi
unset rc

# Shell options
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=2000
shopt -s histappend
shopt -s dirspell

# Shell aliases
alias ll='ls -laF'
alias gitfetch=onefetch

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="nvim"
else
  export EDITOR="nvim"
fi

# Prompt
if which starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

