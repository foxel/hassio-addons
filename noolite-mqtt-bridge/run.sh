#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

serial_device=$(jq --raw-output ".serial_device" $CONFIG_PATH)
mqtt_host=$(jq --raw-output ".mqtt_host" $CONFIG_PATH)
mqtt_port=$(jq --raw-output ".mqtt_port" $CONFIG_PATH)
mqtt_prefix=$(jq --raw-output ".mqtt_prefix" $CONFIG_PATH)

exec /opt/noolite/main.py "${serial_device}" "${mqtt_prefix}" "${mqtt_host}" "${mqtt_port}"
