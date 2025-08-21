variable "network_id" {
  description = "ID of the Docker network"
  type        = string
}

variable "mysql_root_password" {
  description = "Root password for MySQL"
  type        = string
  default     = "password"
}

variable "mysql_database" {
  description = "Name of the MySQL database"
  type        = string
  default     = "mylistdb"
}

variable "mysql_user" {
  description = "MySQL user"
  type        = string
  default     = "admin"
}

variable "mysql_password" {
  description = "MySQL user password"
  type        = string
  default     = "password"
}

resource "docker_container" "mysql" {
  name  = "flask-mysql"
  image = "mysql:8.0"
  

  env = [
    "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}",
    "MYSQL_DATABASE=${var.mysql_database}",
    "MYSQL_USER=${var.mysql_user}",
    "MYSQL_PASSWORD=${var.mysql_password}",
    "MYSQL_HOST=%"  # Allow connections from any host
  ]

  ports {
    internal = 3306
    external = 3306
    protocol = "tcp"
  }

  networks_advanced {
    name = var.network_id
  }

  volumes {
    volume_name    = docker_volume.mysql_data.name
    container_path = "/var/lib/mysql"
  }
}

resource "docker_volume" "mysql_data" {
  name = "mysql_data"
}

output "mysql_container_name" {
  value = docker_container.mysql.name
}
