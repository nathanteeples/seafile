#!/bin/bash
# The stock entrypoint leaves Seafile running until my_init kills every process,
# by which time runit has already stopped the built-in MariaDB and Redis under it.
# Pre-shutdown scripts run before runit stops anything.
for base in "/opt/seafile/seafile-pro-server-${SEAFILE_VERSION}" "/opt/seafile/seafile-server-${SEAFILE_VERSION}"; do
  if [ -d "$base" ]; then
    cd "$base" || exit 0
    ./seahub.sh stop || true
    ./seafile.sh stop || true
    exit 0
  fi
done
exit 0
