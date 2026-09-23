#' Publish a Quarto document to WordPress
#'
#' @param input Path to a Quarto document. If `NULL`, the currently active
#'   source document in RStudio or Positron is used via `rstudioapi`.
#' @param status WordPress post status.
#'
#' @return An object of class `quartowp_post`.
#' @export
wp_publish <- function(input = NULL, status = "draft") {

    # If no input is supplied, use the active source document
    # in RStudio or Positron.
    if (is.null(input)) {
        if (!requireNamespace("rstudioapi", quietly = TRUE) ||
            !rstudioapi::isAvailable()) {
            stop(
                "No input file supplied and RStudio or Positron is not available.",
                call. = FALSE
            )
        }

        input <- rstudioapi::getSourceEditorContext()$path

        if (!nzchar(input)) {
            stop(
                "No input file supplied and no saved source document is active.",
                call. = FALSE
            )
        }
    }

    # Check that the input file exists.
    if (!file.exists(input)) {
        stop(
            "Input file does not exist: ",
            input,
            call. = FALSE
        )
    }

    # Check that the input file is a Quarto document.
    if (!grepl("\\.qmd$", input, ignore.case = TRUE)) {
        stop(
            "Input file must be a Quarto (.qmd) document.",
            call. = FALSE
        )
    }

    # Validate the requested WordPress post status.
    status <- match.arg(
        status,
        choices = c("draft", "publish")
    )

    # Render the Quarto document.
    rendered <- quarto_render(input)

    # Create the result object.
    result <- list(
        input = normalizePath(input),
        rendered = rendered,
        status = status
    )

    # Turn the ordinary list into an S3 object.
    class(result) <- "quartowp_post"

    result
}
