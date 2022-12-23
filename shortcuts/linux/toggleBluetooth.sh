#!/bin/bash

isBluetoothOn() {
  local connectorMAC="FC:01:7C:29:FF:88"

  echo "$(hcitool dev | grep -c "$connectorMAC")"
}

toggle() {
  local isBluetoothOn=$(isBluetoothOn)

  if [ $isBluetoothOn -eq 0 ]; then
    rfkill unblock bluetooth
  else
    rfkill block bluetooth
  fi
}

toggle