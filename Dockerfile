FROM golang:latest

RUN mkdir /webusb
WORKDIR /webusb
COPY ./scripts/run_in_docker.sh /webusb

RUN apt-get update
RUN apt-get install -y redir

RUN go get github.com/OS-Q/S12
RUN go build github.com/tS-Q/S12

ENTRYPOINT '/webusb/run_in_docker.sh'
EXPOSE 11325
