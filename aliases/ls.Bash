Alias_Check "ls"
if [[ $DIST == macOS ]] || [[ $DIST == BSD ]]; then
    alias ls='ls -G'
else
    alias ls='ls -h --color=auto'
fi

Alias_Check "ll"
alias ll='ls -l'

Alias_Check "l"
alias l='ls -la'

Alias_Check "ldir"
alias ldir='ll -d */'