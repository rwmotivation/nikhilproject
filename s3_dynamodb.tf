# Reference existing S3 bucket (already created manually or in earlier Terraform)
data "aws_s3_bucket" "tf_state" {
  bucket = "nikhil-tf-state-bucket"  # Make sure this matches your actual bucket name
}

# Reference existing DynamoDB table
data "aws_dynamodb_table" "tf_lock" {
  name = "tf-state-lock"  # Make sure this matches your actual table name
}

# Remove this block entirely if using data source:
# resource "aws_s3_bucket_versioning" "tf_state_versioning" {
#   bucket = aws_s3_bucket.tf_state.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# Instead, versioning must already be enabled manually on the S3 bucket,
# OR you must manage the bucket with a resource instead of data.
