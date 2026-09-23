html_content <- function(file) {
    html <- xml2::read_html(file)

    main <- xml2::xml_find_first(html, "//main")

    content <- xml2::xml_children(main)

    content <- content[
        xml2::xml_name(content) != "header"
    ]

    paste(
        as.character(content),
        collapse = "\n"
    )
}
