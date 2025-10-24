if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Starship
starship init fish | source

# Fish config
set fish_greeting
set -g fish_key_bindings fish_vi_key_bindings

# Aliases
alias dateiso "date +%FT%T%Z"

# Functions
function find_text
	find . -type f -exec grep --color=auto -i -H "$argv" {} \;
end

# Golang
set -gx GOROOT "/usr/local/go" 
set -gx GOPATH "$HOME/gocode"
set -gx GOBIN "$HOME/gocode/bin"

set -gx PATH $PATH "$GOROOT/bin"
set -gx PATH $PATH $GOBIN

# Java
set -gx JAVA_HOME /usr/lib/jvm/java-23-openjdk/bin/java
set -gx PATH $PATH $JAVA_HOME/bin

# Oracle
set -gx ORACLE_HOME /usr/lib/oracle/11.2/client64
set -gx PKG_CONFIG_PATH $GOPATH/oci8
set -gx LD_LIBRARY_PATH $ORACLE_HOME/lib

# Git
set -gx GIT_SK_UZ_TOKEN "104f4f7dbb68e84a7cafc40718b3d3bab73c29bc"
set -gx GOPRIVATE "git.sk.uz"

# Protocol Buffer Compiler
# Installation Guide: https://grpc.io/docs/protoc-installation/#install-pre-compiled-binaries-any-os
set -gx PATH $PATH "$HOME/.local/bin"

# Sarkor ROOT 
set -gx SARKOR_ACCESS_ROOT "$HOME/sarkor"

# Autorun
# Автозапуск tmux, если не в сессии
if status is-interactive
    # Проверяем, что мы не находимся уже внутри tmux
    if not set -q TMUX
        # Подключаемся к существующей сессии или создаем новую
        tmux attach -t main || tmux new -s main
    end
end
