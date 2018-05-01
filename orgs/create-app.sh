#!/usr/bin/env bash

region_global="global"

create-app() {
  org_name=$1
  region=$2
  environment=$3
  app_name=$4

  path="$org_name/$region/$environment/$app_name"
  if [ "$region" = "$region_global" ]; then
    path="$org_name/$region/$app_name"
  fi

  echo "App location: $path"

  if [ ! -d "$path" ]; then
    echo "Making directories: $path"
    mkdir -p "$path" || exit 1
  fi

  wd=$(pwd)
  cd "$path" || exit 1
  if [ "$region" = "$region_global" ]; then
    ln -s ../../../main.tf
  else
    ln -s ../../../../main.tf
  fi
  cd "$wd" || exit 1

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
}


if [ -z "$1" ]; then echo "ERROR: \$1 (org_name) not specified. Exiting.."    && exit 1; fi
if [ -z "$1" ]; then echo "ERROR: \$2 (region) not specified. Exiting.."      && exit 1; fi
if [ -z "$2" ]; then echo "ERROR: \$3 (environment) not specified. Exiting.." && exit 1; fi
if [ -z "$3" ]; then echo "ERROR: \$4 (app_name) not specified. Exiting.."    && exit 1; fi
create-app "$1" "$2" "$3" "$4"
