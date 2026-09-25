test_that("html_title extracts the title from a rendered HTML document", {
    html <- tempfile(fileext = ".html")

    writeLines(
        c(
            "<!DOCTYPE html>",
            "<html>",
            "<head><title>Test</title></head>",
            "<body>",
            '<main class="content" id="quarto-document-content">',
            '<header id="title-block-header">',
            '<h1 class="title">My Test Article</h1>',
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

    result <- html_title(html)

    expect_equal(result, "My Test Article")
})

test_that("html_title extracts the title when h1 has additional classes", {
    html <- tempfile(fileext = ".html")

    writeLines(
        c(
            "<!DOCTYPE html>",
            "<html>",
            "<head><title>Test</title></head>",
            "<body>",
            '<main class="content" id="quarto-document-content">',
            '<header id="title-block-header">',
            '<h1 class="title extra-class">My Test Article</h1>',
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

    result <- html_title(html)

    expect_equal(result, "My Test Article")
})

test_that("html_title throws error when h1 class='title' is missing", {
    html <- tempfile(fileext = ".html")

    writeLines(
        c(
            "<!DOCTYPE html>",
            "<html>",
            "<head><title>Test</title></head>",
            "<body>",
            '<main class="content" id="quarto-document-content">',
            '<header id="title-block-header">',
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

    expect_error(
        html_title(html),
        "The Quarto document does not contain a title."
    )
})
