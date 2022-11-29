#!/usr/bin/env bash

# 编译一个有Python3支持的vim

./configure --prefix=/home/$USER/.local --with-features=huge \
            --enable-python3interp=yes \
            --with-python3-config-dir=/home/$USER/.local/lib/python3.8/config-3.8-x86_64-linux-gnu/ \
            --with-python3-command=/home/$USER/.local/bin/python3

make && make install