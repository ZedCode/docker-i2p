docker-i2p
==========

i2p dockerized

Requirements
============
Docker Engine is used in conjunction with docker-compose.

Basic Usage
===========

Simply run `docker-compose up -d` after cd'ing into the directory you git cloned:

You can now open a browser and browse to `localhost:[port that 8081 is mapped to]` to get to the
i2p control panel. All of your preferences will be saved in the locally
mounted i2p folder as well as any torrents you download through i2psnark.

Building the image without docker-compose
==================================

If for whatever reason you would rather just build this yourself and use
it as a normal docker container, you can do so the normal way:
`docker build -t="[your user]/docker-i2p" .`

Once the image is built, you can start it and start browsing i2p by
running the following:

`docker run -d -P [your user]/docker-i2p`

Then, you will need to figure out 3 ports and add them to your browser.
The three ports are 8080, 8081 and 8443. You can figure out what ports
got mapped to these ports by running `docker ps`. For example:

```
$ sudo docker ps
CONTAINER ID        IMAGE                  COMMAND
CREATED             STATUS              PORTS
NAMES
2707c7a57439        zedcd/docker-i2p:beta   "/bin/bash /i2p/star   15
minutes ago      Up 15 minutes       0.0.0.0:49156->8081/tcp,
0.0.0.0:49157->8443/tcp, 0.0.0.0:49158->8080/tcp   hungry_mccarthy
```

In this example, you can access the i2p control panel by connecting to
127.0.0.149156. You will want to go into your browser settings and add a
new HTTP and HTTPS proxy. Use the port that docker has exposed for 8080
as your HTTP proxy and 8443 for your HTTPS proxy. For more help
configuring your browser, refer to
https://geti2p.net/en/about/browser-config replacing the ports they list
for the ones you found above.

Torrents
========
Torrents downloaded through i2psnark will be saved to `i2p/i2psnark/`
inside of the project directory you git cloned this to.
