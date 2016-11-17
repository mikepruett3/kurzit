
test=$(type -t ls)
if [[ $test == alias ]]; then
    unalias ls
fi

alias ls='ls -h --color=tty'

alias ll='ls -l'
alias l='ls -la'
alias ldir='ll -d */'