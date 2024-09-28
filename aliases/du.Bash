Alias_Check "du"
if [ -x "$(command -v ncdu)" ]; then
    alias du='ncdu'
else
    alias du='du -h --max-depth=1'
fi
