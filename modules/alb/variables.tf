variable "alb_security_group" {
  description = "alb security group"
  type = string
}
variable "public_subnets" {
  description = "public subnets"
  type = list(string)
}
variable "central_log_bucket281330" {
  description = "acess logs bucket"
  type = string
}
variable "vpc_id" {
  description = "vpc id"
  type = string
}
variable "environment" {
  description = "environment name"
  type = string
}