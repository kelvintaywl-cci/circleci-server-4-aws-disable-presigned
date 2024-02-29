
# locals {
#   s3_iam_user_arn_split = split("/", var.aws_s3_iam_user_arn)
#   # last element is our IAM user name
#   s3_iam_user_name = element(local.s3_iam_user_arn_split, length(local.s3_iam_user_arn_split) - 1)
# }

# NOTE: Validates that these resources must exist
data "aws_s3_bucket" "existing" {
  bucket = var.aws_s3_bucket_name
}

data "aws_iam_user" "existing" {
  user_name = var.aws_s3_iam_user_name
}

resource "aws_iam_role" "s3_iam_role" {
  name = var.aws_s3_iam_role_name
  depends_on = [
    data.aws_iam_user.existing,
    data.aws_s3_bucket.existing
  ]

  assume_role_policy = templatefile(
    "${path.module}/tmpl/s3_iam_role_trust_policy.json.tftpl",
    {
      s3_iam_user_arn = data.aws_iam_user.existing.arn
    }
  )
}

resource "aws_iam_role_policy" "s3_iam_role_policy" {
  name = var.aws_s3_iam_role_name
  role = aws_iam_role.s3_iam_role.id

  policy = templatefile(
    "${path.module}/tmpl/s3_iam_role_policy.json.tftpl",
    {
      s3_bucket = var.aws_s3_bucket_name
    }
  )
}

resource "aws_iam_policy" "allow_assume_role" {
  name = "allow-assume-${aws_iam_role.s3_iam_role.name}"
  description = "Allow assuming of role: ${aws_iam_role.s3_iam_role.name}"
  policy = templatefile(
    "${path.module}/tmpl/s3_iam_user_policy_allowassume.json.tftpl",
    {
      s3_iam_role_arn = aws_iam_role.s3_iam_role.arn
    }
  )
}

resource "aws_iam_user_policy_attachment" "attach_managed" {
  user       = data.aws_iam_user.existing.user_name
  policy_arn = aws_iam_policy.allow_assume_role.arn
}
