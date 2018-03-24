# In order to get it working install html-xml-utils and w3m
# Add path to ./bashrc file in order to enjoy this while 
# getting terminal up.


echo "Oto Twoja dzienna dawka humoru:"

curl -s -L bash.org.pl/random > content.html

cat content.html | hxnormalize -x | hxselect '.post-body' | w3m -dump -cols 2000 -T 'text/html'
