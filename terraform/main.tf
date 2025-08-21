terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

provider "docker" {}

module "network" {
  source = "./modules/network"
}

module "mysql" {
  source     = "./modules/mysql"
  network_id = module.network.network_id
}

module "flask" {
  source        = "./modules/flask"
  network_id    = module.network.network_id
  mysql_host    = module.mysql.mysql_container_name

  depends_on = [
    module.mysql
  ]
}
