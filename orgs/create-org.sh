#!/usr/bin/env bash

org_name="org-q"
aws_profile="org-q"
aws_region="us-west-2"

envs=("dev" "qa" "uat" "prod" "global")

create-env() {
  env=$1

  mkdir "$env"
  echo 'environment = "'"$env"'"' > "$env/$env.tfvars"
}

create-org() {
  if [ ! -d $org_name ]; then
    mkdir $org_name
  fi

  cd $org_name || exit 1

  optional_var_files_envs=""
  for env in "${envs[@]}"; do
    create-env "$env"
    optional_var_files_envs+='        "${get_tfvars_dir()}/${find_in_parent_folders("'"$env"'.tfvars", "ignore")}",NL'
  done

  optional_var_files_envs=$(echo "$optional_var_files_envs" | sed 's|\(.*\)NL|\1 |' | sed $'s|NL|\\\n|g')

  cat << EOF > "$org_name.tfvars"
aws_region  = "$aws_region"
aws_profile = "$aws_profile"
org_name    = "$org_name"
EOF

  cat << EOF > "main.tf"
variable "org_name" {}
variable "aws_region" {}
variable "environment" {}

provider "aws" {
  region = "\${var.aws_region}"
}

terraform {
  backend "s3" {}
}
EOF

  cat << EOF > "terraform.tfvars"
terragrunt {
  remote_state {
    backend = "s3"
    config {
      profile        = "${org_name}"
      bucket         = "${org_name}-global-terraform-state"
      region         = "${aws_region}"
      dynamodb_table = "terraform-locks"
      key            = "\${path_relative_to_include()}/terraform.tfstate"
      encrypt        = true
    }
  }
  terraform {
    extra_arguments "comands_that_need_vars" {
      commands = ["init", "\${get_terraform_commands_that_need_vars()}"]
      optional_var_files = [
        "\${get_tfvars_dir()}/\${find_in_parent_folders("${org_name}.tfvars")}",
${optional_var_files_envs}
      ]
    }
  }
}
EOF

  cd ..
}

create-org
