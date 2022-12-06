#!/usr/bin/env bash

# Title:         docker_install_nginx.sh
# Description:   docker 安装 nginx
# Author:        Ui1qu
# Date:          2022年12月06日 18:31:49
# Version:       1.0.0

cd $(dirname "$0")
source "../shell/global_func.sh"

nginx_dir="/data/nginx"
nginx_conf="$nginx_dir/etc"
nginx_log="$nginx_dir/logs"
www_dir="/data/www"

[ -d $nginx_dir ] || mkdir $nginx_dir
[ -d $nginx_conf ] || mkdir $nginx_conf
[ -d $nginx_log ] || mkdir $nginx_log

docker pull nginx:latest

docker run -d -p 80:80 --name nginx \
-v $nginx_conf:/etc/nginx \
-v $nginx_log:/var/log/nginx \
-v $www_dir:/usr/share/nginx/html \
nginx:latest

result=$(docker ps -q -f name="nginx")
if [[ "${result}" == "" ]]; then
   echo "$(tput setaf 1)"install nginx failed"$(tput sgr0)"
else
   echo "$(tput setaf 2)"install nginx success"$(tput sgr0)"
fi
