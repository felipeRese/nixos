#!/usr/bin/env bash

nm-applet --indicator &

export NO_AT_BRIDGE=1

waybar &

wleave -t 5000 &

dunst &

sleep 5s

swww init
