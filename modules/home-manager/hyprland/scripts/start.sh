#!/usr/bin/env bash

nm-applet --indicator &

waybar &

dunst &

sleep 5s

swww init
