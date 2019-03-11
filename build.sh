#!/bin/bash

docker run -i --rm -v "$PWD":/out -w /root alpine /bin/sh <<EOF
apk add g++ make musl-dev openssl-dev
wget https://github.com/AGWA/git-crypt/archive/0.6.0.tar.gz
tar xvfz 0.6.0.tar.gz
cd git-crypt-*
LDFLAGS="-static" make
make install
cp /usr/local/bin/git-crypt /out
strip /out/git-crypt
chown $(id -u):$(id -g) /out/git-crypt
EOF
