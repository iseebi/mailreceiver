#!/bin/bash
if [ -n $LMTP_SERVER ]; then
    opt_server="-server $LMTP_SERVER"
else
    opt_server=""
fi
if [ -n $LISTEN ]; then
    opt_listen="-listen $LISTEN"
else
    opt_listen=""
fi
/bin/lmtpdeliver $opt_server $opt_deliver
