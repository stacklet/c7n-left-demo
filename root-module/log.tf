resource "aws_cloudwatch_log_group" "yada" {
  name = "Yada"

  tags = {
    Env = "Dev"
    Application = "serviceA"
  }
}
