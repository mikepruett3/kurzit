# Common Utility Aliases
Alias_Check "vi"
alias vi='vim'

Alias_Check "wget"
alias wget='wget -c'

# Make basic commands interactive, and verbose
Alias_Check "cp"
alias cp='cp -iv'

Alias_Check "rm"
alias rm='rm -i'

Alias_Check "mv"
alias mv='mv -iv'

Alias_Check "grep"
alias grep='grep -i'

Alias_Check "mkdir"
alias mkdir='mkdir -pv'

Function_Check "srcp"
function srcp {
    if [[ ! -e "$HOME/.bash_profile" ]]; then
        source "$HOME/.profile"
    else
        source "$HOME/.bash_profile"
    fi
}
