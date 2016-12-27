# Bash History Customizations
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL=ignoredups
export HISTIGNORE='&:exit:history:hh:hc:ls:ll:l:ifconfig:shutdown:reboot'

# History Aliases
Alias_Check "hh"
alias hh='history'

Alias_Check "hc"
alias hc='history -c'