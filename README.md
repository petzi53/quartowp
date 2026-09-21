
<!-- README.md is generated from README.Rmd. Please edit that file -->

# quartowp

<!-- badges: start -->

[![R-CMD-check](https://github.com/petzi53/quartowp/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/petzi53/quartowp/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

{**quartowp**} is an R package for publishing Quarto documents to
WordPress.

## Project goal

The goal of {**quartowp**} is to make it easy to publish a rendered
Quarto document to WordPress without manually copying text, uploading
figures, and recreating tables.

The package is intended to bridge the gap between a reproducible Quarto
workflow and WordPress publishing.

## Planned functionality

{**quartowp**} is currently under development.

The planned workflow includes:

- rendering a Quarto document,
- extracting the generated HTML content,
- uploading figures and other media to the WordPress media library,
- updating image references in the generated HTML,
- preserving tables and other rendered output,
- and creating or updating a WordPress post through the WordPress REST
  API.

The aim is to keep the source document, analysis, figures, tables, and
WordPress publication in one reproducible workflow.

## Installation

You can install the development version of `quartowp` from GitHub with:

``` r
# install.packages("pak")
pak::pak("petzi53/quartowp")
```

Alternatively, using remotes:

``` r
# install.packages("remotes")
remotes::install_github("petzi53/quartowp")
```

## Planned usage

The intended interface should eventually be as simple as:

``` r
library(quartowp)

wp_publish("index.qmd")
```

`wp_publish()` is planned to render the Quarto document, process its
generated content and media, and publish the result to a configured
WordPress site.

## Development status

{**quartowp**} is at an early stage of development. The API described
above is a design goal and may change as the package develops.

Contributions, suggestions, and issue reports are welcome.
