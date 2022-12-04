#!/usr/bin/env bash

# Title:         docker_install_mysql.sh
# Description:   docker 安装 mysql5.7
# Author:        Ui1qu
# Date:          2022年12月04日 20:52:31
# Version:       1.0.0

cd $(dirname "$0")
source "../shell/global_func.sh"

mysql_dir="/data/mysql"
mysql_conf="$mysql_dir/etc"
mysql_log="$mysql_dir/logs"
mysql_data="$mysql_dir/data"

[ -d $mysql_dir ] || mkdir $mysql_dir
[ -d $mysql_conf ] || mkdir $mysql_conf
[ -d $mysql_log ] || mkdir $mysql_log
[ -d $mysql_data ] || mkdir $mysql_data

docker pull mysql:5.7

docker run -d -p 3306:3306 --name mysql5.7 \
-v $mysql_conf:/etc/mysql/conf.d \
-v $mysql_log:/var/log/mysql \
-v $mysql_data:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=root mysql:5.7

result=$(docker ps -q -f name="mysql5.7")
if [[ "${result}" == "" ]]; then
   echo "$(tput setaf 1)"install mysql failed"$(tput sgr0)"
else
   echo "$(tput setaf 2)"install mysql success"$(tput sgr0)"
fi
