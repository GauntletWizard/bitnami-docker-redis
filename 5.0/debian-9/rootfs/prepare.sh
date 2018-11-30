#!/bin/bash

# shellcheck disable=SC1091

# Load libraries
. /libredis.sh
. /libfs.sh

# Load Redis env. variables
eval "$(redis_env)"

for dir in "$REDIS_VOLUME" "${REDIS_VOLUME}/data" "$REDIS_TMPDIR" "$REDIS_CONFDIR"  "$REDIS_LOGDIR"; do
    ensure_dir_exists "$dir" 1001
done
chmod -R g+rwX /bitnami "$REDIS_VOLUME" "$REDIS_BASEDIR"
