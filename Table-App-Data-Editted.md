---
output:
  pdf_document: default
  html_document: default
---
Landings Data
=============

<h3>
Description
</h3>
<p>
A dataset containing the landings (in metric tons) of oil sardines in
Kerala state 1956-2016. The data are collected and
processed into a total landings estimates based on a stratified sampling
of landing sites along the SW coast of India throughout the year. The
program is run by the Central Marine Fisheries Research Institute
(CMFRI) in Cochin, India. The data were obtained from reports published
by CMFRI; see references.
</p>
<h3>
References
</h3>
<p>
CMFRI reports were downloaded from the CMFRI Publication repository
<a href="http://www.cmfri.org.in">http://www.cmfri.org.in</a>.
</p>
<p>
1956-1968 Antony Raja BT
(1969). “Indian oil sardine.” <em>CMFRI Bulletin</em>, <b>16</b>, 1-142.
</p>
<p>
1968-1978 Pillai VN (1982). <em>Physical characteristics of the coastal
waters off the south-west coast of India with an attempt to study the
possible relationship with sardine, mackerel and anchovy fisheries</em>.
Thesis, University of Cochin.
</p>
<p>
1975-1984 Kerala Jacob T, Rajendran V, Pillai PKM, Andrews J, Satyavan
UK (1987). “An appraisal of the marine fisheries in Kerala.” Central
Marine Fisheries Research Institute.
</p>
<p>
1975-1984 Kernataka Kurup KN, Nair GKK, Annam VP, Kant A, Beena MR,
Kambadkar L (1987). “An appraisal of the marine fisheries of Karnataka
and Goa.” Central Marine Fisheries Research Institute.
</p>
<p>
1985-2014 Provided by CMFRI directly via a data request.
</p>
<hr />


SST Data
========

<h3>
Description
</h3>
<p>
The SST satellite data were downloaded from the NOAA ERDDAP server using
R Mendels <code>rerddapXtracto</code> R package which uses the ropensci
<code>rerddap</code> R package. 
</p>
<h3>
Details
</h3>
<p>
For 1981 to 2003, We used the Pathfinder Version 5.2 (L3C) monthly day
and night product on a 0.0417 degree grid. These SST data use the
Advanced Very-High Resolution Radiometer (AVHRR) instrument on the
Pathfinder satellites. These data were provided by GHRSST and the US
National Oceanographic Data Center. This project was supported in part
by a grant from the NOAA Climate Data Record (CDR) Program for
satellites.
</p>
<p>
For 2004 to 2016, we used the NOAA CoastWatch sea surface temperature
(SST) products derived from NOAA’s Polar Operational Environmental
Satellites (POES). The SST estimates use the Advanced Very-High
Resolution Radiometer (AVHRR) instruments on the POES satellites and are
on a 0.1 degree grid.
</p>
<p>
Both SST data sets were downloaded from the NOAA ERDDAP server:

<a href="https://coastwatch.pfeg.noaa.gov/erddap/info/erdAGsstamday/index.html">https://coastwatch.pfeg.noaa.gov/erddap/info/erdAGsstamday/index.html</a>

<a href="https://coastwatch.pfeg.noaa.gov/erddap/info/erdPH2sstamday/index.html">https://coastwatch.pfeg.noaa.gov/erddap/info/erdPH2sstamday/index.html</a>.
</p>
<p>
The SST values were averaged across thirteen 1
degree by 1 degree boxes which roughly parallel the bathymetry (Figure 1 in main text).
</p>
<h3>
References
</h3>
<p>
These data were provided by GHRSST and the US National Oceanographic
Data Center. This project was supported in part by a grant from the NOAA
Climate Data Record (CDR) Program for satellites. The data were
downloaded from NOAA CoastWatch-West Coast Regional Node and Southwest
Fisheries Science Center’s Environmental Research Division. To cite
these data in a paper, please follow the instructions in the license and
at this link:
<a href="https://coastwatch.pfeg.noaa.gov/erddap/information.html#citeDataset">https://coastwatch.pfeg.noaa.gov/erddap/information.html\#citeDataset</a>
</p>
<p>
Casey KS, Brandon TB, Cornillon P, Evans R (2010). “The past, present,
and future of the AVHRR Pathfinder SST program.” In <em>Oceanography
from space</em>, 273–287. Springer.
</p>
<p>
Walton C, Pichel W, Sapper J, May D (1998). “The development and
operational application of nonlinear algorithms for the measurement of
sea surface temperatures with the NOAA polar-orbiting environmental
satellites.” <em>Journal of Geophysical Research: Oceans</em>,
<b>103</b>(C12), 27999–28012.
</p>

Upwelling Data
==============

<h3>
Description
</h3>
<p>
Three upwelling indices are in the ‘upw’ data object: a SST nearshore
offshore differential, a wind-based index and the Bakun indices. The
upwelling indices and SST data were downloaded from the NOAA ERDDAP
server using R Mendels <code>rerddapXtracto</code> R package which uses
the ropensci <code>rerddap</code> R package. 
</p>
<h3>
Details
</h3>
<p>
The Wind-based monthly upwelling indices were downloaded from the NOAA
ERDDAP server. The first is 1999-2009 on a 0.125 degree grid. The second
is 2009 to present on a 0.25 degree grid. and the second is See
<a href="https://coastwatch.pfeg.noaa.gov/erddap/info/erdQSstressmday/index.html">https://coastwatch.pfeg.noaa.gov/erddap/info/erdQSstressmday/index.html</a>
and
<a href="https://coastwatch.pfeg.noaa.gov/erddap/info/erdQAstressmday/index.html">https://coastwatch.pfeg.noaa.gov/erddap/info/erdQAstressmday/index.html</a>.
</p>
<p>
The SST differential upwelling indices were downloaded from the NOAA
ERDDAP server. The first is 1981-2012 on a 0.0417 degree grid. The
second is 2003-2016 on a 0.1 degree grid. Both are AVHRR so accurate for
close to the coast. </br>
<a href="https://coastwatch.pfeg.noaa.gov/erddap/info/erdPH2sstamday/index.html">https://coastwatch.pfeg.noaa.gov/erddap/info/erdPH2sstamday/index.html</a>
and </br>
<a href="https://coastwatch.pfeg.noaa.gov/erddap/info/erdAGsstamday/index.html">https://coastwatch.pfeg.noaa.gov/erddap/info/erdAGsstamday/index.html</a>.
The UPW index is the difference between the coast box (1 to 5) and a box
3 degrees offshore at the same latitude.
</p>
<p>
The Bakun index (The Bakun 1973) is calculated based upon Ekman’s theory
of mass transport due to wind stress. The index is computed from the
ektrx and ektry, which are the x- and y- components of Ekman Transport
obtained from the ERDDAP link below, and coast\_angle is 158 degrees for
the India west coast near Kochi.
<a href="https://coastwatch.pfeg.noaa.gov/erddap/info/erdlasFnWPr/index.html">https://coastwatch.pfeg.noaa.gov/erddap/info/erdlasFnWPr/index.html</a>.
The function to compute the Bakun index is at
<a href="https://oceanview.pfeg.noaa.gov/products/upwelling/bakun">https://oceanview.pfeg.noaa.gov/products/upwelling/bakun</a>.
</p>
<pre>
 upwell &lt;- function(ektrx, ektry, coast_angle) {
 pi &lt;- 3.1415927
 degtorad &lt;- pi/180.
 alpha &lt;- (360 - coast_angle) * degtorad
 s1 &lt;- cos(alpha)
 t1 &lt;- sin(alpha)
 s2 &lt;- -1 * t1
 t2 &lt;- s1
 perp &lt;- (s1 * ektrx) + (t1 * ektry)
 para &lt;- (s2 * ektrx) + (t2 * ektry)
 return(perp/10)
 }
</pre>
<h3>
References
</h3>
<p>
SST data: These data were provided by GHRSST and the US National
Oceanographic Data Center. This project was supported in part by a grant
from the NOAA Climate Data Record (CDR) Program for satellites. The data
were downloaded from NOAA CoastWatch-West Coast Regional Node and
Southwest Fisheries Science Center’s Environmental Research Division.
</p>
<p>
Wind-based UPW index: NOAA’s CoastWatch Program distributes wind
velocity measurements derived from the Seawinds instrument aboard NASA’s
QuikSCAT satellite. The Seawinds instrument is a dual-beam microwave
scatterometer designed to measure wind magnitude and direction over the
global oceans. CoastWatch further processes these wind velocity
measurements to wind stress and wind stress curl.
</p>
<p>
Bakun index: The Environmental Research Division (ERD), within NOAA
Fisheries, has long been a leader in development and calculation of
upwelling and other environmental indices. ERD was originally
established as the Pacific Environmental Group at the U.S. Navy Fleet
Numerical Meteorology and Oceanography Center (FNMOC) in Monterey,
California, to take advantage of the Navy’s global oceanographic and
meteorological models. FNMOC produces operational forecasts of the state
of the atmosphere and the ocean several times daily. Before the advent
of satellite oceanography, these forecasts provided global snapshots of
ocean conditions for Navy operations, but were also invaluable for
studies of fisheries climatology since they provided long time series of
environmental conditions at a much higher resolution than was possible
from direct measurement. The FNMOC sea-level pressure became the basis
of the Bakun upwelling index calculation, and provides estimates of
upwelling for the Northern Hemisphere starting in 1948 and globally
since 1981.
</p>
<p>
Bakun A (1973). “Coastal upwelling indices, west coast of North
America.” US Department of Commerce, NOAA Technical Report NMFS
SSRF-671.
</p>

Precipitation Data
==================

<h3>
Description
</h3>
<p>
Three precipition datasets off the SW coast of India. Two are satellite
derived and one is based on land gauges.
</p>
<h3>
Details
</h3>
<p>
The National Climatic Data Center provides basic information on the GPCP
Precipitation dataset. The dataset consists of monthly precipitation
estimates (average mm/day) from January 1979 to the present. The
precipitation estimates merge several satellite and in situ sources into
a final product. Data are provided on a 2.5 degree grid. The GPCP
Precipitation data are provided by the NOAA/NCEI Global Precipitation
Climatology Project and were downloaded from </br>
<a href="https://www.ncei.noaa.gov/data/global-precipitation-climatology-project-gpcp-monthly">https://www.ncei.noaa.gov/data/global-precipitation-climatology-project-gpcp-monthly</a>.
Two boxes were defined, one off the Kerala coast and one off the
Karnataka coast, and the average values of all grid points within these
boxes were used. The boxes are 
Kerala Lat(8.75,  11.25), Lon(73.25,  75.75)
Karnataka Lat(13.75,  16.25), Lon(71.25,  73.75)
</p>
<p>
The land gauge data is monthly, seasonal and annual rainfall (in mm)
area weighted average for each state in India starting from 1901
onwards. This data set is based on rain guages. The data are provided by
the India Meteorological Department (Ministry of Earth Sciences). The
1901 to 2014 data were downloaded from the Open Government Data Platform
India <a href="https://data.gov.in">https://data.gov.in</a>. The 2015 and 2016 data were extracted from the yearly
Rainfall Statistics reports (see references).
</p>
<p>
NASA’s Tropical Rainfall Measuring Mission (TRMM) website provides
background on the TRMM data
(<a href="https://pmm.nasa.gov/">https://pmm.nasa.gov/</a>). 1997 to
2015 monthly precipitation estimates on a 0.25 degree grid were
downloaded from the Tropical Rainfall Measuring Mission (TRMM) website.
The data are averaged in the 2.5 x 2.5 degree boxes used for the other
satellite data.
</p>
<h3>
References
</h3>
<p>
Adler R, Huffman G, Chang A, Ferraro R, Xie P, Janowiak J, Rudolf B,
Schneider U, Curtis S, Bolvin D, Gruber A, Susskind J, Arkin P (2003).
“The Version 2 Global Precipitation Climatology Project (GPCP) Monthly
Precipitation Analysis (1979-Present).” <em>Journal of
Hydrometeorology</em>, <b>4</b>, 1147-1167.
</p>
<p>
Adler R, Wang J, Sapiano M, Huffman G, Chiu L, Xie PP, Ferraro R,
Schneider U, Becker A, Bolvin D, Nelkin E, Gu G, Program NC (2016).
“Global Precipitation Climatology Project (GPCP) Climate Data Record
(CDR), Version 2.3 (Monthly).” National Centers for Environmental
Information. doi:
<a href="https://doi.org/10.7289/V56971M6">10.7289/V56971M6</a>.
</p>
<p>
Purohit MK, Kaur S (2016). “Rainfall Statistics of India - 2016.” India
Meterorological Department (Ministry of Earth Sciences).
<a href="http://hydro.imd.gov.in/hydrometweb/">http://hydro.imd.gov.in/hydrometweb/</a>.
</p>
<p>
Kothawale, D. R., and M. Rajeevan. 2017. Monthly, seasonal and annual rainfall time series for all-India, homogeneous regions and meteorological subdivisions: 1871-2016. Report, Indian Institute of Tropical Meteorology..
</p>
<p>
NCEI. (2017). Global Precipitation Climatology Project Monthly Product Version 2.3. Retrieved from National Centers for Environmental Information website:  
<a href="https://www.ncei.noaa.gov/data/global-precipitation-climatology-project-gpcp-monthly/access/">https://www.ncei.noaa.gov/data/global-precipitation-climatology-project-gpcp-monthly/access/</a>.
</p>

<hr />

Chlorophyll Data
================

<h3>
Description
</h3>
<p>
The CHL satellite data were downloaded from the NOAA ERDDAP server using
R Mendels <code>rerddapXtracto</code> R package which uses the ropensci
<code>rerddap</code> R package.
</p>
<h3>
Details
</h3>
<p>
The Chlorophyll-a products are developed by the Ocean Biology Processing
Group in the Ocean Ecology Laboratory at the NASA Goddard Space Flight
Center.
</p>
<p>
For 1997 to 2002, we used the Chlorophyll-a 2014.0 Reprocessing
(R2014.0) product from the Sea-viewing Wide Field-of-view Sensor
(SeaWiFS) on the Orbview-2 satellite. These data are on a 0.1 degree
grid. See reference below.
</p>
<p>
For 2003 to 2017, we used the MODIS-Aqua product on a 4km grid. These
CHL data are taken from measurements gathered by the Moderate Resolution
Imaging Spectroradiometer (MODIS) on NASA’s Aqua Spacecraft. See
reference below.
</p>
<p>
Both CHL data sets were downloaded from the NOAA ERDDAP server:

<a href="https://coastwatch.pfeg.noaa.gov/erddap/info/erdSW1chlamday/index.html">https://coastwatch.pfeg.noaa.gov/erddap/info/erdSW1chlamday/index.html</a>

<a href="https://coastwatch.pfeg.noaa.gov/erddap/info/erdMH1chlamday/index.html">https://coastwatch.pfeg.noaa.gov/erddap/info/erdMH1chlamday/index.html</a>.
</p>
<p>
The CHL values were averaged across thirteen 1
degree by 1 degree boxes which roughly parallel the bathymetry (Figure 1 in main text).
</p>
<h3>
References
</h3>
<p>
NASA Goddard Space Flight Center, Ocean Ecology Laboratory, Ocean
Biology Processing Group; (2014): SeaWiFS Ocean Color Data; NASA Goddard
Space Flight Center, Ocean Ecology Laboratory, Ocean Biology Processing
Group.
<a href="https://dx.doi.org/10.5067/ORBVIEW-2/SEAWIFS_OC.2014.0">https://dx.doi.org/10.5067/ORBVIEW-2/SEAWIFS\_OC.2014.0</a>
</p>
<p>
NASA Goddard Space Flight Center, Ocean Ecology Laboratory, Ocean
Biology Processing Group. Moderate-resolution Imaging Spectroradiometer
(MODIS) Aqua Chlorophyll Data; 2014 Reprocessing. NASA OB.DAAC,
Greenbelt, MD, USA.
<a href="https://dx.doi.org/10.5067/AQUA/MODIS/L3M/CHL/2014">https://dx.doi.org/10.5067/AQUA/MODIS/L3M/CHL/2014</a>
</p>
<p>
Hu C, Lee Z, Franz B (2012). “Chlorophyll aalgorithms for oligotrophic
oceans: A novel approach based on three-band reflectance difference.”
<em>Journal of Geophysical Research: Oceans</em>, <b>117</b>(C1).
</p>

ENSO Data
=========

<h3>
Description
</h3>
<p>
Oceanic Nino Index and Dipole Mode Index.
</p>
<h3>
Details
</h3>
<p>
The ONI index is 3 month running mean of ERSST.v5 SST anomalies in the
Niño 3.4 region (5°N-5°S, 120°-170°W)\], based on centered 30-year base
periods updated every 5 years.  
The ONI was downloaded from
<a href="http://www.cpc.ncep.noaa.gov/data/indices/oni.ascii.txt">http://www.cpc.ncep.noaa.gov/data/indices/oni.ascii.txt</a>
<p>
The DMI is the monthly Dipole Mode Index. The DMI (also IOD index) is defined by the SSTA difference between the
western Indian Ocean (10°S–10°N, 50°E–70°E) and the southeastern Indian
Ocean (10°S–0°, 90°E–110°E). The data were downloaded from  </br>
<a href="https://www.esrl.noaa.gov/psd/gcos_wgsp/Timeseries/Data/dmi.long.data">https://www.esrl.noaa.gov/psd/gcos_wgsp/Timeseries/Data/dmi.long.data</a>
</p>
<h3>
References
</h3>
<p>
Saji NH, Yamagata T (2003). “Possible impacts of Indian Ocean Dipole
mode events on global climate.” <em>Climate Research</em>, <b>25</b>(2),
151-169. doi:
<a href="https://doi.org/10.3354/cr025151">10.3354/cr025151</a>.
</p>
<hr />

