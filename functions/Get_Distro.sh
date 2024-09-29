#!/usr/bin/env bash

# Export needed Variables that match OS/Distribution/Version
function Get_Distro () {
    if [ -x "$(command -v lsb_release)" ]; then
        _distro=$(lsb_release -i | cut -d ":" -f 2 | xargs | tr '[:upper:]' '[:lower:]')
    elif [ -e "/System/Library/CoreServices/SystemVersion.plist" ]; then
        _distro=$(xmllint --xpath 'string(/plist/dict)' /System/Library/CoreServices/SystemVersion.plist | head -n 7 | tail -n 1 | xargs | awk '{ print tolower($1) }')
    elif [ -e "/etc/debian_version" ]; then
        _distro="debian"
    else
        _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
    fi

    # set an icon based on the distro
    # make sure your font is compatible with https://github.com/lukas-w/font-logos
    case $_distro in
        *kali*)                  export ICON="ﴣ";export DISTRO="Kail";;
        *arch*)                  export ICON="";export DISTRO="Arch";;
        *debian*)                export ICON="";export DISTRO="Debian";;
        *raspbian*)              export ICON="";export DISTRO="Raspbian";;
        *ubuntu*)                export ICON="";export DISTRO="Ubuntu";;
        *elementary*)            export ICON="";export DISTRO="Elementary";;
        *fedora*)                export ICON="";export DISTRO="Fedora";;
        *coreos*)                export ICON="";export DISTRO="CoreOS";;
        *gentoo*)                export ICON="";export DISTRO="Gentoo";;
        *mageia*)                export ICON="";export DISTRO="Mageia";;
        *centos*)                export ICON="";export DISTRO="CentOS";;
        *opensuse*|*tumbleweed*) export ICON="";export DISTRO="SuSe";;
        *sabayon*)               export ICON="";export DISTRO="Sabayon";;
        *slackware*)             export ICON="";export DISTRO="Slackware";;
        *linuxmint*)             export ICON="";export DISTRO="Mint";;
        *alpine*)                export ICON="";export DISTRO="Alpine";;
        *aosc*)                  export ICON="";export DISTRO="AOSC";;
        *nixos*)                 export ICON="";export DISTRO="NixOS";;
        *devuan*)                export ICON="";export DISTRO="Devuan";;
        *manjaro*)               export ICON="";export DISTRO="Manjaro";;
        *rhel*)                  export ICON="";export DISTRO="RedHat";;
        *macos*)                 export ICON="";export DISTRO="macOS";;
        *)                       export ICON="";export DISTRO="Linux";;
    esac
}