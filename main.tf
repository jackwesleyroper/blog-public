terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.23.1"
    }
  }
}

provider "docker" {
  host = "tcp://localhost:2375"
  #host = "unix:///var/run/docker.sock" # Docker on ubuntu connection
}

# Creating a Docker Image ubuntu with the latest as the Tag.
resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}

# Creating a Docker Container using the latest ubuntu image.
resource "docker_container" "webserver" {
  image             = docker_image.ubuntu.latest
  name              = "terraform-docker-test"
  must_run          = true
  publish_all_ports = true
  command = [
    "tail",
    "-f",
    "/dev/null"
  ]
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "nginx-test"
  ports {
    internal = 80
    external = 8000
  }
}

resource "docker_network" "private_network" {
  name = "my_network"
}

# node should be a swarm manager. Use "docker swarm init" or "docker swarm join" to connect
#resource "docker_secret" "foo" {
#  name = "foo"
#  data = base64encode("{\"foo\": \"s3cr3t\"}")
#}

resource "docker_volume" "shared_volume" {
  name = "shared_volume"
}

#The source image must exist on the machine running the docker daemon.
#resource "docker_tag" "tag" {
#  source_image = "xxxx"
#  target_image = "xxxx"
#}