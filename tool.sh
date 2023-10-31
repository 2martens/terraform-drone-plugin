#!/bin/sh

working_dir=$(pwd)
cd "$PLUGIN_PATH" || exit 1
terraform init
if [ "$PLUGIN_AUTO_APPROVE" = "true" ]
then
  auto_approve=" -auto-approve"
else
  auto_approve=""
fi
TF_TOKEN_app_terraform_io=$PLUGIN_API_TOKEN terraform apply -input=false"$auto_approve"
TF_TOKEN_app_terraform_io=$PLUGIN_API_TOKEN terraform output -json > "$working_dir/terraform_output"
cd "$working_dir" || exit 1
