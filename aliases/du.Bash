# ncdu
if [ -f /usr/bin/ncdu ] || [ -f /usr/local/bin/ncdu ]; then
    # OMFG NCDU is Freaking Awesome yum install ncdu or apt-get install ncdu
    Alias_Check "du"
    alias du='ncdu'
else
    Alias_Check "du"
    alias du='du -h ' #--max-depth=1'
fi
