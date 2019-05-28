#' Get path to learning materials
#'
#' This package includes lecture slides and other materials. This function shows you where to find them.
#'
#' @export
get_materials_path <- function() system.file("materials", package = "keitt.ssi.2019")

.onAttach <- function (libname, pkgname) {
  if(interactive())
    packageStartupMessage("Run: vignette('Introduction', package='keitt.ssi.2019')")
}

#' @export
fortify.RasterLayer <- function(x, maxpixels = 50000){
  raster <- raster::sampleRegular(x, maxpixels, asRaster = TRUE)
  if(nlayers(x) == 1 && is.factor(x)) raster <- raster::stack(raster,raster)  ## workaround raster bug #6043
  raster::as.data.frame(raster, xy = TRUE)
}

#' @export
fortify.RasterBrick <- function(...){
  fortify.RasterLayer(...)
}

#' @export
fortify.RasterStack <- function(...){
  fortify.RasterLayer(...)
}
