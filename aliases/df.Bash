# pydf
if [ -f /usr/bin/pydf ]; then
    # OMFG PyDF is Freaking Awesome yum install pydf or apt-get install pydf
    Alias_Check "df"
    alias df='pydf'
else
    Alias_Check "df"
    alias df='sudo /bin/df -hP | column -t'
fi