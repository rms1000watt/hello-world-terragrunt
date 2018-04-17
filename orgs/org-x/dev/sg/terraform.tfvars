terragrunt {
  terraform {
    source = "git::git@github.com:rms1000watt/hello-world-terragrunt//modules/sg?ref=0.0.7"
  }
  include {
    path = "${find_in_parent_folders()}"
  }
}
