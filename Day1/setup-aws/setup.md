## AWS Setup for Terraform

 prerequisites 

* Need an AWS Account ( can be free tier )

* Create an IAM Admin User - Go to IAM - USERS - Create a New User & Assign Administrator Access.

* Copy and Save the Access and Secret Keys carefully.

### Install AWS-CLI

apt-get update 
apt install python-pip 
pip install awscli 
pip install boto


* aws --version


### Run "aws configure " to setup credentials (optionally region, and output as Json). 
