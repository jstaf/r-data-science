# Some functions to make generating the website easier.

library(htmltools)
library(yaml)

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
    # figure out what comes next based on _site.yml
    # and include a link to the next section
    site <- yaml.load_file('_site.yml')
    menu <- site$navbar$right[[2]]$menu 
    print(commandArgs())
}

