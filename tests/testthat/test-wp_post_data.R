test_that("wp_post_data creates WordPress post data", {
    result <- wp_post_data(
        title = "Test title",
        content = "<p>Test content</p>",
        status = "draft"
    )

    expect_type(result, "list")
    expect_equal(result$title, "Test title")
    expect_equal(result$content, "<p>Test content</p>")
    expect_equal(result$status, "draft")
})
