 #!/bin/bash

# monitor.sh - Saves a copy of, then uses diff to check if changes to the web page in $URL have been made
# If a change is detected, the script will send an email notification

UNAME="me@gmail.com"
PW="####"
URL="http://website.com/i/am/stalking"

if [[ -e new.html ]]; then
    
else
    mv new.html old.html 2> /dev/null
fi

curl $URL -L --compressed -s > new.html
DIFFSTDOUT="$(diff new.html old.html)"

if [ "0" != "${#DIFFSTDOUT}" ]; then
  sendEmail -f $UNAME -s smtp.gmail.com:587 \
    -xu $USERNAME -xp $PW -t $UNAME \
    -o tls=yes -u "The Website you are monitoring has changed"
    -m "Visit it at $URL"
    fi
done
