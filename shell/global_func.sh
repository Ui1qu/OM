#!/usr/bin/env bash

# Title:         global_func.sh
# Description:   全局函数和导入相关配置文件
# Author:        Ui1qu
# Date:          2022年12月04日 15:33:18
# Version:       1.0.0

[ -f /etc/init.d/functions ] && . /etc/init.d/functions

# 依赖检测
# dependence command 或者 dependence command0,command1,command2
function dependence() {
  Full='0'
  for BIN_DEP in $(echo "$1" | sed 's/,/\n/g'); do
    if [[ -n "$BIN_DEP" ]]; then
      Found='0'
      for BIN_PATH in $(echo "$PATH" | sed 's/:/\n/g'); do
        ls $BIN_PATH/$BIN_DEP >/dev/null 2>&1
        if [ $? == '0' ]; then
          Found='1'
          break
        fi
      done
      if [ "$Found" == '1' ]; then
        action ""
        echo -en "[\033[32mok\033[0m]\t"
      else
        Full='1'
        echo -en "[\033[31mNot Install\033[0m]"
      fi
      echo -en "\t$BIN_DEP\n"
    fi
  done
  if [ "$Full" == '1' ]; then
    echo -ne "\n\033[31mError! \033[0mPlease use '\033[33mapt-get\033[0m' or '\033[33myum\033[0m' install it.\n\n\n"
    exit 1
  fi
}

# 发送邮件
# sendMail 邮件标题 邮件内容
function sendMail() {
  # 当前机器地址 默认显示的网卡是 enp0s3
  server=$(ip addr show enp0s3 | grep 'inet' | awk 'NR==1{print $2}' | cut -d "/" -f 1)
  send_to_who="address@mail.com"
  if [[ -n "${1}" ]] ; then
   echo "$(tput setaf 1)"缺少邮件内容"$(tput sgr0)"
  fi
  dependence mailx
  # dependence s-nail
  mail_content=$1
  mailx -v -s "$server warning" "$send_to_who" <"$mail_content"
}
