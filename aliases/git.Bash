# Installer Commands
Alias_Check "gitreset"
alias gitreset="git fetch --all; git reset --hard origin/master; git pull"

# Git Pull specified directory
Alias_Check "gp"
alias gp="pushd ${1}; git pull; popd"
