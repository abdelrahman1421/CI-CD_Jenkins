resource "aws_security_group" "terraform_security_group" {
  name        = "Allow ALL Outbound"
  description = "Allow ALL Traffic Inbound"
  vpc_id      = var.vpc_id

  ingress {
    description = "ALL"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  
}
}