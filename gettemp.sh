#/bin/sh
sensors | grep -m 2 'temp1' | awk 'NR==2' | cut -c 16-19 | sed '/^$/d'
