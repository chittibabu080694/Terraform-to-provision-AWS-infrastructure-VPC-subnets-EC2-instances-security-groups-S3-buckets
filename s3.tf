resource "aws_s3_bucket" "app_bucket" {
  bucket        = "my-terraform-app-bucket-${var.environment}-94"
  force_destroy = true

  tags = {
    Name = "${var.environment}-app-bucket"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.app_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.app_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
