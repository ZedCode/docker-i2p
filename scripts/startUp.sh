#!/bin/bash
chown i2p:i2p /i2p/.i2p/i2psnark
su - i2p /i2p/runplain.sh
socat TCP-LISTEN:8080,fork TCP:localhost:4444 &
socat TCP-LISTEN:8081,fork TCP:localhost:7657 &
socat TCP-LISTEN:8443,fork TCP:localhost:4445 
