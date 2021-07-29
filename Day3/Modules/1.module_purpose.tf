# Asim wants to create a ec2 .. here is his code

provider "aws" {
  region     = "us-east-1"
  access_key = "key"
  secret_key = "secret"
}

resource "aws_instance" "test-instances" {
  ami  = "ami-02aa7f3de34db391a"
  count = "4"
  instance_type = "t2.micro"
  key_name = "terra"
  tags = {
    Name = "test${count.index + 1}"
    training = "devops"
  }
}


## Aman (who is part of same team) also wants to create an instance.... here is his code

provider "aws" {
  region     = "us-east-1"
  access_key = "key"
  secret_key = "secret"
}

resource "aws_instance" "aman-instances" {
  ami  = "ami-02aa7f3de34db391a"
  count = "4"
  instance_type = "t2.micro"
  key_name = "terra"
  tags = {
    Name = "test${count.index + 1}"
    training = "devops"
  }
}



# just like we discussed variables re-use.. the same way we can use code too.

# What if 20 people want to create same resource ?? rather writing same resource multiple times.. define once use everywhere.

# https://learn.hashicorp.com/tutorials/terraform/module?in=terraform/modules
