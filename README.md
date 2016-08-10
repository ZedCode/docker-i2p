docker-i2p
==========

i2p dockerized

Requirements
============
Docker Engine is installed and so is vagrant.

Basic Usage
===========

Simply run `vagrant up` after cd'ing into the directory you git cloned:
```
% vagrant up
Bringing machine 'i2p' up with 'docker' provider...
==> i2p: Building the container from a Dockerfile...
Sending build context to Docker daemon 65.02 kB 65.02 kB
    i2p: Step 1 : FROM ubuntu:14.04
    i2p:  ---> e9ae3c220b23
    i2p: Step 2 : RUN apt-get update && apt-get upgrade -y
    i2p:  ---> Using cache
    i2p:  ---> ee52a09473fc
    i2p: Step 3 : RUN apt-get install --no-install-recommends
default-jre expect curl wget socat -y
    i2p:  ---> Using cache
    i2p:  ---> e26a2dccf33c
    i2p: Step 4 : RUN wget
https://download.i2p2.de/releases/0.9.26/i2pinstall_0.9.26.jar
    i2p:  ---> Using cache
    i2p:  ---> 82ba2f88daaa
    i2p: Step 5 : RUN useradd -d /home/i2p -ms /bin/bash i2p
    i2p:  ---> Using cache
    i2p:  ---> 32cf252421e7
    i2p: Step 6 : ADD ./scripts/i2pinstall.sh /i2p/i2pinstall.sh
    i2p:  ---> Using cache
    i2p:  ---> 90edc5b6bea5
    i2p: Step 7 : ADD ./scripts/startUp.sh /i2p/startUp.sh
    i2p:  ---> Using cache
    i2p:  ---> cc5c84e68fc0
    i2p: Step 8 : RUN chmod +x /i2p/* && chown -R i2p:i2p /i2p
    i2p:  ---> Using cache
    i2p:  ---> 155dcc9e08ed
    i2p: Step 9 : USER i2p
    i2p:  ---> Using cache
    i2p:  ---> 13c92148ebf6
    i2p: Step 10 : RUN /usr/bin/expect /i2p/i2pinstall.sh
    i2p:  ---> Using cache
    i2p:  ---> 288bc87ad9e6
    i2p: Step 11 : USER root
    i2p:  ---> Using cache
    i2p:  ---> ad59e76879d3
    i2p: Step 12 : EXPOSE 4444
    i2p:  ---> Using cache
    i2p:  ---> bfa02408c034
    i2p: Step 13 : EXPOSE 4445
    i2p:  ---> Using cache
    i2p:  ---> 1be1e49d5920
    i2p: Step 14 : EXPOSE 7657
    i2p:  ---> Using cache
    i2p:  ---> 0150adbf1c86
    i2p: Step 15 : CMD /bin/bash /i2p/startUp.sh
    i2p:  ---> Using cache
    i2p:  ---> 856279fce32d
    i2p: Successfully built 856279fce32d
    i2p: 
    i2p: Image: 856279fce32d
==> i2p: Creating the container...
    i2p:   Name: i2p
    i2p:  Image: 856279fce32d
    i2p: Volume:
/home/zedcode/code/checked_in/docker-i2p/i2p:/home/i2p/.i2p
    i2p: Volume: /home/zedcode/code/checked_in/docker-i2p:/vagrant
    i2p:   Port: 8080:8080
    i2p:   Port: 8443:8443
    i2p:   Port: 8081:8081
    i2p:  
    i2p: Container created: 01269e0593172d42
==> i2p: Starting container...
==> i2p: Provisioners will not be run since container doesn't support
SSH.
```

You can now open a browser and browse to localhost:8081 to get to the
i2p control panel. All of your preferences will be saved in the locally
mounted i2p folder as well as any torrents you download through i2psnark.

Building the image without Vagrant
==================================

If for whatever reason you would rather just build this yourself and use
it as a normal docker container, you can do so the normal way:
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
2707c7a57439        zedcd/docker-i2p:beta   "/bin/bash /i2p/star   15
minutes ago      Up 15 minutes       0.0.0.0:49156->8081/tcp,
0.0.0.0:49157->8443/tcp, 0.0.0.0:49158->8080/tcp   hungry_mccarthy```

*Note*: In the Vagrantfile these ports are mapped to 8080, 8081 and
8443.

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
