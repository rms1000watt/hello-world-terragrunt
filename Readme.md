# Hello World Terragrunt

## Introduction

This is an example Terraform/Terragrunt repo for maintaining an organization.

## Contents

- [Install](#install)
- [Run](#run)
- [Dev](#dev)

## Install

```bash
brew install terraform terragrunt
pip install jinja2 jinja2-cli
```

## Run

```bash
# Render all Jinja templates
for file in $(find . -name '*.j2'); do
  if [ ! -f "${file//.j2/.json}" ]; then continue; fi
  echo "Rendering: $file"
  jinja2 "$file" "${file//.j2/.json}" > "${file//.j2/.tf}"
done

# Handle org-x
export AWS_PROFILE=org-x
cd orgs/org-x

# Handle IAM (users/groups/policies)
cd global/iam
terragrunt plan
terragrunt apply

# Handle S3 buckets
cd ../s3
terragrunt plan
terragrunt apply

# Handle VPC
cd ../../dev/vpc
terragrunt plan
terragrunt apply

# Plan Security Groups
cd ../sg
terragrunt plan
terragrunt apply

# Plan hello-world-ubuntu configuration
cd ../hello-world-ubuntu
terragrunt plan
terragrunt apply
```

## Dev

Future development can use the `create-org.sh` and `create-app.sh` scripts in the `org` directory for making additional organizations and applications within organizations.

### Advanced Dev

The `org-x/dev/vpc` app references an internal module with a bunch of output. The output has to be copied from the internal module and recreated in the `org-x/dev/vpc` app. To extract all the output, you can run something similar to the command below.

```bash
sed 's|// output "||g' < output.tf | sed 's|" {||g' | grep -v "//" | grep . | awk '{printf "output \"%s\" {\n\tvalue = \"${module.vpc.%s}\"\n}\n", $1, $1}'
```