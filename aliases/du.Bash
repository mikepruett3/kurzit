# ncdu
if [ -f /usr/bin/ncdu ]; then
    # OMFG NCDU is Freaking Awesome yum install ncdu or apt-get install ncdu
    alias du='ncdu'
else
    alias du='du -h --max-depth=1'
fi
