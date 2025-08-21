resource "docker_network" "flask_network" {
  name = var.network_name
  driver = "bridge"
}

variable "network_name" {
  description = "Name of the Docker network"
  type        = string
  default     = "flask_network"
}

output "network_id" {
  value = docker_network.flask_network.id
  description = "ID of the created Docker network"
}
