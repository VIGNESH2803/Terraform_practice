resource "aws_s3_bucket" "s3-static-webbucket" {
  bucket = "03-static-webbucket${random_id.s3_random_suffix.hex}"
  force_destroy = true
  tags = {
    Name        = "My-bucket-static_web"
    Environment = "dev"
  }
}

resource "random_id" "s3_random_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket_public_access_block" "static_web_public_access_block" {

  bucket = aws_s3_bucket.s3-static-webbucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "static_web-public-read-static_web_public_readonly" {
  bucket = aws_s3_bucket.s3-static-webbucket.bucket
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "publicgetobject",
        "Effect" : "Allow",
        "Action" : "s3:GetObject",
        "Principal" : "*"
        "Resource" : "${aws_s3_bucket.s3-static-webbucket.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "staticwebconfig" {
  bucket = aws_s3_bucket.s3-static-webbucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

output "s3URL" {
  value = aws_s3_bucket_website_configuration.staticwebconfig.website_endpoint
}