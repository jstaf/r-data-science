# Some functions to make generating the website easier.

library(htmltools)
library(yaml)
library(stringr)
library(purrr)

ul <- tags$ul
li <- tags$li

callout <- function(title, div_class, ...) {
    # Create a random dialog of a certain class
    div(class = div_class,
        div(class = "panel-heading", 
			h3(class = "panel-title", title)
		),
        div(class = "panel-body", 
            ...
        )
    )
}


note <- function(title, ...) {
    # Create a note dialog
    return(callout(title, "panel panel-primary", ...))
}


exercise <- function(title, ...) { 
    # Create an exercise dialog
    return(callout(paste("Exercise -", title), "panel panel-danger", ...))
}


footer <- function() {
    # get which page is currently being made
    args <- commandArgs()
    filename <- str_extract(args[length(args)], "\\w+.Rmd")
    target <- str_replace(filename, ".Rmd", ".html")

    # determine next page from _site.yml
    site <- yaml.load_file('_site.yml')
    menu <- site$navbar$right[[2]]$menu 
    menu <- c(map_chr(menu, ~.x$href), "index.html")
    next_page <- menu[which(menu == target) + 1]

    # return a big, fat hyperlink
    return(a(href = next_page, h2("Next section")))
}

