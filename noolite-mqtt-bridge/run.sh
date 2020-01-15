#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

serial_device=$(jq --raw-output ".serial_device" $CONFIG_PATH)
mqtt_host=$(jq --raw-output ".mqtt_host" $CONFIG_PATH)
mqtt_port=$(jq --raw-output ".mqtt_port" $CONFIG_PATH)
mqtt_prefix=$(jq --raw-output ".mqtt_prefix" $CONFIG_PATH)
username=$(jq --raw-output ".username" $CONFIG_PATH)
password=$(jq --raw-output ".password" $CONFIG_PATH)
devices=$(jq --raw-output ".devices" $CONFIG_PATH)

noolite-mqtt-ha-discover "${mqtt_prefix}" "${mqtt_host}" "${username}" "${password}" -p "${mqtt_port}" -d "${devices}"
exec noolite-mqtt "${serial_device}" "${mqtt_prefix}" "${mqtt_host}" "${username}" "${password}" -p "${mqtt_port}"
