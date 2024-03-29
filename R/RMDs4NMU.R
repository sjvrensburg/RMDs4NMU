#' assignments
#'
#' A format for LaTeX typeset assignments and quizzes that use the exam
#' document class via rmarkdown.
#'
#' @param ... Additional arguments to [rmarkdown::pdf_document()]
#' @param keep_tex A boolean toggle to select whether intermediate
#'   LaTeX files are to be kept, defaults to `TRUE`
#'
#' @return R Markdown output to pass to [rmarkdown::render()]
#' @export
assignments <- function(..., keep_tex=TRUE) {
  template <- system.file(
    "rmarkdown", "templates", "assignment", "resources",
    "template.tex", package = "RMDs4NMU")
  instructions <- system.file(
    "rmarkdown", "templates", "assignment", "skeleton",
    "instructions.tex", package = "RMDs4NMU")
  base <- inherit_pdf_document(
    ..., template = template,
    keep_tex = keep_tex)
  base$knitr$opts_chunk$prompt    <- FALSE
  base$knitr$opts_chunk$comment   <- '# '
  base$knitr$opts_chunk$highlight <- TRUE

  return(base)
}

#' tests
#'
#' A format for LaTeX typeset tests that use the exam
#' document class via rmarkdown.
#'
#' @param ... Additional arguments to [rmarkdown::pdf_document()]
#' @param keep_tex A boolean toggle to select whether intermediate
#'   LaTeX files are to be kept, defaults to `TRUE`
#'
#' @return R Markdown output to pass to [rmarkdown::render()]
#' @export
tests <- function(..., keep_tex=TRUE) {
  template <- system.file(
    "rmarkdown", "templates", "test", "resources",
    "template.tex", package = "RMDs4NMU")
  instructions <- system.file(
    "rmarkdown", "templates", "test", "skeleton",
    "instructions.tex", package = "RMDs4NMU")
  base <- inherit_pdf_document(
    ..., template = template,
    keep_tex = keep_tex)
  base$knitr$opts_chunk$prompt    <- FALSE
  base$knitr$opts_chunk$comment   <- '# '
  base$knitr$opts_chunk$highlight <- TRUE

  return(base)
}


# Call rmarkdown::pdf_document and mark the return value as inheriting pdf_document
inherit_pdf_document <- function(...){
  fmt <- rmarkdown::pdf_document(highlight = "monochrome", ...)
  fmt$inherits <- "pdf_document"
  return(fmt)
}
