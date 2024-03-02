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
# alias ls exa
alias htop btm

# Golang
set -gx GOROOT "/usr/local/go" 
set -gx GOPATH "$HOME/gocode"
set -gx GOBIN "$HOME/gocode/bin"

set -gx PATH $PATH "$GOROOT/bin"

# Oracle
set -gx ORACLE_HOME "/usr/lib/oracle/11.2/client64"
set -gx PKG_CONFIG_PATH "$GOPATH/oci8"
set -gx LD_LIBRARY_PATH "$ORACLE_HOME/lib"

# Run tmux session
$HOME/scripts/run_temp_session.sh 2> /dev/null
