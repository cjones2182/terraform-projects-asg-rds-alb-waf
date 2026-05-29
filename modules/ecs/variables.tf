variable "environment" {
  description = "environment"
  type = string
}
variable "aws_secretsmanager_secret" {
  description = "secret for RDS"
  type = string
}
variable "alb_target_group" {
  description = "taget group"
  type = string
}
variable "app_security_group" {
  description = "app security group"
  type = string
}
variable "private_subnets" {
  description = "private subnets"
  type = list(string)
}