resource "aws_apigatewayv2_api" "http_api" {
  name          = "microservices-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "appointment_integration" {
  api_id             = aws_apigatewayv2_api.http_api.id
  integration_type   = "AWS_PROXY"
  integration_uri    = aws_lambda_function.appointment_lambda.invoke_arn
  integration_method = "POST"
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_integration" "patient_integration" {
  api_id             = aws_apigatewayv2_api.http_api.id
  integration_type   = "AWS_PROXY"
  integration_uri    = aws_lambda_function.patient_lambda.invoke_arn
  integration_method = "POST"
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "appointment_route" {
  api_id    = aws_apigatewayv2_api.http_api.id
  route_key = "POST /appointment"
  target    = "integrations/${aws_apigatewayv2_integration.appointment_integration.id}"
}

resource "aws_apigatewayv2_route" "patient_route" {
  api_id    = aws_apigatewayv2_api.http_api.id
  route_key = "POST /patient"
  target    = "integrations/${aws_apigatewayv2_integration.patient_integration.id}"
}
