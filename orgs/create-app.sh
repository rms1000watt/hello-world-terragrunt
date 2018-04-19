#!/usr/bin/env bash

create-app() {
  org_name=$1
  environment=$2
  app_name=$3
  path="$1/$2/$3"

  echo "App location: $path"

  if [ ! -d "$path" ]; then
    echo "Making directories: $path"
    mkdir -p "$path" || exit 1
  fi

  wd=$(pwd)
  cd "$path" || exit 1
  ln -s ../../main.tf
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
if [ -z "$2" ]; then echo "ERROR: \$2 (environment) not specified. Exiting.." && exit 1; fi
if [ -z "$3" ]; then echo "ERROR: \$3 (app_name) not specified. Exiting.."    && exit 1; fi
create-app "$1" "$2" "$3"
