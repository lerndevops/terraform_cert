provider "aws" {
  region     = "us-east-1"
#  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
#  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

resource "aws_instance" "myec2" {
   ami = "ami-0747bdcabd34c712a"
   instance_type = "t2.micro"
}

resource "aws_eip" "ip1" {
  vpc      = true
}

resource "aws_eip_association" "add-ip" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.ip1.id
}

output check1 {
  value = aws_eip.ip1.public_ip
}

output check2 {
  value = aws_instance.myec2.public_ip
}

## Run this 2 times to see check1 = check2
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association
