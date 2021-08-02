## Create a new folder for this example

## RUN artifactory ready , we can use  " docker play "
## docker run --name artifactory -d -p 8081:8081 lerndevops/jfrog-artifactory-oss:latest
## Open the URL.. username/password = admin/password
## Go to admin, create a new local repo (select generic, give anyname for the folder)

## backend.tf 

terraform {
  backend "artifactory" {
    username = "admin"
    password = "password"
    url      = "URL/artifactory"
    repo     = "mystate"
    subpath  = "devdata"
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
