# bash options
# set -o vi
shopt -s cdspell
complete -df -X '*.pdf' vim
# complete -df -X '!*.qmd' quarto

# colored prompt
export PS1="\[\033[38;5;2m\]\h${B}\[$(tput sgr0)\]\[\033[38;5;15m\] ${C}\[$(tput sgr0)\]\[\033[38;5;105m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] > \[$(tput sgr0)\]"

[[ -f ~/.bin/bashmarks.sh ]] && source ~/.bin/bashmarks.sh

source ~/.functions

# start tmux
if command -v tmux>/dev/null; then
    [[ ! $TERM =~ screen ]] && [[ ! "$TERM_PROGRAM" == "vscode" ]] && [ -z $TMUX ] && exec tmux
fi

if [[ $TERM != linux ]]; then
    source ~/.bin/promptline.sh
fi

# FZF
export FZF_DEFAULT_OPTS="--tmux --style=full"
export FZF_DEFAULT_COMMAND="find . -type f ! -path '*/.DS_Store' ! -path '*/.Rproj.user*' ! -path '*/.git/*'"
eval "$(fzf --bash)"

status
