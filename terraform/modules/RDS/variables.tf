variable "instance_name" {
  type        = string
  description = "The name of the instance."
}

variable "instance_class" {
  type        = string
  description = "The class of the instance."
}

variable "allocated_storage" {
  type        = number
  description = "The allocated storage for the instance."
}

variable "db_name" {
  type        = string
  description = "The name of the database."
}

variable "username" {
  type        = string
  description = "The username for accessing the database."
}

variable "password" {
  type        = string
  description = "The password for accessing the database."
}

variable "port" {
  type        = number
  description = "The port number for database access."
}

variable "env_tag" {
  type        = string
  description = "The environment tag for the instance."
}

variable "delete_automated_backups" {
  type        = bool
  description = "Specify if automated backups should be deleted when the instance is deleted."
}

#to avoide an error while delation process.
variable "skip_final_snapshot" {
  type        = bool
  description = "Specify if a final snapshot should be skipped when the instance is deleted."
}

variable "publicly_accessible" {
  type        = bool
  description = "Specify if the instance should be publicly accessible."
}
