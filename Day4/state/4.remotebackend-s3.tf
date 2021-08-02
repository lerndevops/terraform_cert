## Create a Bucket in s3 first

## backend.tf

terraform {
  backend "s3" {
    bucket = "learnleadbucket"
    key    = "remotetf"
    region = "us-east-1"
  }
}

 ## ec2.tf

provider aws {

  region = "us-east-1"
}

resource "aws_instance" "test" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
}

#terraform init
# terraform plan
# terraform apply

## Once we apply, we dont see local backend anymore... it will be saved in remote bucket created. 
