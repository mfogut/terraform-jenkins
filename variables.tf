variable "vpc_cidr" {
    default = "10.20.0.0/16"
}

variable "tenancy" {
    default = "default"
}

variable "public_subnet_cidr" {
    default = "10.20.1.0/24" 
}

variable "private_subnet_cidr" {
    default = "10.20.2.0/24" 
}

