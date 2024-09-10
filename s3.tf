resource "aws_s3_bucket" "bucket" {
  bucket = "grupo9-terraform-test"

  tags = {
    Name = "S3 Remote Terraform State Store"
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# resource "aws_s3_bucket_object_lock_configuration" "this" {
#   bucket              = aws_s3_bucket.bucket.id
#   object_lock_enabled = "Enabled"
# }