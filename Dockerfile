# docker-i2p
#    Torrent stuff on and browse i2p (https://geti2p.net)
# (Not affiliated in any way with the creators or contributors of i2p)
#
#
# Version 0.1
FROM ubuntu:14.04
# Make sure repo is up to date
RUN apt-get update && apt-get upgrade -y
# Install i2p related packages
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends openjdk-7-jre expect curl wget socat -y
# Add the installer script
ADD ./scripts/i2pinstall.sh /i2p/i2pinstall.sh
ADD ./scripts/startUp.sh /i2p/startUp.sh
RUN chmod +x /i2p/*
# Download i2p
RUN wget https://download.i2p2.de/releases/0.9.17/i2pinstall_0.9.17.jar
# Expose service ports
EXPOSE 8080
EXPOSE 8081
EXPOSE 8443
EXPOSE 6668
# Add a non-root user for i2p to run under
RUN useradd -d /home/i2p -ms /bin/bash i2p && chown -R i2p:i2p /i2p*
# Install i2p
RUN sudo -u i2p /usr/bin/expect /i2p/i2pinstall.sh
# Start i2p
CMD ["/bin/bash","/i2p/startUp.sh"]
