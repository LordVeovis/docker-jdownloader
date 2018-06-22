![alpine 3.7](https://img.shields.io/badge/alpine-3.7-green.svg) [![License: MPL 2.0](https://img.shields.io/github/license/LordVeovis/docker-jdownloader.svg)](https://opensource.org/licenses/MPL-2.0) [![](https://img.shields.io/docker/pulls/veovis/jdownloader.svg)](https://hub.docker.com/r/veovis/jdownloader/ 'Docker Hub') [![](https://img.shields.io/docker/build/veovis/jdownloader.svg)](https://hub.docker.com/r/veovis/jdownloader/builds/ 'Docker Hub')

# docker-jdownloader
Docker image for JDownloader

# About
This is a docker container for JDownloader build around Alpine Linux for compactness.

# Technical stack

* Alpine 3.7
* OpenJDK 8

# Sample commands
	docker run \
		-e TIMEZONE=Europe/Paris \
		-e COUNTRY=FR \
		-v /volume1/docker/jdownloader/logs:/home/jdownloader/logs \
		-v /volume1/docker/jdownloader/conf:/home/jdownloader/cfg \
		-v /volume1/docker/jdownloader/downloads:/home/jdownloader/downloads \
		--tmpfs /tmp \
		--tmpfs /home/jdownloader/tmp \
		--name veovis-jdownloader \
	veovis/librenms

# Parameters

## Environment variables
* COUNTRY: 2-letters country
* TIMEZONE: timezone
* PUID: the uid under which JDownloader will execute
* PGID: the gid under which JDownloader will execute

## Volumes
* /home/jdownloader/logs: logs
* /home/jdownloader/cfg: configuration files
* /home/jdownloader/downloads: qsdf

# Initial setup

During the first run, jdownloader will prompt you to enter an e-mail and password, this step is not automatizable yet. Below are the steps to initialize jdownloader:
* Register yourself on https://my.jdownloader.org to get your account and password
* When prompted after the docker container is run for the first time, say y and then enter your email and password
* done

