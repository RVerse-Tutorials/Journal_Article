README
================
EE Holmes

The Rmd files create the manuscript OilSardine\_NOAA\_MoES.pdf and the Word version with .docx. Note that the tables do not look very good in Word.  Best to look at those in the pdf file.

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

Install SardineForecast and rmarkdown from GitHub.  While you can install rmarkdown from CRAN, I use some features that have been fixed in the GitHub version.

        library(devtools)
        install_github("eeholmes/SardineForecast")
        install_github("rstudio/rmarkdown")

Now you can run the Rmd files for the paper.  If the RStudio complains that it cannot make a pdf, then click the little arrow next to the 'knitr' button at top (in RStudio) and you will see 'Knit to Word'.  Click that.

-   Open OilSardine\_NOAA\_MoES.Rmd and knit to make the main paper. To knit, click the 'knit' button in the top navbar in RStudio.  This will use the Rmd files for the tables and insert in the main document. The citations bib file is in the SardineForecast package.

The main OilSardine Rmd file, runs the Figures and Appendices, but you can make these separately too.

-   Open Figures.Rmd to knit the figures for the main paper. 
-   Open Appendices.Rmd to create the appendices. This will call the Rmd files for the appendix tables.

Status 11/23/2017
------

-   Next task is add non-spawner covariate tests to App B.  
-   Fix inclusion of 'future' covariates in App B tables.  So like Oct-Dec to explain Jul-Sep catch.
-   Add Table 3 which will summarize the covariate results.  
-   Test chlorophyl effect.  Need more data.
-   Look at whether the effects are time-varying?
-   Make the missing figures:

Figure 4. Cartoon of the sardine life-cycle in the SE Indian Ocean and how it interacts with the fishery. \[*missing*\]

Figure 10. Non-linear effect of temperature on catch during the spawning season (3rd quarter). \[*missing*\]

Figure 11. Fitted versus observed catch in the spawning period from the best covariate model. \[*missing*\]
