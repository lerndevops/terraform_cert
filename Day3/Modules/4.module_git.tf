# This is the Terraform Code in local

module "gitmodule" {
  source = "github.com/lerndevops/test-repo"
}
# Create a github repo with the name test-repo, put module souce code over there. 
  
  
# ec2.tf in git repo
  
  provider aws {
    region = "us-east-1"
  }
  
 resource "aws_instance" "test" {
  ami           = "ami-05692172625678b4e"
  instance_type = "t2.medium"
}
