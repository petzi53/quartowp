#' Create WordPress post data
#'
#' @param title Post title.
#' @param content Post content as HTML.
#' @param status WordPress post status.
#'
#' @return A list containing the WordPress post data.
#' @keywords internal
wp_post_data <- function(title, content, status) {
    list(
        title = title,
        content = content,
        status = status
    )
}
