#!/bin/bash

if [ ! -d "/yum" ] ; then
mkdir /yum
else
echo "yum已经存在！"
fi


if [ ! -d "/etc/yum.repos.d/back" ] ; then
mkdir /etc/yum.repos.d/back
else
echo "back已经存在！"
fi

mv /etc/yum.repos.d/*.repo  /etc/yum.repos.d/back

touch /etc/yum.repos.d/myyum.repo
chmod +x /etc/yum.repos.d/myyum.repo

echo -e "[Centos]\nname=Centos7\nbaseurl=file:///yum\ngpgcheck=0\nenabled=1"\
    > /etc/yum.repos.d/myyum.repo

read -p "where is iso: " -t 30 iso
mount $iso /yum

yum repolist
