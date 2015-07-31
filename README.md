# docker-shaarli
Docker file for running Shaarli. 

The automated build is located at https://registry.hub.docker.com/u/elrac/shaarli/

The GitHub repo is located at https://github.com/elrac/docker-shaarli

This pulls the the release from https://github.com/shaarli/Shaarli

Current version 0.5.0

## From docker repos

### Installation
If you are installing it for the first time you will want to first make a data container for the data, then run the container. 

This assumes that you have Docker installed and set up properly.

```
docker create --name shaarli-data elrac/shaarli
docker run --volumes-from shaarli-data -p 8000:80 -d --name shaarli elrac/shaarli
```

It should then be available at http://localhost:8000

### Updating
To update you will want to bring down the running server, update, and run the new one. We do not want to touch the shaarli-data container because that holds the preferences and all your links.

```
docker stop shaarli
docker rm shaarli
docker pull elrac/shaarli
docker run --volumes-from shaarli-data -p 8000:80 -d --name shaarli elrac/shaarli
```


## From GitHub

### Installation
If you are installing it for the first time we will want to first build the image, then make a data container for the data, then finally run the container. This assumes that you have Docker installed and set up properly.

```
docker build -t shaarli https://github.com/elrac/docker-shaarli.git
docker create --name shaarli-data shaarli
docker run --volumes-from shaarli-data -p 8000:80 -d --name shaarli shaarli
```

It should then be available at http://localhost:8000

### Updating
To update you will want to bring down the running server, build the new one, and run it. We do not want to touch the shaarli-data container because that holds the preferences and all your links.

```
docker stop shaarli
docker rm shaarli
docker build -t shaarli https://github.com/elrac/docker-shaarli.git
docker run --volumes-from shaarli-data -p 8000:80 -d --name shaarli shaarli
```
