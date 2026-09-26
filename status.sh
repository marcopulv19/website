#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
flag_file="$script_dir/site-offline"

case "${1:-}" in
  offline)
    printf 'offline\n' > "$flag_file"
    printf 'Site status set to offline.\n'
    ;;
  online)
    rm -f "$flag_file"
    printf 'Site status set to online.\n'
    ;;
  status)
    if [ -f "$flag_file" ]; then
      printf 'Site is offline.\n'
    else
      printf 'Site is online.\n'
    fi
    ;;
  *)
    printf 'Usage: %s {online|offline|status}\n' "$0" >&2
    exit 2
    ;;
esac