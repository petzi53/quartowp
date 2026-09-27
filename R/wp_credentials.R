wp_credentials <- function() {

    my_credentials <-  list()
    # Read environment variables
    my_credentials$username <-  Sys.getenv("QUARTOWP_USER")
    my_credentials$password <-  Sys.getenv("QUARTOWP_APP_PASSWORD")

    if (my_credentials$username == "" &&
        my_credentials$password == "")
            stop("Authentication values missing")

    if (my_credentials$username == "")
            stop("WordPress username missing")

    if (my_credentials$password == "")
            stop("WordPress application password missing")

    my_credentials
}

