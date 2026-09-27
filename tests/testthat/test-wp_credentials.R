test_that("wp_credentials returns list of authentication values", {
    withr::local_envvar(
        .new = list("QUARTOWP_USER" = "testuser",
                    "QUARTOWP_APP_PASSWORD" = "testpassword")
    )
    credentials <- wp_credentials()
    expect_equal(credentials$username, "testuser")
    expect_equal(credentials$password, "testpassword")
})

test_that("wp_credentials returns error message when authentication values are missing", {
    withr::local_envvar(
        .new = list("QUARTOWP_USER" = NA,
                    "QUARTOWP_APP_PASSWORD" = NA)
    )

    expect_error(wp_credentials(), "Authentication values missing")
})

test_that("wp_credentials returns error message when username is missing", {
    withr::local_envvar(
        .new = list("QUARTOWP_USER" = NA,
                    "QUARTOWP_APP_PASSWORD" = "testpassword")
    )

    expect_error(wp_credentials(), "WordPress username missing")
})

test_that("wp_credentials returns error message when password is missing", {
    withr::local_envvar(
        .new = list("QUARTOWP_USER" = "testuser",
                    "QUARTOWP_APP_PASSWORD" = NA)
    )

    expect_error(wp_credentials(), "WordPress application password missing")
})
