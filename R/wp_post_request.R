wp_post_request <- function(url, credentials, data) {
    request <- httr2::request(url)
    request <- httr2::req_auth_basic(
        request,
        credentials$username,
        credentials$password
        )
    request <- httr2::req_body_json(
        request,
        data
    )
    request
}
q
