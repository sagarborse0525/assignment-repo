resource "aws_kms_key" "secrets_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "app_bkt" {
  bucket = var.s3_bucket_name
  tags = {
    Name = "${var.prefix_name}-${var.env_name}-${var.s3_bucket_name}"
  }
}

resource "aws_s3_bucket_versioning" "app_bkt_versioning" {
  bucket = aws_s3_bucket.app_bkt.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "app_bkt_encryption" {
  bucket = aws_s3_bucket.app_bkt.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.secrets_key.arn
    }
  }
}

resource "aws_s3_bucket_public_access_block" "app_bkt_pab" {
  bucket = aws_s3_bucket.app_bkt.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}