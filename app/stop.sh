#!/bin/bash
if [ -e /etc/sv/envexpvar ]; then
    sv down envexpvar
fi
