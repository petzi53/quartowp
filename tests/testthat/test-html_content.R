test_that("html_content extracts the main content from rendered HTML", {
    html <- tempfile(fileext = ".html")

    writeLines(
        c(
            "<!DOCTYPE html>",
            "<html>",
            "<head><title>Test</title></head>",
            "<body>",
            '<main class="content" id="quarto-document-content">',
            '<header id="title-block-header">',
            '<h1 class="title">Test title</h1>',
            "</header>",
            '<section id="first-section" class="level2">',
            "<h2>Test heading</h2>",
            "<p>Test paragraph.</p>",
            "</section>",
            "</main>",
            "</body>",
            "</html>"
        ),
        html
    )

    result <- html_content(html)

    expect_type(result, "character")
    expect_match(result, "<h2>Test heading</h2>", fixed = TRUE)
    expect_match(result, "<p>Test paragraph.</p>", fixed = TRUE)

    expect_false(grepl("Test title", result, fixed = TRUE))
    expect_false(grepl("<html>", result, fixed = TRUE))
    expect_false(grepl("<head>", result, fixed = TRUE))
})
