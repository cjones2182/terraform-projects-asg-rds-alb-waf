resource "aws_vpc_endpoint" "secrets_manager" {
 vpc_id =  aws_vpc.main.id
 service_name      = "com.amazonaws.us-east-1.secretsmanager"
  vpc_endpoint_type = "Interface"

private_dns_enabled = true

security_group_ids = [ var.endpoint_security_group]
subnet_ids =  aws_subnet.private_subnets[*].id 
}