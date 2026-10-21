################################################################################
# Hot
################################################################################
resource "aws_s3_bucket" "hot" {
  bucket = "hot-e644ac91b5d2409382f2d6cc3188d932"
}

resource "aws_s3_bucket_public_access_block" "hot" {
  bucket = aws_s3_bucket.hot.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

################################################################################
# Cold
################################################################################
resource "aws_s3_bucket" "cold" {
  bucket = "cold-0e44a29894f144d69e7dc3ccd733c2ed"
}

resource "aws_s3_bucket_public_access_block" "cold" {
  bucket = aws_s3_bucket.cold.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
