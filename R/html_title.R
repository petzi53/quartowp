#' Extract the title from rendered Quarto HTML
#'
#' @param file Path to a rendered HTML file.
#'
#' @return A character string containing the document title.
#'
#' @keywords internal
html_title <- function(file) {
    html <- xml2::read_html(file)

    content <- xml2::xml_find_first(
        html,
        "//h1[contains(
        concat(' ', normalize-space(@class), ' '),
        ' title '
    )]"
    )

    if (inherits(content, "xml_missing")) {
        stop("The Quarto document does not contain a title.")
    }

    xml2::xml_text(content)
}
