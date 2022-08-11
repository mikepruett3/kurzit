#!/usr/bin/env bash

function Convert-PFXtoPEM () {
    # Parameter Check
    if [ "$#" -eq 0 ]; then
        echo "$ScriptName: Function convert .pfx certificate files to PEM format"
        echo ""
        echo "Usage: > $ScriptName -f xxx -p xxx"
        echo ""
        echo -e "\t -f .pfx file"
        echo -e "\t -p .pfx password"
        return
    fi

    # Parameters
    while [ "$#" -gt 0 ]; do
        case "$1" in
            -f)
                shift;
                FILE=$1;
                ;;
            -p)
                shift;
                PFXPass=$1;
                ;;
            *)  ;;
        esac
        shift
    done

    # Check for OpenSSL
    if ! hash openssl; then
        echo "openssl not installed or included in path!"
        return
    fi

    # Check for $FILE existence
    if [ ! -f "${FILE}" ]; then
        echo "File ${FILE} not found!!!"
        return
    fi

    # Convert/Extract the PFX file to PEM Key file
    openssl pkcs12 -in "${FILE}" -nocerts -nodes -password pass:"${PFXPass}" | openssl pkcs8 -nocrypt -out "${FILE::-4}.key"

    # Convert/Extract the PFX file to Certificate file
    openssl pkcs12 -in "${FILE}" -clcerts -nokeys -password pass:"${PFXPass}" | openssl x509 -out "${FILE::-4}.crt"

    # Convert/Extract the PFX file to CA Certificate Bundle file
    openssl pkcs12 -in "${FILE}" -cacerts -nokeys -chain -password pass:"${PFXPass}" -out "${FILE::-4}.chain.cer"

    # Convert/Extract the PFX file to a combined PEM file with Key, Certificate and CA Certificate Bundle
    openssl pkcs12 -in "${FILE}" -passin pass:"${PFXPass}" -passout pass:"${PFXPass}" -out "${FILE::-4}.pem"

    # Cleanup vars
    unset FILE
    unset PFXPass
}

