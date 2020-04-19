# ytdl-docker

Dockerized youtube-dl

A simple Alpine based Docker image to run ytdl. Includes ffmpeg for muxing.

##Usage
####Build the image

`docker build -t ytdl-docker .`

####Configure
Edit the sample `youtube-dl.conf`. A full list of configuration options can be found [here](https://github.com/ytdl-org/youtube-dl#options).

Edit the `batch.txt` file with a list of URLs, one per line, that you want to download.

####Run the container
Edit the volume paths as needed
```
docker run --rm -d \
-v "$(pwd)"/config:/config:ro \
-v "$(pwd)"/ytdl-downloads:/dest \
ytdl-docker
```
If you need to do any debugging run the container with an interactive terminal see what's going on and persist the container for access to the logs
```
docker run -it --name ytdl \
-v "$(pwd)"/config:/config:ro \
-v "$(pwd)"/ytdl-downloads:/dest \
ytdl-docker
```
