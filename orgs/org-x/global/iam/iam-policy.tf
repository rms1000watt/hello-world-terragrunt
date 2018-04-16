data "template_file" "dev" {
  template = "${file("../../../../common/policies/dev.json.tpl")}"
  vars {}
}

resource "aws_iam_policy" "dev" {
  name        = "dev"
  path        = "/"
  description = "Dev access for devs"
  policy      = "${data.template_file.dev.rendered}"
}

data "template_file" "qa" {
  template = "${file("../../../../common/policies/qa.json.tpl")}"
  vars {}
}

resource "aws_iam_policy" "qa" {
  name        = "qa"
  path        = "/"
  description = "QA access for qa engineers"
  policy      = "${data.template_file.qa.rendered}"
}

