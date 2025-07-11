#Lambda_Appointment_function
resource "aws_lambda_function" "appointment_lambda" {
  function_name = "appointmentservice"
  image_uri     = "${aws_ecr_repository.appointment.repository_url}:latest"
  package_type  = "Image"
  role          = aws_iam_role.lambda_exec_role.arn
  timeout       = 10
  memory_size   = 512
}

#Lambda_Patient_function
resource "aws_lambda_function" "patient_lambda" {
  function_name = "patientservice"
  image_uri     = "${aws_ecr_repository.patient.repository_url}:latest"
  package_type  = "Image"
  role          = aws_iam_role.lambda_exec_role.arn
  timeout       = 10
  memory_size   = 512
}

#Lambda_APIGateway_integration_appointment_function
resource "aws_lambda_permission" "apigw_appointment" {
  statement_id  = "AllowAPIGatewayInvokeAppointment"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.appointment_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.http_api.execution_arn}/*/*"
}

#Lambda_APIGateway_integration_patient_function
resource "aws_lambda_permission" "apigw_patient" {
  statement_id  = "AllowAPIGatewayInvokePatient"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.patient_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.http_api.execution_arn}/*/*"
}