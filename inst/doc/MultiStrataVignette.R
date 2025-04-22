## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----setseed, echo=FALSE------------------------------------------------------
set.seed(724)

## ----libload------------------------------------------------------------------
library(dssd)

## ----scansIIarea, fig.width=6, fig.height = 5, fig.align='center', fig.cap="Figure 2: Plot of an example study area comprising of 2 strata, a northern stratum and a southern stratum"----
shapefile.name <- system.file("extdata", "Strata.shp", package = "dssd")
region <- make.region(region.name = "study.area", 
                      strata.name = c("North", "South"),
                      shape = shapefile.name)
plot(region)

## ----covergrid, fig.width=6, fig.align='center', fig.asp=1, fig.cap="Figure 3: Coverage grid with approximately 1000 grid points."----
cover <- make.coverage(region,
                       n.grid.points = 1000)
plot(region, cover, cex = 0.7)

## ----setseed3, echo=FALSE-----------------------------------------------------
set.seed(937)

## ----defaultdesign, fig.asp = 1, fig.width=6, fig.align='center', fig.cap="Figure 4: Survey generated from on a multi-strata default design with stratum specific design angles. "----
default.design <- make.design(region = region,
                              transect.type = "line",
                              design = "systematic",
                              samplers = 20,
                              design.angle = c(155, 90),
                              edge.protocol = "minus",
                              truncation = 2000, 
                              coverage.grid = cover)
transects <- generate.transects(default.design)
plot(region, transects, lwd = 0.8, col = "blue")

## ----defaultdesign_survey-----------------------------------------------------
transects

## ----zz_sp, fig.asp = 1, fig.width=6, fig.align='center', fig.cap="Figure 5: Example survey from a mixed-type design with systematic parallel lines in the southern strata and an equal spaced zigzag designs in the northern strata."----
design <- make.design(region = region,
                              transect.type = "line",
                              design = c("eszigzag", "systematic"),
                              line.length = 1200000,
                              design.angle = c(65, 90),
                              bounding.shape = c("convex.hull", NA),
                              edge.protocol = "minus",
                              truncation = 2000,
                              coverage.grid = cover)
transects <- generate.transects(design)
plot(region, transects, lwd = 0.8, col = "blue")

## ----zz_sp_covnoeval, eval=FALSE----------------------------------------------
# design <- run.coverage(design, reps = 1000)
# plot(design)

## ----zz_sp_cov, echo = FALSE, fig.asp = 1, fig.width=5, fig.align='center', fig.cap="Figure 6: A plot of the coverage scores for the mixed type design, based on the generation of 500 surveys from this design."----
obj.name <- system.file("extdata/vigresults", "design_zz_sp.robj", package = "dssd")
load(obj.name)
plot(design)

## ----zz_sp_cov3---------------------------------------------------------------
design

## ----seg_design, fig.asp = 1, fig.width=6, fig.align='center', fig.cap="Figure 7: A single survey generated from a segmented grid design with different design parameters in each stratum."----
design <- make.design(region = region,
                      transect.type = "line",
                      design = "segmentedgrid",
                      spacing = c(10000,20000),
                      seg.length = c(5000,12000),
                      design.angle = c(150, 90),
                      seg.threshold = c(50,0), 
                      edge.protocol = "minus",
                      truncation = 3000,
                      coverage.grid = cover)
transects <- generate.transects(design)
plot(region, transects, lwd = 0.8, col = "blue")

## ----seg_design2, eval = FALSE------------------------------------------------
# design <- run.coverage(design, reps = 1000)
# plot(design)

## ----seg_design3, fig.asp = 1, echo = FALSE, fig.width=5, fig.align='center', fig.cap="Figure 8: Coverage scores plotted for the segmented grid design"----
obj.name <- system.file("extdata/vigresults", "design_seg.robj", package = "dssd")
load(obj.name)
plot(design)

## ----seg_design4, fig.asp = 1, fig.width=4.5, fig.align='center', fig.cap="Figure 9: Coverage scores plotted only for the northern stratum"----
plot(design, strata.id = 1, subtitle = "Coverage Northern Strata")

## ----seg_design5, fig.asp = 1, fig.width=4.5, fig.align='center', fig.cap="Figure 10: Coverage scores plotted only for the southern stratum"----
plot(design, strata.id = 2, subtitle = "Coverage Southern Strata")

## ----setseed2, echo=FALSE-----------------------------------------------------
set.seed(273)

## ----point_region, fig.align='center', fig.width=6, fig.height = 4.5, fig.cap = "Figure 11: Study region depicting an area of forest between Dundee and St Andrews in Scotland. It comprises of a main stratum and a Morton Loch stratum which forms part of a nature reserve in the area."----
#Load the unprojected shapefile
library(sf)
shapefile.name <- system.file("extdata", "TentsmuirUnproj.shp", package = "dssd")
sf.shape <- read_sf(shapefile.name)
# Define a European Albers Equal Area projection
proj4string <- "+proj=aea +lat_1=56 +lat_2=62 +lat_0=50 +lon_0=-3 +x_0=0 
                +y_0=0 +ellps=intl +units=m"
# Project the study area on to a flat plane
projected.shape <- st_transform(sf.shape, crs = proj4string)
# Create the survey region in dssd
region.tm <- make.region(region.name = "Tentsmuir",
                         strata.name = c("Main Area", "Morton Lochs"),
                         shape = projected.shape)
# Plot the survey region
plot(region.tm, legend.params = list(inset = c(-0.3,0)))
#Create a coverage grid
cover.tm <- make.coverage(region.tm, n.grid.points = 500)

## ----point_eg, fig.asp = 1, fig.width=6, fig.align='center', fig.cap="Figure 12: An example multi strata point transect survey."----
design.tm <- make.design(region = region.tm,
                      transect.type = "point",
                      design = "systematic",
                      samplers = 80,
                      effort.allocation = c(0.75,0.25), 
                      edge.protocol = c("minus","plus"),
                      truncation = 100,
                      coverage.grid = cover.tm)
transects.tm <- generate.transects(design.tm)
plot(region.tm, transects.tm, lwd = 0.8, col = "blue")

## ----point_eg2----------------------------------------------------------------
transects.tm

## ----makeown, fig.asp = 1, fig.width=6, fig.align='center', fig.cap="Figure 13: A single study region with multiple polygon parts."----
outer <- matrix(c(0,0,15,0,15,10,0,10,0,0),ncol=2, byrow=TRUE)
hole1 <- matrix(c(2,2,2,3,3,3,3,2,2,2),ncol=2, byrow=TRUE)
hole2 <- matrix(c(5,5,5,6,7,6,8,5.5,7,5,5,5),ncol=2, byrow=TRUE)
pol1 <- list(outer, hole1*1.5, hole2)
pol2 <- list(outer + 15, hole2*1.5 + 12)
pol3 <- list(outer + 30, hole2*2.5 + 20)
mp <- list(pol1,pol2,pol3)
mp1 <- sf::st_multipolygon(mp)

region <- make.region(region.name = "study.area", shape = mp1)
plot(region)

## ----makeown2, fig.asp = 1, fig.width=6, fig.height = 4, fig.align='center', fig.cap="Figure 14: A single study region with multiple polygon parts.  Each are separate strata."----
outer <- matrix(c(0,0,15,0,15,10,0,10,0,0),ncol=2, byrow=TRUE)
hole1 <- matrix(c(2,2,2,3,3,3,3,2,2,2),ncol=2, byrow=TRUE)
hole2 <- matrix(c(5,5,5,6,7,6,8,5.5,7,5,5,5),ncol=2, byrow=TRUE)
pol1 <- sf::st_polygon(list(outer, hole1*1.5, hole2))
pol2 <- sf::st_polygon(list(outer + 15, hole2*1.5 + 12))
pol3 <- sf::st_polygon(list(outer + 30, hole2*2.5 + 20))
sfc <- sf::st_sfc(pol1,pol2,pol3)
strata.names <- c("SW", "central", "NE")
mp1 <- sf::st_sf(strata = strata.names, geom = sfc)

region <- make.region(region.name = "study.area", 
                      strata.name = strata.names, 
                      shape = mp1)
plot(region)

