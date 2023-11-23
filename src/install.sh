#! /bin/sh

set -eux
set -o pipefail

apk update

# install pg_dump
apk add postgresql16-client

# install gpg
apk add gnupg

# apk add python3

apk add --no-cache aws-cli

# cleanup
rm -rf /var/cache/apk/*
