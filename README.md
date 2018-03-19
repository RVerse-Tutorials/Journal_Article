README
================
EE Holmes

Paper centered on the GAM analysis of the environmental variables.

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


Update 11/30/2017
------
Completed
-   Made figure: Fitted versus observed catch in the spawning period from the best covariate model. 
-   Table for main text which will summarize the covariate results.  
-   Created Appendix for the chlorophyl effect.  Did separately since much less data.

To do
-   Need to qualify the R2 values.  That happens because catch was increasing over the 30-years.  It is a given that R2 will be high-ish.  The more important issue is covariates that improve R2.
-   Show R2 (or MSE) of for 10-year periods using the best models fit to the 32-years of data.

Update 11/29/2017
------
Completed
-   Added covariate effect figure for the most important covariates.  
-   Changed the covariate tables' data to interpolate 1994 Oct-Dec SST.  Since those months were missing, it meant I lost 2 years of data (1995 and 1994); that's ca 10 percent of the data.  So I replaced Oct-Dec 1994 with the 5-year average for those months.

To do
-   Add Table for main text which will summarize the covariate results.  
-   Test chlorophyl effect.  Do separately since much less data.
-   Make figure: Fitted versus observed catch in the spawning period from the best covariate model. 

Update 11/28/2017
------
Completed
-   Added non-spawner covariate tests to App B.  
-   Fixed bug in spawner covariate tables for App B.  
-   Fixed inclusion of 'future' covariates in App B tables.
-   Assigned Figure 4. Cartoon of the sardine life-cycle to Nimit/Sourav
-   Added man files to the R package for the SST and CHL data.  This documents exactly where the satellite data came from.  Use ?sst and ?chl from the R command line to view (after installing the SardineForecast package).  I also added copies of the ERDDAP html background files to a folder in the package to fully document where the satellite data came from.

To do:
-   See items in 11/23 status
-   Update Sardine.bib with the references added to REFERENCES.bib

Status 11/23/2017
------

-   Next task is add non-spawner covariate tests to App B.  [done]
-   Fix inclusion of 'future' covariates in App B tables.  So like Oct-Dec to explain Jul-Sep catch. [done]
-   Add Table 3 which will summarize the covariate results.  
-   Test chlorophyl effect.  Need more data. [not sure how to tackle this]
-   Look at whether the effects are time-varying? [different paper]
-   Make the missing figures:

Figure 4. Cartoon of the sardine life-cycle in the SE Indian Ocean and how it interacts with the fishery. \[*missing*\] [assigned to Nimit/Sourav]

Figure 10. Non-linear effect of temperature on catch during the spawning season (3rd quarter). \[*missing*\]

Figure 11. Fitted versus observed catch in the spawning period from the best covariate model. \[*missing*\]
