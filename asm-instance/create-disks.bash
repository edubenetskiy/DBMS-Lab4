#!/bin/bash -xe

DISK_ROOT=/u01

createDisk() {
    local name=$1
    local numDisks=$2
    local size=$3
    mkdir -p $DISK_ROOT/$name
    for ((diskIndex = 0; diskIndex < $numDisks; diskIndex++))
    do
        local diskPath=$DISK_ROOT/$name/$name$diskIndex
        /usr/sbin/mkfile -n $size $diskPath
    done
}

createDisk cutegoat 3 500m
createDisk carelesscat 7 800m
