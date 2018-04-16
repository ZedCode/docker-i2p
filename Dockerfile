## Dockerfile for I2P
#
#### Maintained by https://github.com/ZedCode
FROM ubuntu:14.04
RUN apt-get update && apt-get upgrade -y
RUN apt-get install --no-install-recommends default-jre expect curl wget socat -y
RUN wget https://download.i2p2.de/releases/0.9.34/i2pinstall_0.9.34.jar
RUN useradd -d /home/i2p -ms /bin/bash i2p
ADD ./scripts/i2pinstall.sh /i2p/i2pinstall.sh
ADD ./scripts/startUp.sh /i2p/startUp.sh
RUN chmod +x /i2p/* && chown -R i2p:i2p /i2p
USER i2p
RUN /usr/bin/expect /i2p/i2pinstall.sh
USER root
EXPOSE 4444
EXPOSE 4445
EXPOSE 7657
CMD ["/bin/bash","/i2p/startUp.sh"]
