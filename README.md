# PDFPageSplitter

> Source: https://unix.stackexchange.com/questions/405610/how-can-i-split-each-pdf-page-into-two-pages-using-the-command-line


```sh
 pdftk PDFNAME.pdf burst
```
pdfinfo pg_0001.pdf

```sh
script.sh
```

```sh
    ls -1 [lr]*_[0-9]*pdf | sort -n -k3 -t_ > fl
  pdftk `cat fl`  cat output newfile.pdf 

```
