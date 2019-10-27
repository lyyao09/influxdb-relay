FROM multiarch/alpine:aarch64-edge

ENV GOPATH /go
ENV GOBIN /go/bin
ENV CGO_ENABLED=0 
ENV GOOS=linux 
ENV GOARCH=arm64
ENV INFLUXDB_RELAY github.com/influxdata/influxdb-relay
WORKDIR $GOPATH/src/$INFLUXDB_RELAY/
COPY . $GOPATH/src/$INFLUXDB_RELAY/
COPY influxdb-relay.toml /root/
RUN set -ex && \
	  apk add --no-cache --virtual .build-deps \
		git \
		go \
		build-base && \
                go get -u github.com/influxdata/influxdb-relay
