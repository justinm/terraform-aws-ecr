resource "aws_ecr_repository" "this" {
  count = var.enabled ? 1 : 0
  name  = var.name
}

resource "aws_ecr_repository_policy" "this" {
  count      = var.enabled ? 1 : 0
  policy     = data.aws_iam_policy_document.this.json
  repository = aws_ecr_repository.this[0].name
}

data "aws_iam_policy_document" "this" {
  override_json = var.ecr_policy

  dynamic "statement" {
    for_each = length(var.pull_arns) > 0 ? [""] : []
    content {
      actions = [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
      ]

      principals {
        type        = "AWS"
        identifiers = var.pull_arns
      }
    }
  }

  dynamic "statement" {
    for_each = length(var.push_arns) > 0 ? [""] : []

    content {
      actions = [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:PutImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload",
        "ecr:GetAuthorizationToken"
      ]

      principals {
        type        = "AWS"
        identifiers = var.push_arns
      }
    }
  }
}
