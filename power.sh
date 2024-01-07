#!/bin/bash
case "$2" in
    up)
        /sbin/iwconfig $1 power off || true
        ;;
    down)
        /sbin/iwconfig $1 power on || true
        ;;
esac