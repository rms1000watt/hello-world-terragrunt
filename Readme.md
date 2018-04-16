# Hello World Terragrunt

## Introduction

This is an example Terraform/Terragrunt repo for maintaining an organization.

## Contents

- [Install](#install)
- [Run](#run)

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

# Plan IAM configuration
cd global/iam
terragrunt plan

# Plan S3 configuration
cd global/s3
terragrunt plan
```
