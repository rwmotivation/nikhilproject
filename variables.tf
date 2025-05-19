variable "aws_region" {
  description = "The AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  type        = string
  default     = "default"
}
variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "cdx-welcome-lambda"
}