if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Aliases
alias vim nvim

alias push_obsidian="~/scripts/push_obsidian.sh"
alias pull_obsidian="~/scripts/pull_obsidian.sh"

# Starship
starship init fish | source

# Golang
set -gx PATH $PATH "/usr/local/go/bin"
set -gx GOPATH "$HOME/go/src"
set -gx GOBIN "$HOME/go/bin"
