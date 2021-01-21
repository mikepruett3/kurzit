# Installer Commands
Function_Check "stowth"
function stowth { stow -vSt ~ ${1}; }

Function_Check "unstow"
function unstow { stow -vDt ~ ${1}; }
