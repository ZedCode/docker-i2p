docker-i2p
==========

i2p dockerized

Basic Usage
===========

*Starting*: To start i2p inside of docker, you first need to build an
image. Once you've cloned this repo, go into the docker-i2p directory
and build the image with:

`sudo docker build -t="[your user]/docker-i2p" .`

Once the image is built, you can start it and start browsing i2p by
running the following:

`sudo docker run -d -P [your user]/docker-i2p`

Then, you will need to figure out 3 ports and add them to your browser.
The three ports are 8080, 8081 and 8443. You can figure out what ports
got mapped to these ports by running `sudo docker ps`. For example:

```$ sudo docker ps
CONTAINER ID        IMAGE                  COMMAND
CREATED             STATUS              PORTS
NAMES
2707c7a57439        anon/docker-i2p:beta   "/bin/bash /i2p/star   15
minutes ago      Up 15 minutes       0.0.0.0:49156->8081/tcp,
0.0.0.0:49157->8443/tcp, 0.0.0.0:49158->8080/tcp   hungry_mccarthy```

In this example, you can access the i2p control panel by connecting to
127.0.0.149156. You will want to go into your browser settings and add a
new HTTP and HTTPS proxy. Use the port that docker has exposed for 8080
as your HTTP proxy and 8443 for your HTTPS proxy. For more help
configuring your browser, refer to
https://geti2p.net/en/about/browser-config replacing the ports they list
for the ones you found above.

*Downloading Torrents*: Create a folder /torrents or something to get to the files you care
about on your local computer. To run do:
 `sudo docker run -d -P -v /torrents:/home/i2p/.i2p/i2psnark anon/docker-i2p`

This will make Torrents accessible outside of the container. You can
also set your web browser to use the exposed ports. Use `sudo docker ps
-a` to find out what those ports are.
