#!/bin/sh

working_dir=$(pwd)
echo "change to $working_dir/$PLUGIN_PATH"
cd "$working_dir/$PLUGIN_PATH" || exit 1
terraform init
if [ "$PLUGIN_AUTO_APPROVE" = "true" ]
then
  auto_approve=" -auto-approve"
else
  auto_approve=""
fi
if [ "$PLUGIN_SPECULATIVE" = "true" ]
then
  command="plan"
else
  command="apply"
fi
echo "Run terraform init"
TF_TOKEN_app_terraform_io="$PLUGIN_API_TOKEN" terraform init
TF_TOKEN_app_terraform_io="$PLUGIN_API_TOKEN" terraform "$command" -input=false"$auto_approve"
TF_TOKEN_app_terraform_io="$PLUGIN_API_TOKEN" terraform output -json > "$working_dir/terraform_output"
cd "$working_dir" || exit 1
