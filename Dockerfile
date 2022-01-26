##
## Build
##

FROM golang:1.16-buster AS build

WORKDIR /app

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY *.go ./

RUN go build -o /ping-pong-roach

##
## Deploy
##

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /ping-pong-roach /ping-pong-roach

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/ping-pong-roach"]
