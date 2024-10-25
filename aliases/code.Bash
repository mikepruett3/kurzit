Function_Check "code"
if [ -z "$XDG_SESSION_TYPE" ] || [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    function code {
        code --ozone-platform=wayland ${1}
    }
fi
