output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.main.id
}

output "bucket_arn" {
  description = "ARN for use in IAM policies"
  value       = aws_s3_bucket.main.arn
}

output "bucket_region" {
  description = "Region the bucket was created in"
  value       = aws_s3_bucket.main.region
}

output "bucket_domain_name" {
  description = "Domain name for direct S3 access"
  value       = aws_s3_bucket.main.bucket_domain_name
}

output "name_prefix" {
  description = "Naming prefix used — useful for downstream modules"
  value       = local.name_prefix
}

output "tags_applied" {
  description = "Full tag map applied to all resources"
  value       = local.common_tags
}