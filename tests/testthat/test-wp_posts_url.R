test_that("wp_posts_url creates the WordPress REST endpoint for posts", {
    withr::local_envvar(
        .new = list("QUARTOWP_URL" = "https://example.com")
    )
    wp_url <- wp_posts_url()

    expect_equal(wp_url, "https://example.com/wp-json/wp/v2/posts")
})

test_that("wp_posts_url handles a trailing slash in the WordPress URL", {
    withr::local_envvar(
        .new = list("QUARTOWP_URL" = "https://example.com/")
    )
    wp_url <- wp_posts_url()

    expect_equal(wp_url, "https://example.com/wp-json/wp/v2/posts")
})
