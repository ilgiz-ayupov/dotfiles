if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Starship
starship init fish | source

# Fish config
set fish_greeting
set -g fish_key_bindings fish_vi_key_bindings

# Aliases
alias vim nvim
alias dateiso "date +%FT%T%Z"

alias cat bat
alias ls exa
alias htop btm

# Abbreviations
## Git
abbr -a gs git status
abbr -a ga git add
abbr -a gaa git add .
abbr -a gcm git commit -m
abbr -a gco git checkout 
abbr -a gp git push -u origin
abbr -a gl git pull

# Golang
set -gx GOROOT "/usr/local/go" 
set -gx GOPATH "$HOME/gocode"
set -gx GOBIN "$HOME/gocode/bin"

set -gx PATH $PATH "$GOROOT/bin"

# Protocol Buffer Compiler
# Installation Guide: https://grpc.io/docs/protoc-installation/#install-pre-compiled-binaries-any-os
set -gx PATH $PATH "$HOME/.local/bin"
