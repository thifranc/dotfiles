#!/bin/bash

phy() {
    ssh root@$1 "awk '/Container/{print \$NF}' /etc/motd"
}

bck() {
    ssh root@$1.octopuce.fr "grep 'server=' /etc/octobackup.conf|cut -d '=' -f 2|tr -d '\"'"
}
