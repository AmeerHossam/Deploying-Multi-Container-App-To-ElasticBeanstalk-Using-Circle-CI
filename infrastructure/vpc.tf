resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "Security group for allowing traffic on ports 5432 to 6379"
  vpc_id      = "vpc-08ab7d5039a224b27"
}

resource "aws_security_group_rule" "allow_traffic_5432_6379" {
  type        = "ingress"
  from_port   = 5432
  to_port     = 6379
  protocol    = "tcp"  # Specify the protocol (tcp/udp)
  cidr_blocks = ["0.0.0.0/0"]  # Replace with your CIDR block

  security_group_id = aws_security_group.my_security_group.id
}
