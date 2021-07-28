provider "aws" {
#  access_key = "accesskey_here"
#  secret_key = "SECRET_KEY_HERE"
  region     = "us-east-1"
}

resource "aws_instance" "test" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  key_name = "terra"

provisioner "file" {
    source      = "/root/terraform-cert/setup-user.sh"
    destination = "/tmp/setup-user.sh"
}

provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/setup-user.sh",
      "sudo /tmp/setup-user.sh ",
    ]
  }
connection {
    type     = "ssh"
    user     = "ubuntu"
#    password = "${var.root_password}"
    host     = self.public_ip
    private_key = file("./terra.pem")
       }

}


# clone the repo to get setup-user.sh

## The remote-exec provisioner invokes a script on a remote resource after it is created. This can be used to run a configuration management tool, bootstrap into a cluster, etc.
# https://www.terraform.io/docs/language/resources/provisioners/remote-exec.html


