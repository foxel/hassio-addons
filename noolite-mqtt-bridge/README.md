# Hass.io Add-on: NooLite MQTT bridge

NooLite MQTT bridge for Home Assistant.

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports i386 Architecture][i386-shield]

## Configuration

Add-on configuration example:

```json
{
    "serial_device": "/dev/ttyS0",
    "mqtt_host": "127.0.0.1",
    "mqtt_port": "1883",
    "mqtt_prefix": "noolite",
    "username": "",
    "password": "",
    "devices": [
      {"type": "sb1", "channel": 1},
      {"type": "sr1", "channel": 2, "mode": "light"},
      {"type": "pxx", "channel": 5, "channel2": 6, "mode": "button"}
    ]
}
```

## HASS devices configuration

The add-on can use MQTT discovery to create devices in Home Assistant. One can configure devices known to be bound to
 MTRF64 instance with JSON configuration above. Each device has 'type' and 'channel' attributes. Known device types:
 * pm112 - PM112 Motion Sensor 
 * pt111 - PT111 Temperature and Humidity Sensor
 * pt112 - PT112 Temperature Sensor
 * pl111 - PL111 Light Sensor
 * ds1 - DS-1 Open Sensor
 * ws1 - WS-1 Water Sensor
 * sr1 - SR-1-X Switch
 * su1 - SU-1-X Switch - sr1 with "light" mode for now
 * sb1 - SB-1-X Switch - the same as su1 for now
 * srf1 - SRF-1-X Switch
 * suf1 - SUF-1-X Switch - srf1 with "light" mode for now
 * pxx - any PXX remote
 
sr1, su1, sb1, srf1, suf1 devices can have optional "mode" attribute of either "switch" or "light", which controls
 corresponding Nome Assistant entity type discovered.  

pxx device has "mode" of either "switch" or "button", where "switch" is used for "on"+"off" buttons mode on the
 remote and "button" for the toggle button mode of the remote.
 
pxx also has optional "channel2", "channel3", "channel4" to put up to 4 bound channels under one HA device.

## Binding
### TX bindind

* Set your slave device to bind mode (see device manual)
* Send BIND command thru desired channel (5 in example):  
```mosquitto_pub -h {mqtt_host} -t {mqtt_prefix}/tx/5 -m BIND```

### TX bindind (NooLite-F)

* Set your slave device to bind mode (see device manual)
* Send BIND command thru desired channel (5 in example):  
```mosquitto_pub -h {mqtt_host} -t {mqtt_prefix}/tx-f/5 -m BIND```

### RX bindind

* Enable RX binding on desired channel (5 in example):  
```mosquitto_pub -h {mqtt_host} -t {mqtt_prefix}/bind/5 -m ON``` (5 is channel to bind)
* Send bind command from your remote switch (see switch manual)

### RX bindind (NooLite-F)

* Enable RX binding on desired channel (5 in example):  
```mosquitto_pub -h {mqtt_host} -t {mqtt_prefix}/bind-f/5 -m ON``` (5 is channel to bind)
* Send bind command from your remote switch (see switch manual)

# Read Also
* https://www.noo.com.by/assets/files/PDF/MTRF-64.pdf (russian)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
