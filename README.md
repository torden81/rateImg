
# evalImg

<!-- badges: start -->
<!-- badges: end -->

The goal of evalImg is to provide a collection of images that can be evaluated/rated by the user

## Installation

You can install the released version of evalImg from [github](https://github.com/torden81/evalImg) with devtools:

``` r
devtools::install_github("torden81/evalImg")
```

## Setting up images to be rated
Copy your images to be rated to the folder that is returned by
``` r
system.file("app/www", package = "evalImg")`
```

## Example

To start the shiny GUI run

``` r
evalImg::run_app()
```

Reading of the evaluation files can be done with `evalImg::readEvalFiles()` and returned as data.frame as a base for further analysis.
