variable "network_id" {
  description = "ID of the Docker network"
  type        = string
}

variable "mysql_host" {
  description = "MySQL container name"
  type        = string
}

variable "mysql_user" {
  description = "MySQL user"
  type        = string
  default     = "admin"
}

variable "mysql_password" {
  description = "MySQL password"
  type        = string
  default     = "password"
}

variable "mysql_database" {
  description = "MySQL database name"
  type        = string
  default     = "mylistdb"
}

resource "docker_image" "flask_app" {
  name = "flask-app:latest"
  keep_locally = true
}

resource "docker_container" "flask_app" {
  name  = "flask-app"
  image = docker_image.flask_app.name

  ports {
    internal = 5000
    external = 5000
  }

  networks_advanced {
    name = var.network_id
  }

  volumes {
    host_path      = "C:/Users/chand/Desktop/flask app/FlaskApp"
    container_path = "/app"
  }

  env = [
    "PYTHON_PATH=/app",
    "DB_HOST=${var.mysql_host}",
    "DB_USER=${var.mysql_user}",
    "DB_PASSWORD=${var.mysql_password}",
    "DB_NAME=${var.mysql_database}"
  ]

  command = [
    "/bin/sh",
    "-c",
    "echo 'Waiting for MySQL to be ready...' && sleep 15 && python /app/app.py"
  ]

  restart = "on-failure"
}
