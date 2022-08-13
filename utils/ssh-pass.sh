#!/usr/bin/env bash

function ssh-pass () {
    # Parameter Check
    if [ "$#" -eq 0 ]; then
        echo "$ScriptName: Function that uses sshpass and an encrypted password"
        echo ""
        echo "Usage: > $ScriptName -f xxx -p xxx"
        echo ""
        echo -e "\t -h hostname to connect"
        echo -e "\t -u username to use when connecting"
        echo -e "\t -p Encrypted password to use when connecting"
        return
    fi

    # Parameters
    while [ "$#" -gt 0 ]; do
        case "$1" in
            -h)
                shift;
                HOST=$1;
                ;;
            -u)
                shift;
                USER=$1;
                ;;
            -p)
                shift;
                PASS=$1;
                ;;
            *)  ;;
        esac
        shift
    done

    # Check for sshpass
    if ! hash sshpass; then
        echo "sshpass not installed or included in path!"
        return
    fi

    sshpass -p"${PASS}" ssh -oStrictHostKeyChecking=no -l "${USER}" ${HOST}

    # Cleanup vars
    unset HOST
    unset USER
    unset PASS
}
