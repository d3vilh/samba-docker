# samba-docker
Simple but fast samba server which lives in tiny Alpine Linux container.

## Quickstart

```yml
samba:
  image: d3vilh/samba-docker
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
