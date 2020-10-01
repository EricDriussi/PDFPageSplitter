#!/bin/bash

  width=783
  height=559
  halfWidth=$(( width / 2 ))
  w2px=$(( halfWidth*10 )) 
  hpx=$((  height*10 ))

#left page start point
  lx=0
  ly=0
#right page start point
  rx=$(( halfWidth+0 ))
  ry=0

  for f in  pg_[0-9]*.pdf ; do
   lf=left_$f
   rf=right_$f
   gs -o ${lf} -sDEVICE=pdfwrite -g${w2px}x${hpx} -c "<</PageOffset [${lx} ${ly}]>> setpagedevice" -f ${f} 
   gs -o ${rf} -sDEVICE=pdfwrite -g${w2px}x${hpx} -c "<</PageOffset [-${rx} ${ry}]>> setpagedevice" -f ${f}
  done

