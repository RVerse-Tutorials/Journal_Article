README
================
EE Holmes

This shows a repository for writing a journal article.

The Rmd files create the manuscript as PDF or Word. Note that the tables do not look very good in Word.  Best to look at those in the pdf file.

To run
------

Download all the Rmd files. The README file is not needed.

If you do not have these packages installed, install the following from CRAN.

-   knitr
-   bibtex
-   forecast
-   gbRd
-   mgcv
-   stringr
-   rmarkdown
-   here

Running the Rmds requires pandoc with pandoc-citeproc installed (citeproc is doing the citations).  That should come by default but if you get a pandoc error, try installing from http://pandoc.org/installing.html. Now you can run the Rmd files for the paper.  If the RStudio complains that it cannot make a pdf, then click the little arrow next to the 'knitr' button at top (in RStudio) and you will see 'Knit to Word'.  Click that.

Note, to make PDF files you will need a LaTeX installation.  If you don't have one already (if you are not sure, then you don't), you can install [tinytex](https://yihui.name/tinytex/).  Run these lines:

```
install.packages('tinytex')
tinytex::install_tinytex()
```

Note that the first time you knit to a PDF, tinytex will have to install needed packages and this will take a long time (like up to 15-20 minutes). Just keep waiting as the little wheel spins on the R Markdown tab.

Structure
------------

* Main.Rmd The main text with title page an abstract
* Tables.Rmd Calls the Rmds for individual tables
* Figures.Rmd Calls the Rmds for individual figures
* Appendices.Rmd Calls the Rmds for individual appendices
* SupplementalInformation.Rmd
* References are in `Sardine.bib`. The formating file for the references is in `apa-edit.csl`. I editted that to look more like a typical fisheries journal format.
* Images are in the `images` folder
* Figures are saved to the `figures` folder
* Date is in the `data` folder. In that folder, it the script that creates the data frame used in the analyses: `dat_spawners.rdata`. The script that produced the catch and covariate data is not shown here, but would be in this folder too for the real paper.


To knit
-------------

-   Open Main.Rmd. To knit, click the 'knit' button in the top navbar in RStudio.  This will use the Rmd files for the tables and insert in the main document. The citations bib file is in the `Sardine.bib`. I maintain my references in EndNote and export to bibtex format (its one of the EndNote export options).

The main Rmd file, runs the Figures and Appendices, but you can make these separately too.

-   Open Figures.Rmd to knit the figures for the main paper. 
-   Open Tables.Rmd to knit the tables for the main paper. 
-   Open Appendices.Rmd to create the appendices. This will call the Rmd files for the appendix tables.

