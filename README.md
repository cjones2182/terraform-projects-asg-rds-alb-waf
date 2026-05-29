# Terraform AWS Infrastructure

Deployed a complete AWS environment using Terraform modules. Architecture includes VPC with public/private/database subnets across multiple AZs, ECS Fargate cluster running 3 container instances, RDS MySQL with Multi-AZ, ALB with WAF protection and S3 access logging, Secrets Manager for credentials. Security groups follow least-privilege pattern. All infrastructure is version controlled and repeatable.

## Stack
Terraform | AWS | ECS Fargate | RDS MySQL | ALB | WAFv2 | S3 | Secrets Manager

## Folder Structure
- modules/vpc - Network with NAT gateways and VPC endpoints
- modules/security-groups - Tier-specific firewall rules
- modules/alb - Load balancer with access logging
- modules/ecs - Task definitions and service configuration
- modules/rds - MySQL database in private subnets
- modules/s3 - Encrypted logging bucket
- modules/secrets - RDS credential storage
- modules/waf - AWS managed rule sets

## Deployment
terraform init && terraform apply
