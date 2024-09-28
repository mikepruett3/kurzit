Alias_Check "df"
if [ -x "$(command -v pydf)" ]; then
    alias df='pydf'
else
    alias df='sudo /bin/df -hP | column -t'
fi
