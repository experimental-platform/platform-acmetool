FROM alpine:edge
COPY bin/acmetool-v0.0.50-linux_amd64 /bin/acmetool
COPY bin/dumb-init_1.0.1_amd64 /bin/dumb-init
COPY entrypoint.sh /root/entrypoint.sh

RUN apk add --update bash expect ca-certificates && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["dumb-init", "/root/entrypoint.sh"]