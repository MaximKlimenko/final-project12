FROM golang:1.22

WORKDIR /usr/src/app

COPY go.mod go.sum ./

RUN go mod download

COPY *.go *db ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /homework

CMD ["/homework"]