if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

# Aliases
alias vim nvim
alias dateiso "date +%FT%T%Z"

alias cat bat
alias ls exa
alias htop btm

alias sync_obsidian="~/scripts/sync_obsidian.sh"

# Abbreviations
# Git
abbr -a gs git status
abbr -a ga git add
abbr -a gaa git add .
abbr -a gcm git commit -m
abbr -a gco git checkout 
abbr -a gp git push -u origin
abbr -a gl git pull

# Key bindings
set -g fish_key_bindings fish_vi_key_bindings

# Starship
starship init fish | source

# Golang
set -gx PATH $PATH "/usr/local/go/bin"
set -gx GOPATH "$HOME/go/src"
set -gx GOBIN "$HOME/go/bin"
