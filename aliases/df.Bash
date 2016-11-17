# pydf
if [ -f /usr/bin/pydf ]; then
    # OMFG PyDF is Freaking Awesome yum install pydf or apt-get install pydf
    alias df='pydf'
else
    alias df='sudo /bin/df -hP | column -t'
fi