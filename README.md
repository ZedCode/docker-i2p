docker-i2p
==========

i2p dockerized

Basic Usage
===========
Create a folder /torrents or something to get to the files you care
about on your local computer. To run do:
 `sudo docker run -d -P -v /torrents:/home/i2p/.i2p/i2psnark anon/i2p:beta`

This will make Torrents accessible outside of the container. You can
also set your web browser to use the exposed ports. Use `sudo docker ps
-a` to find out what those ports are.

To access the console, you will want to get the ports that docker has
exposed by running `sudo docker ps`. There are 3 ports to care about. 8080, 8081 and 8443. 8081 is
the port you will want to connect to to get to the administrative
interface. 8080 is your HTTP proxy and 8443 is your HTTPS proxy, so just
figure out which ports to set in your browser settings.
