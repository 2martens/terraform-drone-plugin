#!/bin/sh

cd "$PLUGIN_PATH" && \
 /usr/local/bin/tfci \
  -organization="$PLUGIN_CLOUD_ORGANIZATION" \
  -token="$PLUGIN_API_TOKEN" $PLUGIN_ARGS
