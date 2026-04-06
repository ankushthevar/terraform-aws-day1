variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "ap-south-1"

  validation {
    condition     = contains(["ap-south-1", "us-east-1", "eu-west-1"], var.aws_region)
    error_message = "Region must be ap-south-1, us-east-1, or eu-west-1."
  }
}

variable "project_name" {
  description = "Short slug used in all resource names"
  type        = string
  default     = "tflearn"

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{2,12}$", var.project_name))
    error_message = "project_name must be 3-13 chars, lowercase letters, numbers, hyphens only."
  }
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be dev, staging, or prod."
  }
}

variable "enable_versioning" {
  description = "Enable S3 object versioning"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags to apply to all resources"
  type        = map(string)
  default     = {}
}