#!/usr/bin/env bash

org_name="org-q"
aws_profile="org-q"
aws_remote_state_region="us-west-2"

region_global="global"
regions=("us-east-1" "us-west-2")
envs=("dev" "qa" "uat" "prod")

create-env() {
  env=$1

  mkdir "$env"
  echo 'environment = "'"$env"'"' > "$env/env.tfvars"
}

create-region() {
  region=$1

  mkdir "$region"
  cd "$region"

  echo 'aws_region = "'"$region"'"' > "region.tfvars"

  for env in "${envs[@]}"; do
    create-env "$env"
  done

  cd ..
}

create-global() {
  mkdir "$region_global"
  echo 'environment = "global"'                      > "$region_global/env.tfvars"
  echo 'aws_region = "'"$aws_remote_state_region"'"' > "$region_global/region.tfvars"
}

create-org() {
  if [ ! -d $org_name ]; then
    mkdir $org_name
  fi

  cd $org_name || exit 1

  create-global
  for region in "${regions[@]}"; do
    create-region "$region"
  done

  cat << EOF > "$org_name.tfvars"
aws_profile = "$aws_profile"
org_name    = "$org_name"

aws_remote_state_region = "$aws_remote_state_region"
EOF

  cat << EOF > "terraform.tfvars"
terragrunt {
  remote_state {
    backend = "s3"
    config {
      profile        = "${org_name}"
      bucket         = "${org_name}-global-terraform-state"
      region         = "${aws_remote_state_region}"
      dynamodb_table = "terraform-locks"
      key            = "\${path_relative_to_include()}/terraform.tfstate"
      encrypt        = true
    }
  }
  terraform {
    extra_arguments "comands_that_need_vars" {
      commands = ["init", "\${get_terraform_commands_that_need_vars()}"]
      optional_var_files = [
        "\${get_tfvars_dir()}/\${find_in_parent_folders("org.tfvars")}",
        "\${get_tfvars_dir()}/\${find_in_parent_folders("env.tfvars")}",
        "\${get_tfvars_dir()}/\${find_in_parent_folders("region.tfvars")}",
      ]
    }
  }
}
EOF

  cd ..
}

create-org
