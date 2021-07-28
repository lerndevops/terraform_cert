# Create a key file first, download


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
    source      = "test/myapp.conf" # This is file must be there in terraform local machine
    destination = "/tmp/myapp.conf" # inside the server that is being created

connection {
    type     = "ssh"
    user     = "ubuntu" #ec2-user if any linux 
#    password = "${var.root_password}" , if any pasword we can give
    host     = self.public_ip
    private_key = file("./terra.pem") # download key file to connect 
       }
 }

}

# https://www.terraform.io/docs/language/resources/provisioners/file.html
