quarto_render <- function(file) {
    quarto::quarto_render(
        input = file,
        output_format = "html",
        quiet = TRUE
    )

    output <- sub("\\.qmd$", ".html", file, ignore.case = TRUE)

    if (!file.exists(output)) {
        stop(
            "Quarto rendering did not produce an HTML file.",
            call. = FALSE
        )
    }

    normalizePath(output, mustWork = TRUE)
}
