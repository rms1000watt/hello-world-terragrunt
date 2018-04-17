resource "aws_security_group" "any_any" {
  name        = "${var.org_name}-${var.environment}-any-any"
  description = "Allow all traffic"
  vpc_id      = "${data.terraform_remote_state.vpc.vpc_id}"
}

resource "aws_security_group_rule" "egress_any" {
  type            = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = -1
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.any_any.id}"
}

resource "aws_security_group_rule" "ingress_any" {
  type            = "ingress"
  from_port       = 0
  to_port         = 0
  protocol        = -1
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.any_any.id}"
}