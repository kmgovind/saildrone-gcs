#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
: "${RFD900_DEVICE:?Set RFD900_DEVICE to its /dev/serial/by-id path}"

if [[ ! -e "$RFD900_DEVICE" ]]; then
  printf 'RFD900+ device does not exist: %s\n' "$RFD900_DEVICE" >&2
  exit 1
fi

export DIALOUT_GID="${DIALOUT_GID:-$(stat -c '%g' "$RFD900_DEVICE")}"
docker compose -f "$repo_dir/compose.yaml" up --build -d
