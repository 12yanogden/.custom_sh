#!/bin/bash

toggle() {
  local mac="E4:76:84:1F:C4:AC"
  local isBluetoothOn=$(blueutil -p)
  local isConnected=$(blueutil --is-connected "$mac")

  if [ $isBluetoothOn -eq 0 ]; then
    blueutil -p 1
    sleep 3
  fi

  if [ $isConnected -eq 0 ]; then
    blueutil --connect "$mac"
  else
    blueutil --disconnect "$mac" --wait-disconnect "$mac"
  fi
}

toggle