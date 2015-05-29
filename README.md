# docker-shaarli
Docker file for running Shaarli. 

This pulls the the release from https://github.com/shaarli/Shaarli

Current version 0.0.45

## Installation
If you are installing it for the first time we will want to first build the image, then make a data container for the data, then finally run the container. This assumes that you have Docker installed and set up properly.

```
docker build -t shaarli https://github.com/elrac/docker-shaarli.git
docker create --name shaarli-data shaarli
docker run --volumes-from shaarli-data -p 8000:80 -d --name shaarli shaarli
```

It should then be available at http://localhost:8000

## Updating
To update you will want to bring down the running server, build the new one, and run it. We do not want to touch the shaarli-data container because that holds the preferences and all your links.

```
docker stop shaarli
docker rm shaarli
docker build -t shaarli https://github.com/elrac/docker-shaarli.git
docker run --volumes-from shaarli-data -p 8000:80 -d --name shaarli shaarli
```
