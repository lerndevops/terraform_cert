# multi-provider.tf


resource "aws_instance" "first" {
  ami           = "ami-0747bdcabd34c712a"
  instance_type = "t2.micro"
  key_name = "terra"
}

resource "aws_instance" "second" {
  ami           = "ami-0747bdcabd34c712a"
  instance_type = "t2.micro"
  provider = aws.aws02
}

# providers.tf

provider "aws" {
  region     =  "us-east-1"
}

provider "aws" {
  alias      =  "aws02"
  region     =  "us-east-2"
}
