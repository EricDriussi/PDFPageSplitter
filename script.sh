#!/bin/bash

  width=$1
  height=$2
  halfWidth=$(( width / 2 ))
  w2px=$(( halfWidth*10 )) #No clue
  w3=$(( halfWidth+18 )) #No clue, why 18?
  hpx=$((  height*10 ))
  for f in  pg_[0-9]*.pdf ; do
   lf=left_$f
   rf=right_$f
   gs -o ${lf} -sDEVICE=pdfwrite -g${w2px}x${hpx} -c "<</PageOffset [0 0]>> setpagedevice" -f ${f} #[]needs tinkering
   gs -o ${rf} -sDEVICE=pdfwrite -g${w2px}x${hpx} -c "<</PageOffset [-${w3} 0]>> setpagedevice" -f ${f} #[]needs tinkering
  done

