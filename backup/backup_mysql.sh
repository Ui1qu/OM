#!/usr/bin/env bash

# Title:         backup_mysql.sh
# Description:   备份mysql数据库
# Author:        Ui1qu
# Date:          2022年12月04日 20:07:40
# Version:       1.0.0

cd $(dirname "$0")
source "../shell/global_func.sh"

dependence mysqldump

current_time=$(date '+%Y-%m-%d_%H_%M_%S')
backup_dir=/data/backup/
backup_file=$backup_dir/$database-${current_time}.sql
backup_mysql_log=/var/log/mysqlbackup.log

user='root'
passwd=''
database=test
host=localhost

if [ ! -d "$backup_dir" ];then
    mkdir $backup_dir
fi
if [ ! -f "$backup_mysql_log" ];then
    touch $backup_mysql_log
fi
echo "Start to backup at $(date +%Y%m%d%H%M)" >> $backup_mysql_log
mysqldump -u$user -p$passwd -h $host --opt --lock-all-tables --flush-logs --master-data=2 --databases $database|gzip > $backup_file.gz
if [ $? -eq 0 ];then
    echo "Backup is finish! at $(date +%Y%m%d%H%M)" >> $backup_mysql_log    
    exit 0
else
    echo "Backup is Fail! at $(date +%Y%m%d%H%M)" >> $backup_mysql_log
    exit 1
fi
