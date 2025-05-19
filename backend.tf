# backend.tf (this file is used locally, not deployed)
terraform {
  backend "s3" {
    bucket         = "nikhil-tf-state-bucket"
    key            = "cdx-eval/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "tf-state-lock" # optional for state locking
  }
}
