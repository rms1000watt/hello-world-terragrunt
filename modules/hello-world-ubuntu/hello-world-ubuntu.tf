data "template_file" "userdata" {
  template = "${file("../../common/userdata/hello-world.sh.tpl")}"

  vars {
    name = "${var.hello_world_name}"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "image-type"
    values = ["machine"]
  }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
}

// resource "aws_security_group" "sg" {
//   name        = "${var.org_name}-${var.environment}-${var.module_name}-sg-0"
//   description = "Any/Any"
//   vpc_id      = "${data.terraform_remote_state.vpc.vpc_id}"

//   ingress {
//     from_port = 0
//     to_port   = 0
//     protocol  = -1
//     cidr_blocks = ["0.0.0.0/0"]
//   }

//   egress {
//     from_port   = 0
//     to_port     = 0
//     protocol    = -1
//     cidr_blocks = ["0.0.0.0/0"]
//   }

//   tags {
//     Name = "${var.org_name}-${var.environment}-${var.module_name}-sg-0"
//   }
// }

resource "aws_instance" "ubuntu" {
  count                       = "${var.instance_count}"
  instance_type               = "${var.instance_type}"
  ami                         = "${data.aws_ami.ubuntu.id}"
  key_name                    = "${var.org_name}-${var.environment}-keypair"
  vpc_security_group_ids      = ["${data.terraform_remote_state.sg.any_any_id}"]
  subnet_id                   = "${element(data.terraform_remote_state.vpc.public_subnets, count.index)}"
  user_data                   = "${data.template_file.userdata.rendered}"

  tags {
    Name = "${var.org_name}-${var.environment}-${var.module_name}-${count.index}"
  }
}
