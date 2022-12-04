#!/usr/bin/env bash

# Title:         disk_check.sh
# Description:   检测磁盘占用率，高于一定值发送邮件提醒
# Author:        Ui1qu
# Date:          2022年12月04日 16:38:06
# Version:       1.0.0
# 
# crontab 定时每天早上8点检查一次
# 0 8 * * * disk_check.sh

cd $(dirname "$0")
source "../shell/global_func.sh"

mount_point="/"
usage=$(df -h | awk -v value="$mount_point" '$6==value{sub("%","",$5);print $5}')

if (( $usage > 90 )); then
    sendMail "挂载点：\" $mount_point \" 当前占用率大于90%"
fi
