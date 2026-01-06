#!/bin/bash 

# ===== Colors =====
TRACE_COLOR="\033[1;37m"
NC="\033[0m"

# ===== Functions =====
trace() {
	if [[ "$TRACE" == "1" ]]; then 
		echo -e "${TRACE_COLOR}  $*${NC}"
	fi
}

