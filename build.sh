#!/usr/bin/env bash

rm -rf django-resume-2022 rust-book-exercises localhost:8000


# generate html files from  running django resume in Docker
git clone https://github.com/lithium/django-resume-2022.git
docker build -t django-resume-2022:latest django-resume-2022
containerId=`docker run -d --rm -p 8000:80 django-resume-2022`
wget -e robots=off -m http://localhost:8000
docker kill $containerId


# build barebones httpd rust server docker container
git clone https://github.com/lithium/rust-book-exercises.git
docker build -t ch20httpd:latest rust-book-exercises/ch20httpd


# build final docker
docker build -t rust-resume-2023 .