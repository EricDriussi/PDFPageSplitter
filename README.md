# PDFPageSplitter

>Splits pdf pages in half

The idea is to take in a full pdf (scanned book style) with two actual book pages per pdf page.

The output should be a new pdf with it's pages matching the actual book pages.

Keep in mind:

- Your pdf has to be correctly scanned. That is, all individual pages have the same measures and cutpoints.
- Manual tinkering within the script will be necessary to adjust for specifics


## Requirements

1. pdftk 
  * To split the original pdf into its individual pages
1. java-commons-lang
  * Required by pdftk for burst functionality
1. pdfinfo
  * Or anything that gives you the exact height and width of your pdf page
1. ghostscript
  * Used in the script

## Usage

Burst your pdf into it's individual pages
```
pdftk PDFNAME.pdf burst
```

Use one of the pages to get the dimensions (or get them directly from the original pdf)
`pdfinfo pg_0001.pdf`

Run the script (will output left and right cuts of the bursted pages)
```
./script.sh
```

Create a file to guide pdftk through the pages
```
ls -1 [lr]*_[0-9]*pdf | sort -n -k3 -t_ > fl
```

Build the new pdf
```
pdftk `cat fl`  cat output newfile.pdf 
```


> Source: https://unix.stackexchange.com/questions/405610/how-can-i-split-each-pdf-page-into-two-pages-using-the-command-line
