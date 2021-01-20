#!/bin/bash
# vim:sw=4:ts=4:et

set -e

exec "$@" &
pid=$!

declare -A forward

# Add a line here for each service that should have a local port forward
forward["app-a"]=1338
forward["app-b"]=1339

for key in "${!forward[@]}"; do
  host="${key}"
  port="${forward[${key}]}"

  if ncat -z localhost "${port}"; then
    echo "localhost:${port} IN USE"
  else
    echo "forwarding localhost:${port} to ${host}:${port}"
    while ncat -l -p "${port}" -k -c "nc ${host} ${port}" || true; do true; done &
  fi
done
echo ""

wait $pid
