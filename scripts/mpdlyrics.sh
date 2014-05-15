#!/bin/bash
cur=`mpc|head -n 2|tail -n 1|sed -e 's/.*#\([0-9]*\).*/\1/'`
prev=$cur
while [ 1 ];do
   sleep 1;
   cur=`mpc|head -n 2|tail -n 1|sed -e 's/.*#\([0-9]*\).*/\1/'`
   if [ $cur != $prev ];then
      clear
      mlyric.pl
      prev=$cur
   fi
done
