# docker-rpi-nzbget

<img src="https://badgen.net/badge/platform/raspberry%20pi?list=1"/> <a href="https://hub.docker.com/r/dtroncy/rpi-nzbget"><img src="https://badgen.net/badge/icon/docker?icon=docker&label"/></a> <a href="https://travis-ci.org/dtroncy/docker-rpi-nzbget"><img src="https://badgen.net/travis/dtroncy/docker-rpi-nzbget/master?icon=travis&label=build"/></a>

This is a raspberry pi compatible nzbget DockerFile.

To build it :

    docker build --build-arg nzbget_version=$nzbget_version -t dtroncy/rpi-nzbget .

$nzbget_version is version of nzbget you want to install.

To run it (with image on docker hub) :

    docker run -d -p 6789:6789 \
    -v /path_to_your_config_folder:/volumes/config \
    -v /path_to_your_download_folder:/volumes/download \
    -v /etc/localtime:/etc/localtime:ro \
    --restart unless-stopped \
    --name nzbget \
    dtroncy/rpi-nzbget

Description of parameters :
  - **-d** : to launch container as demon
  - **-v /path_to_your_media_folder:/volumes/media** : mount media folder in your container to a folder in your host. The media folder is the folder where nzbget scan your actuals media
  - **-v /path_to_your_config_folder:/volumes/config** : mount config folder in your container to a folder in your host
  - **-v /etc/localtime:/etc/localtime:ro** : synchronise time between host and container
  - **--restart unless-stopped** : restart the container unless it has been stopped by user
  - **--name nzbget** : container's name
  - **dtroncy/rpi-nzbget** : image's name

The default login/password are :
  - login : **nzbget**
  - password : **tegbzn6789**
