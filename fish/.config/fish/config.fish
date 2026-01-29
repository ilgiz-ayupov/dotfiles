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
alias up-apt "sudo apt-get update && sudo apt-get dist-upgrade -y"
alias up-epm-play "flatpak update -y"
alias up-flatpak "sudo epm play --update all -y"
alias lz "lazygit"
alias ld "lazydocker"

# Functions
function find_text
	if test (count $argv) -ne 1
		echo "usage: find_text <text>" >&2
		return 1
	end

	set text $argv[1]
	find . -type f -exec grep --color=auto -i -H "$text" {} \;
end

function check_port
	if test (count $argv) -ne 1
		echo "usage: check_port <port>" >&2
		return 1
	end

	set port $argv[1]
	sudo lsof -i :$port
end

function http
	if test (count $argv) -lt 2
		echo "usage: http <GET|PORT> <url> [data]" >&2
		return 1
	end

	set method (string upper $argv[1])
	set url $argv[2]
	set data ""

	# временные файлы
	set headers (mktemp)
	set resp (mktemp)

	# выполнить запрос
	switch $method
		case GET
			curl -s -D $headers -o $resp -X GET $url
		case POST
			if test (count $argv) -lt 3
				echo "POST requires data" >&2
				return 1
			end

			set data $argv[3]
			curl -s -D $headers -o $resp -X POST -d "$data" $url
		case '*'
			echo "unsupported method: $method" >&2
			return 1
	end

	# вывод заголовков
	echo -e "\n=== Headers ==="
	bat --style=plain --language=ini $headers 2>/dev/null; or cat $headers

	# вывод тела
	echo -e "=== Body: ==="

	# если JSON - подсветить через jq
	if jq empty $resp 2>/dev/null
		jq . $resp
	else
		bat --style=plain $resp 2>/dev/null; or cat $resp
	end

	# очистка
	rm $headers $resp
end

# Golang
set -gx GOROOT "/usr/local/go"
set -gx GOPATH "$HOME/go"
set -gx GOBIN "$HOME/go/bin"

fish_add_path --append "$GOROOT/bin"
fish_add_path --append $GOBIN

# Scripts
fish_add_path --append "$HOME/Scripts"

# Java
set -gx JAVA_HOME /usr/lib/jvm/java-23-openjdk/bin/java
fish_add_path --append $JAVA_HOME/bin

# Oracle
set -gx ORACLE_HOME /usr/lib/oracle/11.2/client64
set -gx PKG_CONFIG_PATH $GOPATH/oci8
set -gx LD_LIBRARY_PATH $ORACLE_HOME/lib

# Sarkor
set -gx GOPRIVATE "git.sk.uz"
set -gx GIT_SK_UZ_TOKEN "b551bcef98459891eb8c586b92a89e0063f2efea"
set -gx SARKOR_ACCESS_ROOT "$GOPATH/sarkor"

# Flatpak
set -gx XDG_DATA_DIRS "/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"

# Protocol Buffer Compiler
# Installation Guide: https://grpc.io/docs/protoc-installation/#install-pre-compiled-binaries-any-os
set -gx PATH $PATH "$HOME/.local/bin"

