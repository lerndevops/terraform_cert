provider "aws" {
  region     = "us-east-1"
#  access_key = "YOUR-ACCESS-KEY"
#  secret_key = "YOUR-SECRET-KEY"
}

resource "aws_security_group" "test" {
  name        = "dev-group"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.client_addr]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.client_addr]
  }

}


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
