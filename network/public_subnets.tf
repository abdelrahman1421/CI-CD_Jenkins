resource "aws_subnet" "terraform_public_subnet_a" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_a_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "Terraform Public Subnet A"
  }
}
