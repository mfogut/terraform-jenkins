resource "aws_vpc" "jenkins_vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = var.tenancy

    tags = {
      "Name" = "Jenkins-${terraform.workspace}"
    }
}