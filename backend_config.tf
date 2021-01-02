terraform {
    backend "s3" {
        bucket = var.s3_bucket
        key = var.key
        region = var.region
        dynamodb_table = var.dynamodb_table
    }
}