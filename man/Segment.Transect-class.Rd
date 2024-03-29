% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Segment.Transect.R
\docType{class}
\name{Segment.Transect-class}
\alias{Segment.Transect-class}
\title{Class "Segmemt.Transect" extends Class "Line.Transect"}
\description{
Class \code{"Segment.Transect"} is an S4 class
detailing a set of transects from a point transect design.
}
\section{Slots}{

\describe{
\item{\code{seg.length}}{length of the transect segment.}

\item{\code{seg.threshold}}{this is a percentage threshold value applicable to segmented
grid designs controlling which partial segments are discarded around the survey
region boundary. By default, the value of 50, means that only segments that are
more than half inside the survey region will be retained. To retain all segments,
no matter how small they are when clipped to the survey region boundary set this
value to 0.}

\item{\code{offset}}{a value to offset a return transect by so segments become pairs of
segments (not yet implemented).}
}}

\seealso{
\code{\link{make.design}}
}
\keyword{classes}
