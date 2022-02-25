#!/usr/bin/expect -f
spawn java -jar /i2pinstall_1.7.0.jar -console
expect {Input selection:}
send -- "0\r"
expect {Press 1 to continue, 2 to quit, 3 to redisplay}
send -- "1\r"
expect {press 1 to continue, 2 to quit, 3 to redisplay}
send -- "1\r"
expect {Select the installation path:  [/home/i2p/i2p]}
send -- "/i2p\r"
expect {Enter Y for Yes, N for No:}
send -- "Y\r"
expect {Press 1 to continue, 2 to quit, 3 to redisplay}
send -- "1\r"
expect {Press 1 to continue, 2 to quit, 3 to redisplay}
send -- "1\r"
expect "#"
