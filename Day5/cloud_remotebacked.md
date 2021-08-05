### iam.tf
terraform {

  required_version = "~> 0.12.0"
  

  backend "remote" {}
  
}


resource "aws_iam_user" "user1" {

  name = "remoteuser"
  
  path = "/system/"
  
}

### backend.hcl

terraform {
  backend "remote" {
    organization = "leaddevops-org"

    workspaces {
      name = "tester"
    }
  }
}

#### commands

* terraform login

* terraform init -backend-config=backend.hcl

#### https://www.terraform.io/docs/backends/types/remote.html
