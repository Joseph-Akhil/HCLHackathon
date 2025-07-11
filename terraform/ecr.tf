
#ECR_appointment_repository
resource "aws_ecr_repository" "appointment" {
  name = "appointmentservice"
}

#ECR_patient_repository
resource "aws_ecr_repository" "patient" {
  name = "patientservice"
}