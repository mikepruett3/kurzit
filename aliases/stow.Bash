# Installer Commands
Function_Check "stowth"
function stowth { stow -vSt ~ ${1}; }

Function_Check "unstow"
function unstow { stow -vDt ~ ${1}; }

# Check if $HOME/.dotfiles exists
DOTFILES_DIRS=(".dotfiles" "dotfiles")
for DIR in "${DOTFILES_DIRS[@]}"; do
    if [ -d $HOME/$DIR/ ]; then
        DOTFILES="$HOME/$DIR"
        Alias_Check "dfup"
        function dfup () {
            pushd "$DOTFILES"; git pull; popd;
            "$DOTFILES"/setup.sh
        }
    fi
done
