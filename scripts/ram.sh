#!/bin/bash
FREE_DATA=`free -m | grep Mem` 
CURRENT=`echo $FREE_DATA | cut -f3 -d' '`
TOTAL=`echo $FREE_DATA | cut -f2 -d' '`
CACHED=`echo $FREE_DATA | cut -f7 -d' '`
echo RAM: $(echo "scale = 2; 100-($CURRENT/$TOTAL*100-$CACHED/$TOTAL*100)" | bc)% free  
