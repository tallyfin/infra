variable "private_subnet_ids" {
  description = "Private subnets in eu-central-1a, 1b and 1c."
  type        = list(string)
}

variable "rotation_lambda_arn" {
  description = "ARN of the RDS password rotation Lambda."
  type        = string
}
