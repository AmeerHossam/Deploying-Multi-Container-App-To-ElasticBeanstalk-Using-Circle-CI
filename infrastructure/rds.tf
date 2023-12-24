resource "aws_db_instance" "default" {
  depends_on = [ aws_security_group.my_security_group ]
  db_name              = "fibvalues"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "12.17"
  port                 = "5432"
  instance_class       = "db.t2.micro"
  username             = "postgres"
  password             = "postgrespassword"
  parameter_group_name = "default.postgres12"
  skip_final_snapshot = true

  vpc_security_group_ids = ["${aws_security_group.my_security_group.id}" , "sg-0f1d5e6f2c2b75b29"]

  tags = {
    Name = "MyPostgresDB"
  }
}

output "address" {
  description = "The address to connect to the DB instance."
  value       = aws_db_instance.default.address
}

output "arn" {
  description = "The ARN of the DB instance."
  value       = aws_db_instance.default.arn
}
