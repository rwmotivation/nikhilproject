resource "aws_apigateway2_api" "http_api" {
  name          = "cdx-http-api"
  protocol_type = "HTTP"
}

resource "aws_apigateway2_integration" "lambda_integration" {
  api_id                 = aws_apigateway2_api.http_api.id
  integration_type       = "AWS_PROXY"
  integration_uri        = aws_lambda_function.welcome_lambda.invoke_arn
  integration_method     = "POST"
  payload_format_version = "2.0"
}

resource "aws_apigateway2_route" "default_route" {
  api_id    = aws_apigateway2_api.http_api.id
  route_key = "GET /"
  target    = "integrations/${aws_apigateway2_integration.lambda_integration.id}"
}

resource "aws_apigateway2_stage" "default" {
  api_id      = aws_apigateway2_api.http_api.id
  name        = "$default"
  auto_deploy = true
}

resource "aws_lambda_permission" "allow_apigw_invoke" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.welcome_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigateway2_api.http_api.execution_arn}/*/*"
}
