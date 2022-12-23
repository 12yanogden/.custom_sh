#/bin/bash

isBluetoothOn() {
  local connectorMAC="FC:01:7C:29:FF:88"

  echo "$(hcitool dev | grep -c "$connectorMAC")"
}

isConnected() {
  local pattern="Connected: yes"

  echo "$(bluetoothctl info "$mac" | grep -c "$pattern")"
}

toggle() {
  local mac="E4:76:84:1F:C4:AC"
  local isBluetoothOn=$(isBluetoothOn)
  local isConnected=$(isConnected)

  if [ $isBluetoothOn -eq 0 ]; then
    rfkill unblock bluetooth
    sleep 3
  fi

  if [ $isConnected -eq 0 ]; then
    bluetoothctl connect E4:76:84:1F:C4:AC
  else
    bluetoothctl disconnect E4:76:84:1F:C4:AC
  fi
}

toggle