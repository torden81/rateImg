
# evalImg

<!-- badges: start -->
<!-- badges: end -->

The goal of rateImg is to provide a collection of images that can be evaluated/rated by the user

## Installation

You can install the released version of rateImg from [github](https://github.com/torden81/rateImg) with devtools:

``` r
devtools::install_github("torden81/rateImg")
```

## Setting up images to be rated
Copy your images to be rated to the folder that is returned by
``` r
system.file("app/www", package = "rateImg")`
```

## Example

To start the shiny GUI run

``` r
rateImg::run_app()
```

Reading of the evaluation files can be done with `rateImg::readEvalFiles()` and returned as data.frame as a base for further analysis.
