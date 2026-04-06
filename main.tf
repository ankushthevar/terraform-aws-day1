terraform {
  required_version = ">=1.7"
  required_providers {
    aws ={
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
    region = var.aws_region
    default_tags {
      tags ={
        Project = var.project_name
        Environment = var.environment
        ManagedBy  = "terraform"
      }
    }
  
}
locals {
  # Consistent naming convention across all resources
  name_prefix = "${var.project_name}-${var.environment}"

  # Merge default tags with caller-supplied tags
  # caller tags win on conflict (right side wins in merge)
  common_tags = merge(
    {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "terraform"
      CreatedAt   = timestamp()
    },
    var.tags
  )

  # Derive the bucket name with account ID for global uniqueness
  bucket_name = "${local.name_prefix}-${data.aws_caller_identity.current.account_id}"

  # Versioning status as a string (the resource expects "Enabled"/"Suspended")
  versioning_status = var.enable_versioning ? "Enabled" : "Suspended"
}

resource "aws_s3_bucket" "main" {
  bucket = local.bucket_name
  tags   = local.common_tags
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id
  versioning_configuration {
    status = local.versioning_status
  }
}

data "aws_caller_identity" "current" {}