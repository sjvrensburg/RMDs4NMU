# indiedown: customize options to rmarkdown::pdf_document() here

#' Customized R Markdown Document
#'
#' `AssignmentsRMD()` is the main function of the AssignmentsRMD package. Use as
#' `output: AssignmentsRMD::AssignmentsRMD` in the R Markdown YAML header.
#'
#' @param ... Passed on to [rmarkdown::pdf_document()].
#' @return R Markdown output format to pass to [rmarkdown::render()].
#' @export
AssignmentsRMD <- function(...) {
  indiedown_pdf_document_with_asset(
    highlight = "pygments",
    latex_engine = "lualatex",
    ...
  )
}
