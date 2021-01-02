terraform {
    backend "s3" {
        bucket = "fatih-terraform-backup"
        key = "terraform.tfstate"
        region = var.region
        dynamodb_table = var.dynamodb_table
    }
}