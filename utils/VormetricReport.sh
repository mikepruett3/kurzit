#!/usr/bin/env bash

function VormetricReport () {
    # Variables
    SNMP_VER="2c"
    DISK_OID="1.3.6.1.4.1.21513.7.0"
    UPTIME_OID="1.3.6.1.4.1.21513.3.0"
    VERSION_OID="1.3.6.1.4.1.21513.1.0"
    ScriptName=$(basename $BASH_SOURCE)

    # Parameter Check
    if [ "$#" -eq 0 ]; then
        echo "$ScriptName: Function to generate a report on Vormetric DSM Appliances, using SNMP"
        echo ""
        echo "Usage: > $ScriptName -h xxx -p xxx -c xxxx"
        echo ""
        echo -e "\t -h hostname"
        echo -e "\t -p snmp port"
        echo -e "\t -c community string"
        return
    fi

    # Parameters
    while [ "$#" -gt 0 ]; do
        case "$1" in
            -h)
                shift;
                HOST=$1;
                ;;
            -p)
                shift;
                # Generally, either 161 or 7025
                PORT=$1;
                ;;
            -c)
                shift;
                COMMUNITY=$1;
                ;;
            *)  ;;
        esac
        shift
    done

    # Check for SNMP Tools (net-snmp-utils)
    if ! hash snmpget; then
        echo "net-snmp-utils not installed or included in path!"
        return
    else
        SNMPGET=$(command -v snmpget)
    fi

    # Test Connectivity to Host
    ping -c 1 $HOST &> /dev/null
    if [ "$?" -ne 0 ]; then
        echo "Unable to communicate with $HOST"
        return
    fi

    # Test SNMP Connectivity to Host
    $SNMPGET -v $SNMP_VER -c $COMMUNITY $HOST:$PORT . >/dev/null
    if [ "$?" -ne 0 ]; then
        echo "Unable to communicate with $HOST on $PORT"
        return
    fi

    # Use snmpget to populate variables with information from Vormetric DSM Host
    ROOT_USAGE=$($SNMPGET -v $SNMP_VER -c $COMMUNITY $HOST:$PORT $DISK_OID | head -n 3 | grep "/" | awk '{ print $5}')
    LARGE_USAGE=$($SNMPGET -v $SNMP_VER -c $COMMUNITY $HOST:$PORT $DISK_OID | grep "/large" | awk '{ print $5}')
    UPTIME=$($SNMPGET -v $SNMP_VER -c $COMMUNITY $HOST:$PORT $UPTIME_OID | awk '{ print $4,$5,$6 }')
    VERSION=$($SNMPGET -v $SNMP_VER -c $COMMUNITY $HOST:$PORT $VERSION_OID | awk '{ print $4 }')
    EmailReport
}

function EmailReport () {
    # Variables
    SMTP="smtp-server.example.net"
    Sender="root@$(hostname -f)"
    Recipient="myemail@example.net"
    SUBJECT="Report of Vormetric Data Security Manager - $HOST"
    TAB="$(printf '\t')"

    # Generate Output via Heredoc
cat <<- EOF | mailx -s "$SUBJECT" -S smpt="smtp://$SMTP" -S from="$Sender" "$Recipient" 
Vormetric Data Security Manager Appliance - $HOST
Version: $VERSION
System Uptime: $UPTIME
Disk Usage:
/ ${TAB} $ROOT_USAGE
/large ${TAB} $LARGE_USAGE
EOF
}
