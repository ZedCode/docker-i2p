#!/usr/bin/expect -f
spawn java -jar /i2pinstall_0.9.17.jar -console
expect "press 1 to continue, 2 to quit, 3 to redisplay"
send -- "1\r"
expect "Select target path"
send -- "/i2p\r"
expect "press 1 to continue, 2 to quit, 3 to redisplay"
send -- "1\r"
expect "#"
