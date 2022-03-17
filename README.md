# docker-i2p

i2p and tor dockerized Everything is built transparently right here. Use it as a basis for your own project.

## Requirements

Docker Engine is used in conjunction with docker-compose. Make is used as a wrapper for everything.

## Basic Usage

Start up the containers with:

```sh
make run
```

Exec into the service container with:

```sh
make shell
```

Stop containers with:

```sh
make stop
```

### Installing CLI Helper

```sh
make install

```

then from anywhere you can run `i2p`, assuming that `~/.local/bin` is in your system path.

## Tools Installed

### WeeChat

WeeChat is an IRC Client. Configure it to point to `i2p_service/8666` in order to connect to the i2p IRC server. To do this, launch `weechat` and then type in `/server add i2p i2p_service/8666` and then connect with `/connect i2p`.

### ProxyChains

Proxychains is configured to point to the IP address of the `tor_svc` container's IP address and port `9100`.

### Lynx

You can browse eepsites with Lynx by doing the following from a shell inside of the service container:

```sh
export http_proxy=http://i2p_service:8080
export https_proxy=http://i2p_service:8443
```

Then start `lynx`.

### Torrents

You can download a torrent file with `lynx` and save it under `/i2p-share/i2psnark` and it'll begin download automatically. Downloaded torrents will be available in the `i2p/i2psnark` folder within this project. You can monitor progress by browsing to `localhost:8081`