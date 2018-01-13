r-data-science
====================================

This is a website designed to teach the basics of coding in R.
This is a rewrite of my original materials at https://sudo-labs.github.io/r-data-science.
The website was rewritten to use RMarkdown instead of blogdown,
since the Hugo theme used in the blogdown site 
no longer builds with the latest version of blogdown.

## Building the website

Install the requisite R packages and make sure GNU make is installed.

```{r}
install.packages(c("rmarkdown", "tidyverse", "gapminder", "nycflights13", "stringr", "htmltools", "yaml"))
```

To build and view the website, just run `make`.
(it will attempt to open a firefox window to view it).

