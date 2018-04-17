terragrunt {
  terraform {
    source = "git::git@github.com:rms1000watt/hello-world-terragrunt//modules/hello-world-ubuntu?ref=0.0.7"
  }
  include {
    path = "${find_in_parent_folders()}"
  }
}

instance_count = 1
instance_type = "t2.nano"
hello_world_name = "Pizza Fish"
