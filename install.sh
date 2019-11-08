#!/usr/bin/env bash

mkdir -p /etc/littletools
cp -r * /etc/littletools/
sed -i '/source \/etc\/littletools\/littletools.sh/d' /etc/profile
sed -i '$a source /etc/littletools/littletools.sh' /etc/profile
source /etc/profile