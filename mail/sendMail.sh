#!/usr/bin/env bash

# Title:         sendMail.sh
# Description:   发送邮件
# Author:        Ui1qu
# Date:          2022年12月04日 17:21:51
# Version:       1.0.0

cd $(dirname "$0")
source "../shell/global_func.sh"

# 当前机器地址 默认显示的网卡是 enp0s3
server=$(ip addr show enp0s3 | grep 'inet' | awk 'NR==1{print $2}' | cut -d "/" -f 1)
send_to_who="address@mail.com"
dependence mailx
# dependence s-nail
mail_content="测试邮件"
mailx -v -s "$server warning" "$send_to_who" <"$mail_content"
