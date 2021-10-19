#!/bin/bash

set -e

function main() {
    # previous_file="$1"
    file_to_edit=`select_file` # $previous_file`

    if [ -n "$file_to_edit" ]; then
        "$EDITOR" "$file_to_edit"
        main "$file_to_edit"
    fi
}

function select_file() {
    # given_file="$1"
    fzf --preview="bat --color=always {}" --preview-window=right:70%:wrap # --query="$given_file"
}

main ""
