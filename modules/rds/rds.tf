resource "aws_db_instance" "main_rds" {
  allocated_storage    = 10
  db_name              = "mainRdsStorage"
  engine               = "mysql"
  engine_version       = "8.4.8"
  instance_class       = "db.t3.micro"
  username             = "app_user"
  password             = var.aws_secretsmanager_secret
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.rds_security_group]
  multi_az = true
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  storage_encrypted = true

  tags = {
    name = "${var.environment}-main-rds"
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
 subnet_ids =  var.database_subnets 
}