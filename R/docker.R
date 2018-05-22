docker.exists <- function() {
    info <- system('docker --version', intern = TRUE)
    return(length(info) == 1 && grepl("^Docker version", info))
}

