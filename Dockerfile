FROM alpine:latest
LABEL maintainer="Mr.Philipp <d3vilh@github.com>"
LABEL version="0.1"

EXPOSE 137/udp 138/udp 139/tcp 445/tcp

ENV USERNAME samba
ENV PASSWORD bamba
ENV UID 1000
ENV GID 1000

RUN apk add --no-cache samba-server samba-common-tools openssl
COPY config/smb.conf /etc/samba/smb.conf

RUN nmbd --foreground --no-process-group --log-stdout

ENTRYPOINT ["/run.sh"]
