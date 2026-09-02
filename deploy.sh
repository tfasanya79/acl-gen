#!/bin/bash
set -e
cd ~/acl-gen
git pull --ff-only
sudo mkdir -p /var/www/acl-gen
sudo cp index.html /var/www/acl-gen/index.html
sudo chown -R caddy:caddy /var/www/acl-gen
echo "Deployed acl-gen $(git rev-parse --short HEAD)"