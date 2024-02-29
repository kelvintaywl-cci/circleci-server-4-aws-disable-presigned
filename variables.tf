variable "aws_region" {
  type        = string
  description = "Your AWS region (e.g., `us-east-1`)"
}

variable "aws_s3_bucket_name" {
  type        = string
  description = "S3 bucket name"
}

variable "aws_s3_iam_user_name" {
  type        = string
  description = "Name of the existing AWS IAM user for your S3 bucket"
}

variable "aws_s3_iam_role_name" {
  type        = string
  description = "Name for the new S3 IAM role"
}
