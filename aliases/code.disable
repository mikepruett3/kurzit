# Added for blurryness on Wayland
# https://github.com/microsoft/vscode/issues/192590
#Function_Check "code"
#if [ -z "$XDG_SESSION_TYPE" ] || [ "$XDG_SESSION_TYPE" = "wayland" ]; then
#    function code {
#        eval "$(which code) --ozone-platform=wayland ${1}"
#    }
#fi

export ELECTRON_OZONE_PLATFORM_HINT=wayland
