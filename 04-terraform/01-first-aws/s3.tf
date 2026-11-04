# 1. S3 BUCKET
resource "aws_s3_bucket" "django_portfolio_mh" {
  bucket = "ex3-django-portfolio"

  tags = {
    Name        = "Django Portfolio Storage"
    Environment = "dev"
    Project     = "Ex3-DevOps"
  }
}

# 2. BLOCK PUBLIC ACCESS
resource "aws_s3_bucket_public_access_block" "django_portfolio_mh" {
  bucket = aws_s3_bucket.django_portfolio_mh.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}