# dssd 1.0.3

Enhancements

* Updated web site links

# dssd 1.0.2

Bug Fixes

* Fixed Atlas bug by setting precision in Atlas environment when invalid shapes are detected.
 
Enhancements

* Enhanced message regarding strata names when they are provided but do not match the number of strata. 

# dssd 1.0.1

Bug Fixes

* Removed dependence on rgdal

# dssd 1.0.0

Bug Fixes

* Now accepts XYZ and XYM polygons (the Z and M information is removed when the region is created)

# dssd 0.3.4

Enhancements

* Can store design parameters associated with segmented trackline design for use with Distance for Windows (cannot generate transects for this design within dssd)
* Now checks shapefiles for LinkID ordering if being used by Distance for Windows

# dssd 0.3.3

Enhancements

* Minor change to retain on CRAN and pass noLD testing

# dssd 0.3.2

Enhancements

* Changed the default truncation distance to 50
* Remove dependency on 3Dplot (and therefore tcltk package)
* Minor code changes inline with CRAN coding policies

# dssd 0.3.1

Bug Fixes

* Minor fix as dssd was erroneously displaying a warning about possible unequal coverage when only a total number of samplers was supplied. This was not always applicable.

# dssd 0.3.0

New Features

* calculate.effort: calculates the estimated effort required in the main survey to achieve a given CV based on information from a pilot survey.
* Improved plotting using ggplot2.
* Added an example as to how to export transects to the Getting Started vignette.
* Improved effort allocation documentation.

Bug Fixes

* Clarified in documentation and via warnings and error messages when there was confusion in the specification of designs.
* Fixed effort allocation when there is a mix of random and systematic point transect designs and the design parameter supplied is the total number of samplers.
* Fixed effort allocation rounding when the total number of samplers is supplied for line transect designs. Previously it wasn't rounded so it automatically used the floor value which results in less transects than requested.
* Fixed segmented transect bug which generated an error when segment id's were not sequential (sometimes happens after clipping and not retaining all transects)


# dssd 0.2.2

* Exports the region class which is required for dsims

# dssd 0.2.1

Bug Fixes

* Minor documentation and import changes to pass CRAN checks

# dssd 0.2.0

New Features

* Segmented grid design
* Writes transects to gpx, csv and txt file
* Multi-strata vignette
* Coverage score statistics by stratum
* Option to run coverage simulation without progress counter output
* Plot and access coverage scores by stratum
* Use -1 to set a randomly generated design angle
* Updated Documentation

Bug Fixes

* Coordinate reference systems now stored in coverage and transect objects
* Fixed invalid shapefiles: AreaRStrata and AreaRProjStrata

# dssd 0.1.0

Enhancements

* Introducing the new Distance Sampling Survey Design package! We provide a number of survey design options which allow you to generate transects for distance sampling surveys.
* Point transects: Simple random sampling
* Point transects: Systematic grid with random start point
* Line transects: Parallel random lines
* Line transects: Systematic parallel lines with a random start
* Line transects: Equal spaced zigzags with a random start
* Line transects: Equal spaced zigzags with complementary set of zigzags
* Ability to vary design angle
* Survey generation by number of samplers, spacing or line length (can generate by different criteria in each strata)
* Ability to use different designs in each strata (as long as they are of the same type, i.e. all point or all line transects)
* Generate plus or minus sampling surveys
* Generate zigzag design inside minimum bounding rectangles (angled along the design axis) or convex hulls
* Calculates the coverage of different design by simulation
* Produces summary statistics from the coverage design showing the variability in number of samplers, line length, % coverage across surveys from a given design
