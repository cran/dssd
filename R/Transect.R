#' Virtual Class "Transect"
#'
#' Virtual Class \code{"Transect"} is an S4 class detailing a single survey, a
#' single set of transects.
#'
#' @name Transect-class
#' @title S4 Class "Transect"
#' @slot strata.names a character vector of the strata names
#' @slot design Describes the design algorithm used to create the survey.
#' @slot samplers Contains the survey transects
#' @slot strata.area The areas of the strata in the design
#' @slot cov.area The total areas sampled within each strata. Areas sampled
#' twice are counted twice.
#' @slot cov.area.polys The polygons representing the covered area of the
#' survey.
#' @slot samp.count Numeric value(s) giving the number of realised transects.
#' @slot effort.allocation a vector of probabilities determining how effort is
#' allocated between strata. Effort allocated based on area if left empty.
#' @slot spacing determines the spacing of systematic samplers
#' @slot design.angle numeric value detailing the angle of the design. Can provide
#' multiple values relating to strata. The use of the angle varies with design, it
#' can be either the angle of the grid of points, the angle of lines or the design
#' axis for the zigzag design.
#' @slot edge.protocol character value indicating whether a "plus" sampling or
#' "minus" sampling protocol is used.
#' @keywords classes
#' @export
#' @importFrom methods validObject
#' @seealso \code{\link{make.design}}
setClass(Class = "Transect",
         representation = representation(strata.names = "character",
                                         design = "character",
                                         samplers = "list",
                                         strata.area  = "numeric",
                                         cov.area = "numeric",
                                         cov.area.polys = "list",
                                         samp.count = "numeric",
                                         effort.allocation  = "numeric",
                                         spacing = "numeric",
                                         design.angle = "numeric",
                                         edge.protocol = "character", "VIRTUAL")
)

setValidity("Transect",
            function(object){
              return(TRUE)
            }
)

