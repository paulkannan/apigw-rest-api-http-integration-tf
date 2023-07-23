provider "aws" {
  region = "us-east-1"  # Replace this with your desired AWS region
}

resource "aws_api_gateway_rest_api" "api" {
  name        = "apigw-rest-api-http-integration"
  description = "HTTP Integration REST API demo"
}

resource "aws_api_gateway_method" "root_method_get" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_rest_api.api.root_resource_id
  http_method   = "GET"
  authorization = "NONE"
}

variable "get_http_url" {
  description = "HTTP URL for integration"
}

resource "aws_api_gateway_integration" "http_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_method.root_method_get.resource_id
  http_method             = aws_api_gateway_method.root_method_get.http_method
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = var.get_http_url
}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  depends_on  = [aws_api_gateway_method.root_method_get]
}

resource "aws_api_gateway_stage" "stage" {
  stage_name    = "Prod"
  rest_api_id   = aws_api_gateway_rest_api.api.id
  deployment_id = aws_api_gateway_deployment.deployment.id
}

output "api_endpoint" {
  description = "API Endpoint"
  value       = aws_api_gateway_stage.stage.invoke_url
}
