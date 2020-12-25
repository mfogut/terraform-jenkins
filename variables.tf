variable "aws_region" {
    default = "us-east-1"
}

variable "vpc_cidr" {
    default = "10.20.0.0/16"
}

variable "tenancy" {
    default = "default"
}

variable "public_subnet_cidr" {
    default = "10.20.1.0/16" 
}