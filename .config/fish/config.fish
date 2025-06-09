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

alias dnd="dragon-drop"

alias p="lf ~/music"

function p --description "open lf in music dir"
    if [ -n "$argv" ]
        lf $(fd "$argv" -t d ~/music | head -1)
    else
        lf ~/music 
    end

end

# zoxide init fish | source

set -gx EDITOR nvim
