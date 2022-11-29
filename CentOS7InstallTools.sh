#!/usr/bin/env bash

# CentOS7 安装常用的工具

yum -y install lshw pciutils usbutils gdisk system-storage-manager
yum -y install bash-completion zip unzip bzip2 tree tmpwatch pinfo man-pages
yum -y install nano vim-enhanced tmux screen
yum -y install net-tools psmisc lsof sysstat
yum -y install yum-plugin-security yum-utils createrepo
yum -y install git wget curl elinks lynx lftp mailx mutt rsyns

# 编译套件
yum group install "Development Tools"