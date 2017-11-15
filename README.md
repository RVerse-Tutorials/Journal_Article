README
================
EE Holmes

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

Now you can run the Rmd files for the paper.

-   Open OilSardine\_NOAA\_MoES.Rmd and knit to make the main paper. This will use the Rmd files for the tables and insert in the main document. The citations bib file is in the SardineForecast package.
-   Open Figures.Rmd to knit the figures for the main paper. Some of the figures are in the SardineForecast package.
-   Open Appendices.Rmd to create the appendices. This will call the Rmd files for the appendix tables.

Status 11/14/2017
------

-   Next task is clean up Table 2 code.  
-   Then the code for the spawner covariate tables.
-   [Started] Write code for the model selection for the non-spawner catch data.  The tables for the appendix are labelled Table A2 code.  For the main paper, just show the linearity test as in Table A2b.
-   Test chlorophyl effect.
-   Look at whether the effects are time-varying.
-   Make the missing figures:

Figure 4. Cartoon of the sardine life-cycle in the SE Indian Ocean and how it interacts with the fishery. \[*missing*\]

Figure 10. Non-linear effect of temperature on catch during the spawning season (3rd quarter). \[*missing*\]

Figure 11. Fitted versus observed catch in the spawning period from the best covariate model. \[*missing*\]
