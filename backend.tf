terraform {
  backend "s3" {
    bucket         = "nikhil-tf-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-state-lock"
  }
}
