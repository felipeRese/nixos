#!/usr/bin/env bash

nm-applet --indicator &

waybar &

wleave -t 5000 &

dunst &

sleep 5s

swww init
