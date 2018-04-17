#!/usr/bin/env bash

create-app() {
  path=$1

  echo "App location: $path"

  if [ ! -d "$path" ]; then
    echo "Making directories: $path"
    mkdir -p "$path"
  fi

  file="$path/main.tf"
  if [ ! -f "$file" ]; then
    echo "Creating file: $file"
    cat << EOF > "$file"
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
  fi

  file="$path/terraform.tfvars"
  if [ ! -f "$file" ]; then
    echo "Creating file: $file"
    cat << EOF > "$file"
terragrunt {
  include {
    path = "\${find_in_parent_folders()}"
  }
}
EOF
  fi

  # file="$path/$(basename "$path").tf"
  # if [ ! -f "$file" ]; then
  #   echo "Creating file: $file"
  #   echo "// TODO: Put app definition here" > "$file"
  # fi
}


if [ -z "$1" ]; then echo "ERROR: App path not specified. Exiting.." && exit 1; fi
create-app "$1"
