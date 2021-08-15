provider "aws" {
#  access_key = "accesskey_here"
#  secret_key = "SECRET_KEY_HERE"
  region     = "us-east-1"
# version    = "2.7"
}

resource "aws_instance" "test1" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
}

#version    = "2.7"
#version    = ">= 2.7"
#version    = "<= 2.7"
#version    = ">=2.10,<=2.20"
#version    = "~= 2.7"

