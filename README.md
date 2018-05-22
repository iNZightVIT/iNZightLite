# iNZightLite: run iNZight Lite locally using Docker

## Install


1. Download and install Docker for your operating system: 
  - Windows: https://docs.docker.com/docker-for-windows/install/
  - Mac: https://docs.docker.com/docker-for-mac/install/
  - Linux (Ubuntu): https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce (others, find your own way)

2. Follow the instructions to get docker running on your machine. The easiest way to check is by opening Terminal (or Powershell on Windows) and typing `docker info`

3. Install the iNZightLite helper package:
```{r}
devtools::install_github('iNZightVIT/iNZightLite')
```


## Usage 

To start Lite, simply run
```{r}
iNZightLite::start()
```

When you're finished, stop the Docker process with
```{r}
iNZightLite::stop()
```
