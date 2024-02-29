output "aws_s3_iam_role_arn" {
    value = aws_iam_role.s3_iam_role.arn
}

output "helm_values_to_modify" {
    value = yamlencode({object_storage: { s3: { presigned: false, storageRole: aws_iam_role.s3_iam_role.arn}}})
    description = "Update your Helm values with these modifications"
}
