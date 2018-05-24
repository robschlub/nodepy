# Base

Image with Node.js with Python 3

Based on official Node JS 9.11.1-slim and Python 3.6.5-slim Dockerfiles.


# Dev

all node packages required for dev
all python packages required for dev


# To use in git:
git clone https://github.com/robschlub/nodepy


# To build locally:
docker build -t nodepy .


# To build and push to docker hub:
./build.sh base
./build.sh dev
