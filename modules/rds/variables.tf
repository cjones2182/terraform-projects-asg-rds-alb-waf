variable "aws_secretsmanager_secret" {
  description = "rds password"
  type = string
}
variable "rds_security_group" {
  description = "rds security group"
  type = string
}
variable "database_subnets" {
  description = "database subnets"
  type = list(string)
}
variable "environment" {
  description = "environment"
  type = string
}