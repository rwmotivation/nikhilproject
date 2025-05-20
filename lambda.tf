resource "aws_lambda_function" "welcome_lambda" {
  function_name    = "welcome_lambda_function"
  filename         = "${path.module}/function/lambda_function_payload.zip"
  handler          = "app.lambda_handler"
  runtime          = "python3.11"
  role             = aws_iam_role.lambda_exec_role.arn
  source_code_hash = filebase64sha256("${path.module}/function/lambda_function_payload.zip")

  environment {
    variables = {
      LOG_LEVEL = "INFO"
    }
  }

  timeout     = 10
  memory_size = 128
}
