#!/usr/bin/env bash

function lssh () {
    # Setup Variables
    Container="SSH Keys"
    Host=${1}

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

    # Check for matching Host entries in ~/.ssh/config, and use the FQDN Hostname for $Host
    if [ -e "~/.ssh/config" ]; then
        echo "SSH Config file found!"
        #if [[] $(grep "Host $Host" ~/.ssh/config) -ne "" ]]; then
        #    Host=$(ssh -G $Host | grep -m1 -oP "(?<=hostname ).*")
        #    echo $Host
        #fi
    fi

    # Load in each SSH Private Key into ssh-agent
    #for KEY in $(lpass ls "$Container" | awk '{ print substr( $2, 6, length($2) ) }'); do
    #    if [[ $Host -eq $KEY ]]; then
    #        lpass show --field="Private Key" "$Container/$KEY" | setsid ssh-add /dev/stdin
    #        ssh $Host
    #    fi
    #done
}
