#' Create the WordPress REST endpoint for posts
#'
#' @return A character string containing the WordPress REST API endpoint for posts.
#' @keywords internal
wp_posts_url <- function() {

    rest_endpoint <- "/wp-json/wp/v2/posts"
    basic_url <- Sys.getenv("QUARTOWP_URL")

    basic_url <- sub("/$", "", basic_url)
    paste0(basic_url, rest_endpoint)
}
