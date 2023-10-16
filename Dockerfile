FROM alpine:latest
LABEL maintainer="Mr.Philipp <d3vilh@github.com>"
LABEL version="0.1"

EXPOSE 137/udp 138/udp 139/tcp 445/tcp

ENV USERNAME samba
ENV PASSWORD bamba
ENV UID 1000
ENV GID 1000
WORKDIR /opt/app

RUN apk add --no-cache samba-server samba-common-tools openssl bash
COPY config/smb.conf /etc/samba/smb.conf
COPY docker-entrypoint.sh /opt/app/docker-entrypoint.sh
RUN chmod +x /opt/app/docker-entrypoint.sh
RUN addgroup -g $GID samba > /dev/null 2&>1
ENTRYPOINT ./docker-entrypoint.sh
