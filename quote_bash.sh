#!/bin/bash

# kalicieckid
# Do prawidłowego działania skryptu musimy zainstalować narzędzia html-xml-utils oraz w3m.
# Aby skrypt uruchamiał się przy starcie terminalu, dodaj ścieżkę w pliku ./bashrc.

#Sprawdzenie, czy mamy połączenie z internetem.
if  ping -q -c 1 -W 1 8.8.8.8 > /dev/null 
	then
		echo "Oto Twoja dzienna dawka humoru:"
		
		curl -s -L bash.org.pl/random > /home/$USER/content.html #Pobranie zawartości strony z losowym cytatem.

		cat /home/$USER/content.html | hxnormalize -x | hxselect '.post-body' | w3m -dump -cols 2000 -T 'text/html' #Wycięcie samego cytatu.
		else 
		echo "Błąd sieci!"
fi
