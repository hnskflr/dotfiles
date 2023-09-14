#eval (python -m virtualfish)
set fish_greeting ()
alias r="ranger"
alias ls="exa"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"

alias sudo="doas"
alias s="kitty +kitten ssh"

zoxide init fish | source

set LF_ICONS ~/.config/lf/icons 

function f
    fff $argv
    set -q XDG_CACHE_HOME; or set XDG_CACHE_HOME $HOME/.cache
    cd (cat $XDG_CACHE_HOME/fff/.fff_d)
end
