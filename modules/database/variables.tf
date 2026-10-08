variable "name" {
  description = "Name prefix for all database resources."
  type        = string
}

variable "instance_class" {
  description = "RDS instance class."
  type        = string
  default     = "db.t4g.medium"
}

variable "subnet_ids" {
  description = "Private subnets the database is placed in."
  type        = list(string)
}

variable "allowed_security_group_ids" {
  description = "Security groups allowed to connect on 5432."
  type        = list(string)
  default     = []
}

variable "rotation_lambda_arn" {
  description = "Lambda that rotates the master password. Rotation is off when null."
  type        = string
  default     = null
}

variable "rotation_days" {
  description = "Days between master password rotations."
  type        = number
  default     = 30
}
