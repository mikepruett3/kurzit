# Installer Commands
Function_Check "stowth"
function stowth { stow -vSt ~ ${1}; }

Function_Check "unstow"
function unstow { stow -vDt ~ ${1}; }

# Check if $HOME/.dotfiles exists
DOTFILES_DIRS=(".dotfiles" "dotfiles")
for DIR in $DOTFILES_DIRS; do
    if [ -d $HOME/$DIR/ ]; then
        Alias_Check "dfup"
        function dfup () {
            pushd ${HOME}/${DIR}; git pull; popd;
            ${HOME}/${DIR}/setup.sh
        }
    fi
done
