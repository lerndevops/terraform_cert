#!/bin/bash
echo " Building the AMI "
packer build ami.json > result
export TF_VAR_amiid=$(tail -2 result | awk  '{print $2}')
echo " The AMI created and id is  $TF_VAR_amiid "
echo " Creating EC2 instance"
terraform init
terraform plan
terraform apply --auto-approve
