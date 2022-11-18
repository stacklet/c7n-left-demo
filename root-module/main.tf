provider "aws" {
  region = "us-east-2"
}

resource "aws_sqs_queue" "test_sqs" {
  name = uuid()
  sqs_managed_sse_enabled = true
  tags = {
    Environment = "Dev"
  }
}

module "s3" {
  source = "../modules/s3"
  bucket_name = "my-very-secure-bucket"
}

