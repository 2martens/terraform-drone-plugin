#!/bin/sh

cd "$PLUGIN_PATH" && \
 TF_TOKEN_app_terraform_io=$PLUGIN_API_TOKEN \
 terraform $PLUGIN_ARGS
