FROM golang:1.11.2

RUN mkdir /webusb
WORKDIR /webusb
COPY ./scripts/run_in_docker.sh /webusb

RUN apt-get update
RUN apt-get install -y redir

RUN go get github.com/Qful/webusb
RUN go build github.com/Qful/webusb

ENTRYPOINT '/webusb/run_in_docker.sh'
EXPOSE 11325