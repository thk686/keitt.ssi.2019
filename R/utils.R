#' Get path to learning materials
#'
#' This package includes lecture slides and other materials. This function shows you where to find them.
#'
#' @export
get_materials_path <- function() system.file("materials", package = "keitt.ssi.2019")

.onAttach <- function (libname, pkgname) {
  packageStartupMessage("Run: vignette('Introduction', package='keitt.ssi.2019')")
}
