FROM alpine:latest

ARG GID=1000
ARG UID=1000

RUN addgroup -g $GID node \
    && adduser -u $UID -G node -s /bin/sh -D node

RUN apk add --no-cache bash gnupg curl

RUN for key in $(curl -sL https://raw.githubusercontent.com/nodejs/docker-node/HEAD/keys/node.keys) \
  ; do \
      curl -fs "https://keys.openpgp.org/vks/v1/by-fingerprint/$key" -o "node-$key.asc" || \
      curl -fs "http://keyserver.ubuntu.com/pks/lookup?op=get&search=$key" -o "node-$key.asc" ; \
      gpg --batch --import "node-$key.asc" ; \
  done

COPY --chown=node:node run.sh /home/node/run.sh

VOLUME /out/

USER node

ENTRYPOINT [ "/home/node/run.sh" ]
