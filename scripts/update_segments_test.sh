#!/bin/bash

update_segments () {
  mkdir -p "$(dirname "${BASH_SOURCE[0]}")"/../misc/segments4;
  echo ""
  echo "Downloading E105_N30"
  curl -o "$(dirname "${BASH_SOURCE[0]}")"/../misc/segments4/E105_N30.rd5 http://brouter.de/brouter/segments4/E105_N30.rd5
  echo ""
  echo "Downloading W85_N40"
  curl -o "$(dirname "${BASH_SOURCE[0]}")"/../misc/segments4/W85_N40.rd5 http://brouter.de/brouter/segments4/W85_N40.rd5
}

update_segments