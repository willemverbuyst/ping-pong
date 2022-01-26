tutorial on https://docs.docker.com/language/golang/build-images/

Build image

`docker build --tag ping-pong .`

Build image multi-stage

`docker build -t ping-pong:multistage -f Dockerfile.multistage .`

Run image as container

`docker run [-d] --publish 8080:8080 ping-pong`

Stop container

`docker stop <CONTAINER ID>`

Restart

`docker restart <CONTAINER ID>`

Name a container

`docker run -d -p 8080:8080 --name ping-pong-server ping-pong`
