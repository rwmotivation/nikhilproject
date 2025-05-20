provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile # Optional: remove this line if not using AWS named profiles
}
