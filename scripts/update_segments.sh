#!/bin/bash

update_segments () {
  mkdir -p "$(dirname "${BASH_SOURCE[0]}")"/../misc/segments4;
  for E in $(seq 0 5 180)
  do
    for N in $(seq 0 5 80)
    do
      echo ""
      echo "Downloading E${E}_N${N}"
      curl -f -o "$(dirname "${BASH_SOURCE[0]}")"/../misc/segments4/E${E}_N${N}.rd5 http://brouter.de/brouter/segments4/E${E}_N${N}.rd5 || true
    done
    for S in $(seq 0 5 90)
    do
      echo ""
      echo "Downloading E${E}_S${S}"
      curl -f -o "$(dirname "${BASH_SOURCE[0]}")"/../misc/segments4/E${E}_S${S}.rd5 http://brouter.de/brouter/segments4/E${E}_S${S}.rd5 || true
    done
  done
  for W in $(seq 0 5 180)
  do
    for N in $(seq 0 5 80)
    do
      echo ""
      echo "Downloading W${W}_N${N}"
      curl -f -o "$(dirname "${BASH_SOURCE[0]}")"/../misc/segments4/W${W}_N${N}.rd5 http://brouter.de/brouter/segments4/W${W}_N${N}.rd5 || true
    done
    for S in $(seq 0 5 90)
    do
      echo ""
      echo "Downloading W${W}_S${S}"
      curl -f -o "$(dirname "${BASH_SOURCE[0]}")"/../misc/segments4/W${W}_S${S}.rd5 http://brouter.de/brouter/segments4/W${W}_S${S}.rd5 || true
    done
  done
}

update_segments