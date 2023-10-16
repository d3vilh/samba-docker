# samba-docker
Simple and fast samba share

## Quickstart

```yml
samba:
  image: d3vilh/samba-docker

  volumes:
    # Samba config file
    - ./smb.conf:/etc/samba/smb.conf

    # Shares
    - ~/files:/mnt/files
    - ~/torrents:/mnt/torrents #:ro

  ports:
    - "137:137/udp"
    - "138:138/udp"
    - "139:139/tcp"
    - "445:445/tcp"

  environment:
    - USERNAME=raspberry
    - PASSWORD=gateway

    # Uncomment to override defaults
    # - UID=1000
    # - GID=1000
```