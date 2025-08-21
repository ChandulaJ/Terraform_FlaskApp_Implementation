variable "mysql_root_password" {
  description = "Root password for MySQL"
  type        = string
  default     = "rootpassword"
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
