# PDFPageSplitter

` pdftk PDFNAME.pdf burst

-----
#!/bin/bash
  #pw=`cat doc_data.txt  | grep PageMediaDimensions | head -1 | awk '{print $2}'` le_dimension_x
  #ph=`cat doc_data.txt  | grep PageMediaDimensions | head -1 | awk '{print $3}'` le_dimension_y
  pw=783
  ph=559
  w2=$(( pw / 2 ))
  w2px=$(( w2*10 ))
  #  w3=$(( w2+18 )) 
  hpx=$((  ph*10 ))
  for f in  pg_[0-9]*.pdf ; do
   lf=left_$f
   rf=right_$f
   gs -o ${lf} -sDEVICE=pdfwrite -g${w2px}x${hpx} -c "<</PageOffset [0 0]>> setpagedevice" -f ${f} #[]needs tinkering
   gs -o ${rf} -sDEVICE=pdfwrite -g${w2px}x${hpx} -c "<</PageOffset [-${w3} 0]>> setpagedevice" -f ${f} #[]needs tinkering
  done
-----

    ls -1 [lr]*_[0-9]*pdf | sort -n -k3 -t_ > fl
  pdftk `cat fl`  cat output newfile.pdf 
`