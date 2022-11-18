resource "aws_s3_bucket" "unencrypted-bucket" {
  bucket = "unencrypted-bucket"
  tags = {
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "unencrypted-bucket-with-exception" {
  bucket = "unencrypted-bucket"
  tags = {
    Environment = "Dev"
    encryption_exception = true
  }
}

resource "aws_s3_bucket" "encrypted-inline-bucket" {
  bucket = "encrypted-inline-bucket"

  server_side_encryption_configuration = {
    sse_algorithm     = "AES256"
  }

  tags = {
    Environment = "Prod"
  }
}
