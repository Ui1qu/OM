#!/usr/bin/env bash

# Title:         backup_dir.sh
# Description:   备份一个目录
# Author:        Ui1qu
# Date:          2022年12月04日 19:46:22
# Version:       1.0.0

cd $(dirname "$0")
source "../shell/global_func.sh"

current_time=$(date '+%Y-%m-%d_%H_%M_%S')
backup_dir="/data/dir/"
backup_dir_log="./backup_log"
out_dir="/date/backup/"

tar -czvf $out_dir.tar.gz $backup_dir

if [ $? ]; then
    echo "$current_time     backup secess">>$backup_dir_log
else
    echo "$current_time     backup failed">>$backup_dir_log
fi

# 删除3天前的备份
find $out_dir -type f -ctime +3 -exec rm -rf \;
