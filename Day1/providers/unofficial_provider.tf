terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.14.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image
resource "docker_image" "ng" {
  name = "nginx:latest"
}

# Create a container
resource "docker_container" "con1" {
  image = docker_image.nginx.latest
  name  = "cont1"
}
