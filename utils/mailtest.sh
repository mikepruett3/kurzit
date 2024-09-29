#!/usr/bin/env bash

function mailtest () {
    # Setup Variables
    ParamCount=$#
    ScriptName=$(basename $BASH_SOURCE)
    Username="$(cut -d'@' -f1 <<< $USER)"
    Host="$(hostname -f | tr '[:upper:]' '[:lower:]')"
    MailUtils=("mailx" "mutt" "mail" "s-nail")
    SMTPVars=("SMTP" "SMTP_PORT" "Recipient")
    Sender="$Username@$Host"
    Subject="Test Email from $Username on $Host at $(date +"%I:%M %p")"

    # Check for Mail Utils
    unset test i
    declare -a test
    for i in ${MailUtils[@]}
    do
        if hash $i 2> /dev/null; then
            test+=($i)
        fi
    done
    #echo ${#test[@]}

    if [ ${#test[@]} -lt 1 ]; then
        echo "No mail utility ( ${MailUtils[@]} ) installed or included in path!"
        return
    fi

    # Check for existing Environment Variables
    unset test i
    declare -a test
    for i in ${SMTPVars[@]}
    do
        if [ -v $i ]; then
            test+=(true)
        fi
    done
    #echo ${#test[@]}

    # Parameter Check
    if [[ ( ${#test[@]} -lt 3 && $ParamCount -eq 0 ) || ( $ParamCount -lt 6 && ${#test[@]} -eq 0 ) ]]; then
        echo "$ScriptName: Send a Test email message from the command line"
        echo ""
        echo "Usage: > $ScriptName -h xxx -p xxx -r xxxx"
        echo ""
        echo -e "\t -h smtp hostname"
        echo -e "\t -p smtp port"
        echo -e "\t -r email recipient"
        return
    fi

    # Parameters
    while [ "$#" -gt 0 ]; do
        case "$1" in
            -h)
                shift;
                SMTP=$1;
                ;;
            -p)
                shift;
                # Generally 25
                SMTP_PORT=$1;
                ;;
            -r)
                shift;
                Recipient=$1;
                ;;
            *)  ;;
        esac
        shift
    done

    # Start with mutt first
    if hash mutt 2> /dev/null; then
        echo "$Subject" | mutt -e 'set from = $Sender; set smtp_url = "smtp://$SMTP:$SMTP_PORT/";' -s "$Subject" "$Recipient"
        return
    fi

    # Now s-nail (for systems without heirloom mailx, like Ubuntu)
    if hash s-nail 2> /dev/null; then
        echo "$Subject" | s-nail -s "$Subject" -S mta="smtp://$SMTP:$SMTP_PORT" -S from="$Sender" "$Recipient"
        return
    fi

    # Now mailx
    if hash mailx 2> /dev/null; then
        echo "$Subject" | mailx -s "$Subject" -S smtp="smtp://$SMTP:$SMTP_PORT" -S from="$Sender" "$Recipient"
        return
    else # Finally just regular mail
        echo "$Subject" | mail -s "$Subject" -S smpt="smtp://$SMTP:$SMTP_PORT" -S from="$Sender" "$Recipient"
        return
    fi
}
