
provider "aws" {
  region     = "us-east-1"
 # access_key = "YOUR-KEY"
 # secret_key = "YOUR-KEY"
}


resource "aws_security_group" "sg1" {
  name        = "sgtest"
  description = "ingress traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH into VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "myec2" {
   ami = "ami-0747bdcabd34c712a"
   instance_type = "t2.micro"
   key_name = "terra"
   vpc_security_group_ids  = [aws_security_group.sg1.id]

   provisioner "remote-exec" {
     inline = [
       "sudo apt-get update",
       " sudo apt-get install -y  apache2",
     ]
   }
   provisioner "remote-exec" {
       when    = destroy
       inline = [
         "sudo apt-get remove -y apache2"
       ]
     }
   connection {
     type = "ssh"
     user = "ubuntu"
     private_key = file("./terra.pem")
     host = self.public_ip
   }
}

output "hostip" {
  value = aws_instance.myec2.public_ip
}


## By default, provisioners run when the resource they are defined within is created. Creation-time provisioners are only run during creation, not during updating or any other lifecycle. They are meant as a means to perform bootstrapping of a system.

## If a creation-time provisioner fails, the resource is marked as tainted. A tainted resource will be planned for destruction and recreation upon the next terraform apply. Terraform does this because a failed provisioner can leave a resource in a semi-configured state. Because Terraform cannot reason about what the provisioner does, the only way to ensure proper creation of a resource is to recreate it. This is tainting.

## You can change this behavior by setting the on_failure attribute

## Destroy provisioners are run before the resource is destroyed. If they fail, Terraform will error and rerun the provisioners again on the next terraform apply. Due to this behavior, care should be taken for destroy provisioners to be safe to run multiple times.

# Destroy-time provisioners can only run if they remain in the configuration at the time a resource is destroyed. If a resource block with a destroy-time provisioner is removed entirely from the configuration, its provisioner configurations are removed along with it and thus the destroy provisioner won't run. To work around this, a multi-step process can be used to safely remove a resource with a destroy-time provisioner.
