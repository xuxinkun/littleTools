#!/usr/bin/env bash

mkdir -p /etc/littletools
cp -r * /etc/littletools/
sed -i '$a source /etc/littletools/littletools.sh' /etc/profile
source /etc/profile