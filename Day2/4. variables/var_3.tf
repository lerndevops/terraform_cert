## FOR this example, create 2 different files with names given

# main.tf

provider "aws" {
  region     = "us-east-1"
#  access_key = "YOUR-ACCESS-KEY"
#  secret_key = "YOUR-SECRET-KEY"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0747bdcabd34c712a"
  instance_type = var.instancetype
}

## variables.tf
variable "instancetype" {

}

### terraform.tfvars

instancetype = "t2.micro"
