# THis example demonstrates how to use/get data from list and map variables.

provider aws {
  region = "us-east-1"
}

resource "aws_instance" "instance1" {
  count         = 2
  ami           = "ami-05692172625678b4e"
  instance_type = "t2.micro"
#  instance_type = var.envi["dev"]
#  instance_type = var.testlist[1]
}

variable "testlist" {
   type = list
   default = ["t2.medium", "t3.small", "m5.large"]
}

variable "envi" {
  type = map
  default = {
    qa = "t2.medium"
    dev = "t3.small"
    prod = "m5.large"
  }
}


# run terraform plan and check instance_type. 
# uncomment each option test.
