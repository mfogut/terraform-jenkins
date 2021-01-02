terraform {
    backend "s3" {
        bucket = "fatih-terraform-backup"
        key = "terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "tf-backup"
    }
}