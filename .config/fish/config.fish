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
set -gx GOROOT "/usr/local/go"
set -gx GOPATH "$HOME/gocode"
set -gx GOBIN "$HOME/gocode/bin"

set -gx PATH $PATH "$GOROOT/bin"

# Oracle
set -gx ORACLE_HOME "/usr/lib/oracle/11.2/client64"
set -gx PKG_CONFIG_PATH "$GOPATH/oci8"
set -gx LD_LIBRARY_PATH "$ORACLE_HOME/lib"
