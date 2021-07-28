provider "aws" {
#  access_key = "accesskey_here"
#  secret_key = "SECRET_KEY_HERE"
  region     = "us-east-1"
}

resource "aws_instance" "cluster_member" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command =  " echo ${self.private_ip}  >> ips "
  }
}

## Provisioners can be used to model specific actions on the local machine or on a remote machine in order to prepare servers or other infrastructure objects for service.

## https://www.terraform.io/docs/language/resources/provisioners/syntax.html
