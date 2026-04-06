# terraform-aws-day1

Provisions a production-ready S3 bucket on AWS using Terraform.

## Features
- Versioning enabled
- Server-side AES256 encryption
- All public access blocked
- Default tags for cost tracking

## Usage
```bash
terraform init
terraform plan
terraform apply
```

## Resources created
| Resource | Description |
|---|---|
| aws_s3_bucket | Main storage bucket |
| aws_s3_bucket_versioning | Enables object versioning |
| aws_s3_bucket_server_side_encryption_configuration | AES256 encryption at rest |
| aws_s3_bucket_public_access_block | Blocks all public access 
