#' Start the Lite docker server
#' 
#' @param port the port to use (the default is 3838, the default for Shiny apps). Only change this if you experience problems.
#' @param name the name of the image created. If you change this, be sure to change it in the call to \code{iNZightLite::stop()}, too.
#' @param open logical, if set to \code{TRUE}, the app will open in a browser automatically
#' @return the URL to access the Lite app
#' @author Tom Elliott
#' @examples \dontrun{
#' lite <- iNZightLite::start()
#' # open in a browser
#' browseURL(url)
#' }
#' @export 
start <- function(port = "3838", name = "inzightlite", open = TRUE) {
    if (!docker.exists)
        stop("It looks like you haven't installed Docker. Please do this and try again.")
    
    cmd <- sprintf("docker run -tdp %s:3838 --name %s scienceis/uoa-inzight-lite:latest",
                   port, name)

    cont.id <- system(cmd, intern = TRUE)

    cat("iNZight Lite is now running. Open a browser and go to this URL:\n")
    url <- paste0("http://localhost:", port)
    cat("  ", url, "\n")

    if (open)
        utils::browseURL(url)

    invisible(url)
}

#' Stop running Lite process 
#' 
#' This command will also remove the container.
#' @param name the name of the container to stop (should be the same used in the call to \code{start()})
#' @return NULL
#' @author Tom Elliott
#' @export
stop <- function(name = "inzightlite") {
    cmd <- sprintf("docker stop %s && docker rm %s", name, name)
    cat("iNZight Lite is shutting down ... please wait a few moments ... ")
    x <- system(cmd, intern = TRUE)
    cat("done.\n")

    invisible(NULL)
}