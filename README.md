# PDFPageSplitter

>Splits pdf pages in half

The idea is to take in a full pdf (scanned book style) with two _actual_ book pages per pdf _page_.

The output should be a new pdf with it's pages matching the _actual_ book pages.

<br>

Keep in mind that your pdf has to be correctly scanned (all individual pages need to have the same measures and cutpoints).

<br>

## Requirements

* `pdftk`
    * To split the original pdf into its individual pages
* `pdfinfo`
    * Or anything that gives you the exact height and width of your pdf page
* `ghostscript`
    * Used in the script

<br>

## Usage

1. Burst your pdf into it's individual pages
```
pdftk PDFNAME.pdf burst
```

<br>

2. Use one of the pages to get the dimensions (or get them directly from the original pdf)
```
pdfinfo pg_0001.pdf
```
**Assign height and width** at the start of the script with corresponding values

<br>

4. Run the script (will output left and right cuts of the bursted pages)
```
./script.sh
```
**Check the new pages (left and right) for inadequate formatting** and modify left and right page start points within the script

Repeat until page formatting is adequate

<br>

5. Create a file to guide pdftk through the pages
```
ls -1 [lr]*_[0-9]*pdf | sort -n -k3 -t_ > fl
```

<br>

6. Build the new pdf
```
pdftk `cat fl`  cat output newfile.pdf 
```

<br>

## Source:

Got the original script from [this comment] on [this post].



<!-- Links -->

[this comment]: https://unix.stackexchange.com/a/407146
[this post]: https://unix.stackexchange.com/questions/405610/how-can-i-split-each-pdf-page-into-two-pages-using-the-command-line
