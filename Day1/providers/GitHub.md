### Pre-Requisite
### Make sure you create your GitHub account.
### Create Personal Access Token (https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token)
### GitHub Provider Terraform:
### https://registry.terraform.io/providers/integrations/github/latest/docs



terraform {

  required_providers {
  
    github = {
    
      source = "integrations/github"
      
      version = "4.12.2"
      
    }
    
  }
  
}


provider "github" {

  token = "your_token"
  
}


resource "github_repository" "repo1" {

  name        = "terra-repo1"
  

  visibility  = "private"
  

}




### Initialize and Apply:
* terraform init
* terraform plan
* terraform apply
