#eval (python -m virtualfish)
set fish_greeting ()
alias r="ranger"
alias ls="lsd"
alias l="ls"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"

alias s="kitty +kitten ssh"

alias q="qalc"

alias sudo="doas"

alias nw="nmcli dev wifi"
alias nwc="nmcli dev wifi connect"

function f
    fff $argv
    set -q XDG_CACHE_HOME; or set XDG_CACHE_HOME $HOME/.cache
    cd (cat $XDG_CACHE_HOME/fff/.fff_d)
end
