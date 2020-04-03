data "aws_iam_policy_document" "role_assumption_policy" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]

    principals {
      identifiers = [
        "ec2.amazonaws.com"
      ]
      type = "Service"
    }
  }
}

resource "aws_iam_role" "reader_role" {
  assume_role_policy = data.aws_iam_policy_document.role_assumption_policy.json
}

resource "aws_iam_role" "writer_role" {
  assume_role_policy = data.aws_iam_policy_document.role_assumption_policy.json
}

module "ecr" {
  source = "../.."

  name = var.name
  pull_arns = [aws_iam_role.reader_role.arn]
  push_arns = [aws_iam_role.writer_role.arn]
}
