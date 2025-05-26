#!/bin/bash

VID="04e8"
PID="685d"

echo "Danh sách thiết bị USB Samsung với port path:"
for dev in /sys/bus/usb/devices/*; do
  if [[ -f "$dev/idVendor" && -f "$dev/idProduct" ]]; then
    vid=$(cat "$dev/idVendor")
    pid=$(cat "$dev/idProduct")
    if [[ "$vid" == "$VID" && "$pid" == "$PID" ]]; then
      serial_file="$dev/serial"
      if [[ -f "$serial_file" ]]; then
        serial=$(cat "$serial_file")
        # In ra tên thư mục device (đó chính là port path)
        port_path=$(basename "$dev")
        echo "Serial: $serial - Port Path: $port_path"
      fi
    fi
  fi
done