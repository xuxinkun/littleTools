#!/usr/bin/env bash

mkdir -p /etc/littletools
cp -r * /etc/littletools/
sed -i '$a source /etc/littletools/*' /etc/profile
source /etc/profile