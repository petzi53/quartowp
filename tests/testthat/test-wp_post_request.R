test_that("wp_post_request returns an httr2 request object", {
    url <- "https://example.com/wp-json/wp/v2/posts"

    credentials <- list(
        username = "username",
        password = "password"
    )

    data <- list(
        title = "Test post",
        content = "<p>WordPress blog test</p>",
        status = "draft"
    )

    req <- wp_post_request(url, credentials, data)
    expect_s3_class(req, "httr2_request")
    expect_equal(req$url, url)
    expect_equal(req$body$data, data)
    expect_equal(req$body$type, "json")
    expect_in("Authorization", names(req$headers))
})
