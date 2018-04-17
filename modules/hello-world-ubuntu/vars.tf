variable "instance_count" {
  description = "The number of instances to deploy"
}

variable "instance_type" {
  description = "The type of instance to deploy (t2.micro, t2.2xlarge, etc.)"
}

variable "hello_world_name" {
  description = "The name to write in the hello-world.txt file"
}
