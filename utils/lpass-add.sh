#!/usr/bin/env bash

function lpass-add () {
    # Setup Variables
    Container="SSH Keys"

    # Check for LastPass CLI tool
    if ! hash lpass; then
        echo "lpass not installed or included in path!"
        return
    fi

    # Check if $Container has any entries
    if [[ ! $(lpass ls "$Container") ]]; then
        echo "Container does not exist!"
        return
    fi

    # Load in each SSH Private Key into ssh-agent
    for KEY in $(lpass ls "$Container" | awk '{ print substr( $2, 6, length($2) ) }'); do
        lpass show --field="Private Key" "$Container/$KEY" | setsid ssh-add /dev/stdin
    done
}
