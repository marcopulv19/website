#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
flag_file="$script_dir/../site-maintenance"

case "${1:-}" in
  maintenance)
    printf 'maintenance\n' > "$flag_file"
    printf 'Site status set to maintenance.\n'
    ;;
  online)
    rm -f "$flag_file"
    printf 'Site status set to online.\n'
    ;;
  status)
    if [ -f "$flag_file" ]; then
      printf 'Site is under maintenance.\n'
    else
      printf 'Site is online.\n'
    fi
    ;;
  *)
    printf 'Usage: %s {online|maintenance|status}\n' "$0" >&2
    exit 2
    ;;
esac