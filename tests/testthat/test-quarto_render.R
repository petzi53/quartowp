test_that("quarto_render renders a qmd file to HTML", {

    qmd <- tempfile(fileext = ".qmd")

    writeLines(
        c(
            "---",
            "title: \"Test document\"",
            "---",
            "",
            "# Hello",
            "",
            "This is a test."
        ),
        qmd
    )

    html <- quarto_render(qmd)

    expect_true(file.exists(html))
    expect_match(html, "\\.html$")

})
