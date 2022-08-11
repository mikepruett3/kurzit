# Installer Commands
Alias_Check "gitreset"
alias gitreset="git fetch --all; git reset --hard origin/master; git pull"

# Git Pull specified directory
Function_Check "gp"
function gp { pushd ${1}; git pull; popd; }

# Git Pull from the .kurzit directory
function updp { pushd ${kurzit_home}; git pull; popd; }
