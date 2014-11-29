#!/bin/bash
sudo -u i2p /bin/bash /i2p/i2prouter start
socat TCP-LISTEN:8080,fork TCP:localhost:4444 &
socat TCP-LISTEN:8081,fork TCP:localhost:7657 &
socat TCP-LISTEN:8443,fork TCP:localhost:4445 
