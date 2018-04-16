resource "aws_iam_group_membership" "admin" {
  name  = "admin_membership"
  group = "admin"
  users = [
    "${aws_iam_user.wilma_flintstone.name}",
    "${aws_iam_user.betty_rubble.name}",
  ]
}

resource "aws_iam_group_membership" "dev" {
  name  = "dev_membership"
  group = "dev"
  users = [
    "${aws_iam_user.fred_flintstone.name}",
    "${aws_iam_user.barney_rubble.name}",
  ]
}

resource "aws_iam_group_membership" "qa" {
  name  = "qa_membership"
  group = "qa"
  users = [
    "${aws_iam_user.pebbles_flintstone.name}",
    "${aws_iam_user.bammbamm_rubble.name}",
  ]
}
