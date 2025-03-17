if [ -z "$SHELL" ]; then
    SHELL=$(which zsh)
fi

if [ -f "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]; then
    ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"
    source "$ZINIT_HOME/zinit.zsh"
fi

eval "$(starship init zsh)"
