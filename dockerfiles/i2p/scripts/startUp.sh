#!/bin/bash
chown -R i2p:i2p /i2p/
chown -R i2p:i2p /home/i2p
su - i2p /i2p/runplain.sh
socat TCP-LISTEN:8080,fork TCP:localhost:4444 &
socat TCP-LISTEN:8081,fork TCP:localhost:7657 &
socat TCP-LISTEN:8666,fork TCP:localhost:6668 &
socat TCP-LISTEN:8443,fork TCP:localhost:4445
