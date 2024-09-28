#!/usr/bin/env bash

# Export needed Variables that match OS/Distribution/Version
function Get_Distro () {
    #MacOS/OSX
    #if [ -a /usr/bin/sw_vers ]; then
    #    export DISTVer=$(sw_vers | grep ProductVersion | awk '{ print $2 }')
    #    export DISTRel=$(sw_vers | grep ProductName | awk '{ print $2" "$3" "$4" "$5 }')
    #    export DIST=MacOS
    #fi

    #Cygwin
    #if [[ $Kern == CYGWIN* ]]; then
    #    export DISTVer=$KernVer
    #    export DISTRel=$Kern
    #    export DIST=Cygwin
    #fi

    #FreeBSD
    #if [[ $Kern == *BSD ]]; then
    #    export DISTVer=$KernVer
    #    export DISTRel=$Kern
    #    export DIST=BSD
    #fi

    if [ -x "$(command -v lsb_release)" ]; then
        _distro=$(lsb_release -i | cut -d ":" -f 2 | xargs | tr '[:upper:]' '[:lower:]')
    else
        # Borrowed from https://github.com/xcad2k/dotfiles/
        # find out which distribution we are running on
        LFILE="/etc/*-release"
        MFILE="/System/Library/CoreServices/SystemVersion.plist"
        _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
    fi

    # set an icon based on the distro
    # make sure your font is compatible with https://github.com/lukas-w/font-logos
    case $_distro in
        *kali*)                  ICON="ﴣ";DISTRO="Kail";;
        *arch*)                  ICON="";DISTRO="Arch";;
        *debian*)                ICON="";DISTRO="Debian";;
        *raspbian*)              ICON="";DISTRO="Raspbian";;
        *ubuntu*)                ICON="";DISTRO="Ubuntu";;
        *elementary*)            ICON="";DISTRO="Elementary";;
        *fedora*)                ICON="";DISTRO="Fedora";;
        *coreos*)                ICON="";DISTRO="CoreOS";;
        *gentoo*)                ICON="";DISTRO="Gentoo";;
        *mageia*)                ICON="";DISTRO="Mageia";;
        *centos*)                ICON="";DISTRO="CentOS";;
        *opensuse*|*tumbleweed*) ICON="";DISTRO="SuSe";;
        *sabayon*)               ICON="";DISTRO="Sabayon";;
        *slackware*)             ICON="";DISTRO="Slackware";;
        *linuxmint*)             ICON="";DISTRO="Mint";;
        *alpine*)                ICON="";DISTRO="Alpine";;
        *aosc*)                  ICON="";DISTRO="AOSC";;
        *nixos*)                 ICON="";DISTRO="NixOS";;
        *devuan*)                ICON="";DISTRO="Devuan";;
        *manjaro*)               ICON="";DISTRO="Manjaro";;
        *rhel*)                  ICON="";DISTRO="RedHat";;
        *macos*)                 ICON="";DISTRO="macOS";;
        *)                       ICON="";DISTRO="Linux";;
    esac
}