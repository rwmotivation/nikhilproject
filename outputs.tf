output "api_url" {
  description = "Public URL of the HTTP API Gateway"
  value       = aws_apigateway2_api.http_api.api_endpoint
}
