#!/usr/bin/env bash

check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo "Please run as root"
        exit 1
    fi
}

weird="leedle"

