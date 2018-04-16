resource "aws_iam_group_policy_attachment" "admin" {
  group      = "${aws_iam_group.admin.name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_policy_attachment" "dev" {
  group      = "${aws_iam_group.dev.name}"
  policy_arn = "${aws_iam_policy.dev.arn}"
}

resource "aws_iam_group_policy_attachment" "qa" {
  group      = "${aws_iam_group.qa.name}"
  policy_arn = "${aws_iam_policy.qa.arn}"
}
