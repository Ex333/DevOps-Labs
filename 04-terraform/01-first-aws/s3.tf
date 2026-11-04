resource "aws_s3_bucket" "django_portfolio_MH" {
    bucket = "ex3-django-portfolio-MH"

    tags = {
        Name         = "Django Portfolio MH Storage"
        Environment  = "dev"
        Project      = "Ex3-DevOps"
    }
}


resource "aws_s3_bucket_public_access_block" "django_portfolio_MH" {
    bucket = aws_s3_bucket.django_portfolio_MH.id

    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}