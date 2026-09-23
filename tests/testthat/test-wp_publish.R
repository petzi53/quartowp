test_that("wp_publish rejects a nonexistent file", {

    expect_error(
        wp_publish("does-not-exist.qmd"),
        "Input file does not exist"
    )

})

test_that("wp_publish rejects non-Quarto files", {

    file <- tempfile(fileext = ".txt")
    file.create(file)

    expect_error(
        wp_publish(file),
        "Input file must be a Quarto"
    )

})

test_that("wp_publish renders a Quarto document and creates a quartowp_post object", {

    file <- tempfile(fileext = ".qmd")
    writeLines("# Test post", file)

    result <- wp_publish(file)

    expect_s3_class(result, "quartowp_post")
    expect_equal(result$input, normalizePath(file))
    expect_true(file.exists(result$rendered))
    expect_match(result$rendered, "\\.html$")
    expect_equal(result$status, "draft")

})

test_that("wp_publish validates post status", {

    file <- tempfile(fileext = ".qmd")
    writeLines("# Test post", file)

    result <- wp_publish(file, status = "publish")

    expect_equal(result$status, "publish")

    expect_error(
        wp_publish(file, status = "invalid"),
        "should be one of"
    )

})

