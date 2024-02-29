# Introduction

This Terraform stack helps you "migrate" to disabling presigned URLs for your CircleCI Server 4.x storage settings.

Specifically, this is meant for if you had opted to use IAM user (access key + secret access key) for authentication.
Ref: https://circleci.com/docs/server/v4.3/installation/phase-1-prerequisites/#set-up-authentication-aws

## Notes

This was tested on a CircleCI Server 4.3.x installation on AWS.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.38.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.38.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.allow_assume_role](https://registry.terraform.io/providers/hashicorp/aws/5.38.0/docs/resources/iam_policy) | resource |
| [aws_iam_role.s3_iam_role](https://registry.terraform.io/providers/hashicorp/aws/5.38.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.s3_iam_role_policy](https://registry.terraform.io/providers/hashicorp/aws/5.38.0/docs/resources/iam_role_policy) | resource |
| [aws_iam_user_policy_attachment.attach_managed](https://registry.terraform.io/providers/hashicorp/aws/5.38.0/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user.existing](https://registry.terraform.io/providers/hashicorp/aws/5.38.0/docs/data-sources/iam_user) | data source |
| [aws_s3_bucket.existing](https://registry.terraform.io/providers/hashicorp/aws/5.38.0/docs/data-sources/s3_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Your AWS region (e.g., `us-east-1`) | `string` | n/a | yes |
| <a name="input_aws_s3_bucket_name"></a> [aws\_s3\_bucket\_name](#input\_aws\_s3\_bucket\_name) | S3 bucket name | `string` | n/a | yes |
| <a name="input_aws_s3_iam_role_name"></a> [aws\_s3\_iam\_role\_name](#input\_aws\_s3\_iam\_role\_name) | Name for the new S3 IAM role | `string` | n/a | yes |
| <a name="input_aws_s3_iam_user_name"></a> [aws\_s3\_iam\_user\_name](#input\_aws\_s3\_iam\_user\_name) | Name of the existing AWS IAM user for your S3 bucket | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_s3_iam_role_arn"></a> [aws\_s3\_iam\_role\_arn](#output\_aws\_s3\_iam\_role\_arn) | n/a |
<!-- END_TF_DOCS -->