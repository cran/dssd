## ----region, fig.align='center', fig.cap="Figure 1: The study region.", fig.width=6, fig.height=4----
library(dssd)
shapefile.name <- system.file("extdata", "TrackExample.shp", package = "dssd")
region <- make.region(region.name = "study area",
                      shape = shapefile.name)
plot(region)

## ----covergrid----------------------------------------------------------------
cover <- make.coverage(region,
                       n.grid.points = 1000)

## ----design-------------------------------------------------------------------
design <- make.design(region = region, 
                      design = "systematic",
                      line.length = 1300,
                      edge.protocol = "minus",
                      design.angle = 0,
                      truncation = 2,
                      coverage.grid = cover)


## ----seed, echo=FALSE---------------------------------------------------------
set.seed(474)

## ----transects, fig.align='center', fig.cap="Figure 2: An example set of transects generated from the design plotted within the study region.", fig.width=6, fig.height=4----
transects <- generate.transects(design)
transects
plot(region, transects)

## ----coveredarea, fig.align='center', fig.cap="Figure 3: An example set of transects generated from the design along with the covered area shown by the black rectangles around the transects.", fig.width=6, fig.height=4----
plot(region, transects, covered.area = TRUE)

## ----coverage, eval=FALSE-----------------------------------------------------
#  design <- run.coverage(design, reps = 999)

## ----coverage2, echo=FALSE----------------------------------------------------
filename <- system.file("extdata/vigresults", "GSdesign.robj", package = "dssd")
load(filename)

## ----coverage3, fig.align='center', fig.cap="Figure 4: The coverage grid", fig.width=6, fig.height=4----
plot(design, subtitle = "Systematic Parallel, line.length = 1300km")

## ----designstats2, eval = FALSE-----------------------------------------------
#  design

## ----designstats, echo = FALSE------------------------------------------------
ops <- options(warn = -1)
design
options <- ops

## ----coverage4, fig.align='center', fig.cap="Figure 5: Histogram of coverage scores", fig.width=6, fig.height=4----
hist(get.coverage(design), xlab = "Coverage Scores", main = "Histogram of Coverage Scores")

## ----exportshp----------------------------------------------------------------
# File destination - .txt file
file.path <- paste0(tempdir(), "/", "transects.txt")
# Write to .txt file
write.transects(transects, dsn = file.path)


# File destination - .shp file
file.path <- paste0(tempdir(), "/", "transects.shp")
# Write to shapefile
write.transects(transects, dsn = file.path)

