#!/bin/sh

# Enable Z-Wave stick in Synology
# https://community.home-assistant.io/t/zwave-on-synology-dsm-7/308583
modprobe usbserial
modprobe ftdi_sio
modprobe cdc-acm
