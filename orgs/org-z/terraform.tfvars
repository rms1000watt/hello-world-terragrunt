terragrunt {
  remote_state {
    backend = "s3"
    config {
      profile        = "org-z"
      bucket         = "org-z-global-terraform-state"
      region         = "us-west-2"
      dynamodb_table = "terraform-locks"
      key            = "${path_relative_to_include()}/terraform.tfstate"
      encrypt        = true
    }
  }
  terraform {
    extra_arguments "comands_that_need_vars" {
      commands = ["init", "${get_terraform_commands_that_need_vars()}"]
      optional_var_files = [
        "${get_tfvars_dir()}/${find_in_parent_folders("org-z.tfvars")}",
        "${get_tfvars_dir()}/${find_in_parent_folders("dev.tfvars", "ignore")}",
        "${get_tfvars_dir()}/${find_in_parent_folders("qa.tfvars", "ignore")}",
        "${get_tfvars_dir()}/${find_in_parent_folders("uat.tfvars", "ignore")}",
        "${get_tfvars_dir()}/${find_in_parent_folders("prod.tfvars", "ignore")}",
        "${get_tfvars_dir()}/${find_in_parent_folders("global.tfvars", "ignore")}",
      ]
    }
  }
}
