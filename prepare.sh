#!/bin/bash
# run this script to install node 7

set -x
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -

sudo apt-get install -y nodejs

node -v
