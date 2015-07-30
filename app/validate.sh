#!/bin/sh
exec curl --retry 10 --retry-delay 5  -s -f -o /dev/null http://localhost:8080/debug/vars
