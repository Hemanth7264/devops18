resource "aws_s3_bucket" "one" {
  bucket = "hemanthflm1.devops1.project.bucket"
}

resource "aws_s3_bucket_ownership_controls" "two" {
  bucket = aws_s3_bucket.one.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "three" {
  depends_on = [aws_s3_bucket_ownership_controls.two]

  bucket = aws_s3_bucket.one.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "three" {
bucket = aws_s3_bucket.one.id
versioning_configuration {
status = "Enabled"
}
}
terraform {
backend "s3" {
region = "us-east-2"
bucket = "hemanthflm1.devops1.project.bucket"
key = "prod/terraform.tfstate"
}
}
