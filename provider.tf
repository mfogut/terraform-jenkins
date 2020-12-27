provider "aws" {
    region = "us-east-1"
}

terraform {
    backend "s3" {
        bucket = "fatih-terraform-backup1"
        key = "terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "tf-backup"
    }
}