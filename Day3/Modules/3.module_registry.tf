provider aws {
  region = "us-east-1"
}

module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-cluster"
  instance_count         = 2
  ami                    = "ami-0747bdcabd34c712a"
  instance_type          = "t2.micro"
  key_name               = "terra"
  subnet_id              = "subnet-aa6030cc"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
  # https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest
  
  
