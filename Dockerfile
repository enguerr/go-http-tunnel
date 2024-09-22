FROM golang:alpine AS builder

MAINTAINER Osiloke Emoekpere ( me@osiloke.com )

RUN apk update \
	&& apk add -U git \
	&& apk add ca-certificates \
	&& rm -rf /var/cache/apk/*
RUN go install -v github.com/mmatczuk/go-http-tunnel/cmd/tunneld@latest

# final stage
FROM alpine

WORKDIR /

RUN apk update && apk add openssl \
	&& apk add ca-certificates \
	&& rm -rf /var/cache/apk/*

COPY --from=builder /go/bin/tunneld .

# default variables
ENV COUNTY "FR"
ENV STATE "Occitanie"
ENV LOCATION "Nimes"
ENV ORGANISATION "ENG.SYSTEMS"
ENV ROOT_CN "Root"
ENV ISSUER_CN "ENG.SYSTEMS Corp"
ENV PUBLIC_CN "eng.systems"
ENV ROOT_NAME "root"
ENV ISSUER_NAME "eng.systems"
ENV PUBLIC_NAME "public"
ENV RSA_KEY_NUMBITS "2048"
ENV DAYS "365"

# certificate directories
ENV CERT_DIR "/etc/ssl/certs"

VOLUME ["$CERT_DIR"]

COPY *.ext /
COPY entrypoint.sh /
COPY tunneld.sh /

RUN chmod +x entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]