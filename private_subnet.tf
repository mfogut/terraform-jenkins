resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.jenkins_vpc.id
  cidr_block = var.private_subnet_cidr

  tags = {
    Name = "Private-Subnet-${terraform.workspace}"
  }
}