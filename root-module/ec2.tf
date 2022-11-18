resource "aws_vpc" "dev-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Environment = "Dev"
  }
}

resource "aws_security_group" "ingress-all" {
  name   = "allow-all-sg"
  vpc_id = aws_vpc.dev-vpc.id

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = "Dev"
  }
}

resource "aws_instance" "foo" {
  ami           = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.ingress-all.id}"]
  tags = {
    Environment = "Dev"
  }
}

