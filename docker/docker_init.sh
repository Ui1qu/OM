#!/usr/bin/env bash

# Title:         docker_init.sh
# Description:   docker的安装和初始化
# Author:        Ui1qu
# Date:          2022年12月04日 20:37:29
# Version:       1.0.0

cd $(dirname "$0")
source "../shell/global_func.sh"

if (( $(id -u) == 0 )); then
    echo "I'm root"
else
   echo "$(tput setaf 1)"run this script with root"$(tput sgr0)"
   exit
fi

curl -fsSL https://get.docker.com/ | sh

if ! systemctl status docker >/dev/null 2>&1; then
   echo "$(tput setaf 1)"install docker failed"$(tput sgr0)"
   
fi

if [ ! -d "/etc/docker" ]; then
    mkdir /etc/docker
fi

# 添加国内镜像源
cat >"/etc/docker/daemon.json" <<EOF
{
 "registry-mirrors": ["https://registry.docker-cn.com"]
}
EOF

systemctl restart docker

echo "$(tput setaf 2)"docker init success"$(tput sgr0)"
