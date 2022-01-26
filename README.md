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

Create volume

`docker volume create roach`

Create bridhe network

`docker network create -d bridge ping-pong-net`

Run CockroachDB locally in container, attach to volume and network

```
docker run -d \
  --name roach \
  --hostname db \
  --network ping-pong-net \
  -p 26257:26257 \
  -p 8080:8080 \
  -v roach:/cockroach/cockroach-data \
  cockroachdb/cockroach:latest-v20.1 start-single-node \
  --insecure
```

Start SQL shell

`docker exec -it roach ./cockroach sql --insecure`

Build image

`docker build --tag ping-pong-roach .`

Run roach

```
docker run -it --rm -d \
  --network ping-pong-net \
  --name ping-pong-server \
  -p 80:8080 \
  -e PGUSER=totoro \
  -e PGPASSWORD=mypassword \
  -e PGHOST=db \
  -e PGPORT=26257 \
  -e PGDATABASE=mydb \
  ping-pong-roach
```
