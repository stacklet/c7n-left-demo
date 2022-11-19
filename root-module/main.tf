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
