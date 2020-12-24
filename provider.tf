provider "aws" {
    region = var.aws_region
}

terraform {
    backend "s3" {
        bucket = "fatih-terraform-backup"
        key = "terraform.tfstate"
        region = var.aws_region
        dynamodb_table = "tf-backup"
    }
}