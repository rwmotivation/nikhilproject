terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Optional: Remote state backend
  backend "s3" {
    bucket         = "nikhil-tf-state-bucket"
    key            = "cdx-platform/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"  # Optional: remove if not using AWS CLI named profiles
}
