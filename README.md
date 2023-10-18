# samba-docker
Simple but fast samba server which lives in tiny Alpine Linux container.


[![latest version](https://img.shields.io/github/v/release/d3vilh/samba-docker?color=%2344cc11&label=LATEST%20RELEASE&style=flat-square&logo=Github)](https://github.com/d3vilh/samba-docker/releases/latest) [![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/d3vilh/samba-docker/latest?logo=docker&label=DOCKER%20IMAGE&color=2344cc11&style=flat-square&logoColor=white)](https://hub.docker.com/r/d3vilh/samba-docker) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/d3vilh/samba-docker/latest?logo=Docker&color=2344cc11&label=IMAGE%20SIZE&style=flat-square&logoColor=white)


## Quickstart

```yml
samba:
  image: d3vilh/samba-docker:latest
  hostname: samba
  container_name: samba

  volumes:
    # Sharing Samba config file
    - ./smb.conf:/etc/samba/smb.conf

    # Shares
    - ~/files:/mnt/files
    - ~/torrents:/mnt/torrents :ro

  ports:
    - "137:137/udp"
    - "138:138/udp"
    - "139:139/tcp"
    - "445:445/tcp"

  environment:
    - USERNAME=raspberry
    - PASSWORD=gateway
    # - UID=1000 # Optional to override default UID = 1000
    # - GID=1000 # Optional to override default GID = 1000
```

## Build own image
  
```bash
./build-image.sh
```


<a href="https://www.buymeacoffee.com/d3vilh" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="51" width="217"></a>
