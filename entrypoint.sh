#!/usr/bin/env bash

set -e

# Automated quickstart.
/usr/bin/expect <<EOD
  spawn acmetool quickstart
  expect "I want test certificates"
  send "2\r" 
  expect "proxy challenge"
  send "2\r" 
  expect "Do you agree to the Terms of Service?"
  send "Y\r" 
  expect "mail address"
  send "\r"
  expect "Quickstart Complete"
EOD

set +e
acmetool want acmetooldemo.protonet.info soul.acmetooldemo.protonet.info

echo "Entering acmetool loop"
while [ true ]; do
  sleep 10s
  /bin/acmetool --batch reconcile --xlog.severity=debug
done
         