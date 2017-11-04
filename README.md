README
================
EE Holmes
November 3, 2017

To run
------

Download all the Rmd files. The README file is not needed.

-   Install SardineForecast from GitHub.

        library(devtools)
        install_github("eeholmes/SardineForecast")

-   Open OilSardine\_NOAA\_MoES.Rmd and knit to make the main paper. This will use the Rmd files for the tables and insert in the main document. The citations bib file is in the SardineForecast package.
-   Open Figures.Rmd to knit the figures for the main paper. Some of the figures are in the SardineForecast package.
-   Open Appendices.Rmd to create the appendices. This will call the Rmd files for the appendix tables.

Status
------

-   Next task is clean up Table 2 code.
-   Then the code for the spawner covariate tables.
-   After that write code for the model selection for the non-spawner catch data.
-   Look at chlorophyl
-   Look at whether the effects are time-varying.
-   Make the missing figures:

Figure 4. Cartoon of the sardine life-cycle in the SE Indian Ocean and how it interacts with the fishery. \[*missing*\]

Figure 5. Chlorophyll-a bloom intensity in quarter 2 versus quarter 4 of 2017. Data from NOAA. \[*missing*\]

Figure 9. Monthly SST 1981-2012 off the Kerala coast. \[*missing*\]

Figure 10. Non-linear effect of temperature on catch during the spawning season (3rd quarter). \[*missing*\]

Figure 11. Fitted versus observed catch in the spawning period from the best covariate model. \[*missing*\]
