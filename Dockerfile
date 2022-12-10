FROM alpine:3.5

RUN \
	apk add --update ca-certificates go git musl-dev && \
	mkdir /work && export GOPATH=/work               && \
	\
	go get github.com/funkolab/cloudflare-dyndns      && \
	cp /work/bin/cloudflare-dyndns /cloudflare-dyndns && \
	\
	apk del go git musl-dev && \
	rm -rf /work && rm -rf /var/cache/apk/*

ENTRYPOINT ["/cloudflare-dyndns"]
