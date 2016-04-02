FROM alpine
MAINTAINER Dean Pemberton dean@deanpemberton.com

COPY docker-image-files /

RUN \
  echo "000001" && \
  export GOPATH=/go && \
  apk update && \
  apk add -f \
    curl nodejs git go && \
  mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH" && \  
  mkdir -p /log && \
  go get github.com/deanpemberton/influxsnmp && \
  go install github.com/deanpemberton/influxsnmp && \
  cp $GOPATH/src/github.com/deanpemberton/influxsnmp/oids.txt $GOPATH/bin/ && \
  chmod +x /bootstrap.sh && \
  apk del --purge curl git go && \ 
  find . -name '*.md' -print -delete && \
  find . -name 'rfc*.txt' -print -delete && \
  find . -name 'LICENSE*' -print -delete && \
  find . -name '*.yml' -print -delete && \
  rm -rf ./node_modules/net-snmp/example && \
  rm -rf ./node_modules/cluster/node_modules/mkdirp/node_modules/minimist/example && \
  rm -rf ./node_modules/socket.io-client/node_modules/engine.io-client/node_modules/xmlhttprequest-ssl/example && \
  rm -rf /var/cache/apk/* ${GOPATH}/src

CMD ["/bootstrap.sh"]
